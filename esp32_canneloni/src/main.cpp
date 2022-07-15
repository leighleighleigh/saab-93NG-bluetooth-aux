#include <WiFi.h>
#include <lwip/sockets.h>
#include <lwip/netdb.h>
#include <errno.h>
#include <SPI.h>
#include <mcp2515.h>

////////////////////////////////////////////////////////////////////////////////
//                                                                            //
//                           START OF CONFIGURATION                           //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////

const char *networkName = "Belong7DC9C8";
const char *networkPswd = "axk37jbtd64y";

const char *udpRemoteAddress = "laptop";
const int udpLocalPort = 20000;
const int udpRemotePort = 20000;

const int canSpeed = 100E3;
const int serialSpeed = 115200; // for debug output

////////////////////////////////////////////////////////////////////////////////
//                                                                            //
//                            END OF CONFIGURATION                            //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////

/* controller area network (CAN) kernel definitions */
// typedef uint32_t canid_t;

/* special address description flags for the CAN_ID */
#define CAN_EFF_FLAG 0x80000000U /* EFF/SFF is set in the MSB */
#define CAN_RTR_FLAG 0x40000000U /* remote transmission request */
#define CAN_ERR_FLAG 0x20000000U /* error message frame */

/* valid bits in CAN ID for frame formats */
#define CAN_SFF_MASK 0x000007FFU /* standard frame format (SFF) */
#define CAN_EFF_MASK 0x1FFFFFFFU /* extended frame format (EFF) */
#define CAN_ERR_MASK 0x1FFFFFFFU /* omit EFF, RTR, ERR flags */

#define CANFD_MAX_DLEN 64
struct canfd_frame
{
    canid_t can_id; /* 32 bit CAN_ID + EFF/RTR/ERR flags */
    uint8_t len;    /* frame payload length in byte */
    uint8_t flags;  /* additional flags for CAN FD */
    uint8_t __res0; /* reserved / padding */
    uint8_t __res1; /* reserved / padding */
    uint8_t data[CANFD_MAX_DLEN] __attribute__((aligned(8)));
};

/* Base size of a canfd_frame (canid + dlc) */
#define CANNELLONI_FRAME_BASE_SIZE 5
/* Size in byte of UDPDataPacket */
#define CANNELLONI_DATA_PACKET_BASE_SIZE 5

#define CANNELLONI_FRAME_VERSION 2
#define CANFD_FRAME 0x80

enum op_codes
{
    DATA,
    ACK,
    NACK
};
enum state
{
    STARTING,
    DISCONNECTED,
    CONNECTING,
    CONNECTED
};

struct __attribute__((__packed__)) CannelloniDataPacket
{
    /* Version */
    uint8_t version;
    /* OP Code */
    uint8_t op_code;
    /* Sequence Number */
    uint8_t seq_no;
    /* Number of CAN Messages in this packet */
    uint16_t count;
};

int udp_socket;
enum state state = STARTING;
uint8_t seqNo = 0;
struct sockaddr_in remoteAddress;
#define PACKET_BUFFER_LEN 1460
uint8_t udpBufferTx[PACKET_BUFFER_LEN];
uint8_t udpBufferRx[PACKET_BUFFER_LEN];

#define FRAME_BUFFER_LEN 16

struct framebuffer
{
    int idx;
    struct canfd_frame buffer[FRAME_BUFFER_LEN];
};

struct framebuffer framebuffer_rx0;
struct framebuffer framebuffer_rx1;
struct framebuffer *framebuffer_rx;
struct framebuffer *framebuffer_rx_second;

struct can_frame canMsg;
struct can_frame rxMsg;
struct can_frame txMsg;
MCP2515 mcp2515(5);

void WiFiEvent(WiFiEvent_t event);
void swapBuffers();
uint8_t *buildPacket(uint16_t len, uint8_t *packetBuffer,
                     canfd_frame *frames, int numFrames, uint8_t seqNo);
void CANonReceive(int packetSize);
void CANsend(canfd_frame *frame, bool success);
int parseFrames(uint16_t len, const uint8_t *buffer,
                std::function<void(canfd_frame *, bool)> frameReceiver);
void connectToWiFi(const char *ssid, const char *pwd);

void setup()
{
    Serial.begin(serialSpeed);
    while (!Serial)
        ;

    Serial.printf("Cannelloni server, listening on port %d, sending to %s:%d",
                  udpLocalPort, udpRemoteAddress, udpRemotePort);
    Serial.println();

    SPI.begin();
    mcp2515.reset();
    mcp2515.setBitrate(CAN_33KBPS, CAN_CLOCK::MCP_8MHZ);
    mcp2515.setNormalMode();

    framebuffer_rx = &framebuffer_rx0;
    framebuffer_rx_second = &framebuffer_rx1;

    // register the receive callback
    // CAN.onReceive(CANonReceive);

    state = DISCONNECTED;
    connectToWiFi(networkName, networkPswd);
    mcp2515.setLoopbackMode();
}

unsigned long sendTime = 1000;

void loop()
{
  if(millis() - sendTime > 1000)
  {
    canMsg.can_dlc = 8;
    canMsg.can_id = 0x66;
    canMsg.data[0] = millis()>>56;
    canMsg.data[1] = millis()>>48;
    canMsg.data[2] = millis()>>40;
    canMsg.data[3] = millis()>>32;
    canMsg.data[4] = millis()>>24;
    canMsg.data[5] = millis()>>16;
    canMsg.data[6] = millis()>>8;
    canMsg.data[7] = millis()>>0;
    mcp2515.sendMessage(&canMsg);
    sendTime = millis();
  }

  if (mcp2515.readMessage(&rxMsg) == MCP2515::ERROR_OK)
  {
    CANonReceive(rxMsg.can_dlc);
  }

    if (state == CONNECTED)
    {
        swapBuffers();
        if (framebuffer_rx_second->idx > 0)
        {

            uint8_t *pktEnd = buildPacket(PACKET_BUFFER_LEN, udpBufferTx,
                                          framebuffer_rx_second->buffer, framebuffer_rx_second->idx, seqNo++);
            size_t pktLen = pktEnd - udpBufferTx;

            int sent = sendto(udp_socket, udpBufferTx, pktLen, 0,
                              (struct sockaddr *)&remoteAddress, sizeof(remoteAddress));
            if (sent < 0)
            {
                Serial.printf("could not send data: %d", errno);
                Serial.println();
                return;
            }

            framebuffer_rx_second->idx = 0;
        }

        struct sockaddr_in rcvdAddress;
        size_t rcvdAddrSize = sizeof(rcvdAddress);
        int rcvd = recvfrom(udp_socket, udpBufferRx, PACKET_BUFFER_LEN, 0,
                            (struct sockaddr *)&rcvdAddress, &rcvdAddrSize);

        if (rcvd > 0)
        {
            parseFrames((uint16_t)rcvd, udpBufferRx, CANsend);
        }
    }
}

void swapBuffers()
{
    struct framebuffer *tmp;
    noInterrupts();
    tmp = framebuffer_rx;
    framebuffer_rx_second = framebuffer_rx;
    framebuffer_rx = framebuffer_rx_second;
    interrupts();
}

void CANonReceive(int packetSize)
{
    if (state != CONNECTED)
        return;

    Serial.printf("rx msg ID 0x%x\n",rxMsg.can_id);

    long id = rxMsg.can_id;
    int dlc = rxMsg.can_dlc;
    bool extended = false;
    bool rtr = false;

    if (framebuffer_rx->idx >= FRAME_BUFFER_LEN)
    {
        Serial.println("RX framebuffer is full.");
        return;
    }

    struct canfd_frame *frame = &framebuffer_rx->buffer[framebuffer_rx->idx++];
    frame->can_id = (canid_t)id | (rtr ? CAN_RTR_FLAG : 0) | (extended ? CAN_EFF_FLAG : 0);
    frame->len = (uint8_t)dlc;
    frame->flags = 0;

    for (int i = 0; i<dlc; i++)
    {
        frame->data[i] = rxMsg.data[i];
    }
}

void CANsend(canfd_frame *frame, bool success)
{
    txMsg.can_id = frame->can_id;

    Serial.printf("tx msg ID 0x%x\n",txMsg.can_id);

    for (int i = 0; i < frame->len; i++)
    {
        txMsg.data[i] = frame->data[i];
    }
    txMsg.can_dlc = frame->len;
}

/* Helper function to get the real length of a frame */
inline uint8_t canfd_len(const struct canfd_frame *f)
{
    return f->len & ~(CANFD_FRAME);
}

uint8_t *buildPacket(uint16_t len, uint8_t *packetBuffer,
                     canfd_frame *frames, int numFrames, uint8_t seqNo)
{

    uint16_t frameCount = 0;
    uint8_t *data = packetBuffer + CANNELLONI_DATA_PACKET_BASE_SIZE;
    for (int it = 0; it < numFrames; it++)
    {
        canfd_frame *frame = &frames[it];
        /* Check for packet overflow */
        if ((data - packetBuffer + CANNELLONI_FRAME_BASE_SIZE + canfd_len(frame) + ((frame->len & CANFD_FRAME) ? sizeof(frame->flags) : 0)) > len)
        {
            return NULL;
        }
        canid_t tmp = htonl(frame->can_id);
        memcpy(data, &tmp, sizeof(tmp));
        /* += 4 */
        data += sizeof(tmp);
        *data = frame->len;
        /* += 1 */
        data += sizeof(frame->len);
        /* If this is a CAN FD frame, also send the flags */
        if (frame->len & CANFD_FRAME)
        {
            *data = frame->flags;
            /* += 1 */
            data += sizeof(frame->flags);
        }
        if ((frame->can_id & CAN_RTR_FLAG) == 0)
        {
            memcpy(data, frame->data, canfd_len(frame));
            data += canfd_len(frame);
        }
        frameCount++;
    }
    struct CannelloniDataPacket *dataPacket;
    dataPacket = (struct CannelloniDataPacket *)(packetBuffer);
    dataPacket->version = CANNELLONI_FRAME_VERSION;
    dataPacket->op_code = DATA;
    dataPacket->seq_no = seqNo;
    dataPacket->count = htons(frameCount);

    return data;
}

int parseFrames(uint16_t len, const uint8_t *buffer,
                std::function<void(canfd_frame *, bool)> frameReceiver)
{
    const struct CannelloniDataPacket *data;
    /* Check for OP Code */
    data = reinterpret_cast<const struct CannelloniDataPacket *>(buffer);
    if (data->version != CANNELLONI_FRAME_VERSION)
        return 1;

    if (data->op_code != DATA)
        return 2;

    if (ntohs(data->count) == 0)
        return 0; // Empty packets silently ignored

    const uint8_t *rawData = buffer + CANNELLONI_DATA_PACKET_BASE_SIZE;

    for (uint16_t i = 0; i < ntohs(data->count); i++)
    {
        if (rawData - buffer + CANNELLONI_FRAME_BASE_SIZE > len)
            return 3;

        /* We got at least a complete canfd_frame header */
        canfd_frame frame_;
        canfd_frame *frame = &frame_;
        if (!frame)
            return 4;

        canid_t tmp;
        memcpy(&tmp, rawData, sizeof(tmp));
        frame->can_id = ntohl(tmp);
        /* += 4 */
        rawData += sizeof(canid_t);
        frame->len = *rawData;
        /* += 1 */
        rawData += sizeof(frame->len);
        /* If this is a CAN FD frame, also retrieve the flags */
        if (frame->len & CANFD_FRAME)
        {
            frame->flags = *rawData;
            /* += 1 */
            rawData += sizeof(frame->flags);
        }
        /* RTR Frames have no data section although they have a dlc */
        if ((frame->can_id & CAN_RTR_FLAG) == 0)
        {
            /* Check again now that we know the dlc */
            if (rawData - buffer + canfd_len(frame) > len)
            {
                frame->len = 0;
                frameReceiver(frame, false);

                return 5;
            }

            memcpy(frame->data, rawData, canfd_len(frame));
            rawData += canfd_len(frame);
        }

        frameReceiver(frame, true);
    }
}


void connectToWiFi(const char *ssid, const char *pwd)
{
    Serial.println("Connecting to WiFi network: " + String(ssid));

    // delete old config
    WiFi.disconnect(true);
    // register event handler
    WiFi.onEvent(WiFiEvent);

    state = CONNECTING;
    // Initiate connection
    WiFi.begin(ssid, pwd);

    Serial.println("Waiting for WIFI connection...");
}

// wifi event handler
void WiFiEvent(WiFiEvent_t event)
{
    switch (event)
    {
    case SYSTEM_EVENT_STA_GOT_IP:
    {
        // When connected set
        IPAddress localIPAddress = WiFi.localIP();
        Serial.print("WiFi connected! IP address: ");
        Serial.println(localIPAddress);

        if ((udp_socket = socket(AF_INET, SOCK_DGRAM, 0)) == -1)
        {
            Serial.printf("could not create socket: %d", errno);
            Serial.println();
            return;
        }

        int yes = 1;
        if (setsockopt(udp_socket, SOL_SOCKET, SO_REUSEADDR, &yes, sizeof(yes)) < 0)
        {
            Serial.printf("could not set socket option: %d", errno);
            Serial.println();
            return;
        }

        struct sockaddr_in addr;
        memset((char *)&addr, 0, sizeof(addr));
        addr.sin_family = AF_INET;
        addr.sin_port = htons(udpLocalPort);
        addr.sin_addr.s_addr = (in_addr_t)localIPAddress;
        if (bind(udp_socket, (struct sockaddr *)&addr, sizeof(addr)) == -1)
        {
            Serial.printf("could not bind socket: %d", errno);
            Serial.println();
            return;
        }
        fcntl(udp_socket, F_SETFL, O_NONBLOCK);

        struct hostent *server;
        server = gethostbyname(udpRemoteAddress);
        if (server == NULL)
        {
            Serial.printf("could not get host from dns: %d", errno);
            Serial.println();
            return;
        }
        IPAddress remoteIPAddress = IPAddress((const uint8_t *)(server->h_addr_list[0]));
        Serial.println("IP of target obtained.");

        remoteAddress.sin_addr.s_addr = (canid_t)remoteIPAddress;
        remoteAddress.sin_family = AF_INET;
        remoteAddress.sin_port = htons(udpRemotePort);

        state = CONNECTED;
    }
    break;
    case SYSTEM_EVENT_STA_DISCONNECTED:
    {
        Serial.println("WiFi lost connection");
        state = DISCONNECTED;
    }
    break;
    }
}