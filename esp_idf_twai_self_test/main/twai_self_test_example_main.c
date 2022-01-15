#include <stdio.h>
#include <stdlib.h>
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "freertos/semphr.h"
#include "esp_err.h"
#include "esp_log.h"
#include "driver/twai.h"
#include "hal/twai_types.h"

/* --------------------- Definitions and static variables ------------------ */

//Example Configurations
#define TX_GPIO_NUM             5
#define RX_GPIO_NUM             4
#define TX_TASK_PRIO            8       //Sending task priority
#define RX_TASK_PRIO            9       //Receiving task priority
#define CTRL_TSK_PRIO           10      //Control task priority
#define MSG_ID                  0x555   //11 bit standard format ID
#define TWAI_MODE               TWAI_MODE_NORMAL // TWAI_MODE_NO_ACK
#define EXAMPLE_TAG             "TWAI Self Test"

static const twai_timing_config_t t_config = TWAI_TIMING_CONFIG_25KBITS(); //TWAI_TIMING_CONFIG_1MBITS();

//Filter all other IDs except MSG_ID
// static const twai_filter_config_t f_config = {.acceptance_code = (MSG_ID << 21),
//                                              .acceptance_mask = ~(TWAI_STD_ID_MASK << 21),
//                                              .single_filter = true};
static const twai_filter_config_t f_config = TWAI_FILTER_CONFIG_ACCEPT_ALL();
                                             

//Set to NO_ACK mode due to self testing with single module
static const twai_general_config_t g_config = TWAI_GENERAL_CONFIG_DEFAULT(TX_GPIO_NUM, RX_GPIO_NUM, TWAI_MODE);

static SemaphoreHandle_t parcel_semaphore_sender;
static SemaphoreHandle_t parcel_semaphore_receiver;

static SemaphoreHandle_t ctrl_sem;
static SemaphoreHandle_t done_sem;

/* --------------------------- Tasks and Functions -------------------------- */

static void twai_transmit_task(void *arg)
{
    twai_message_t tx_msg = {.data_length_code = 1, .identifier = MSG_ID, .self = 1};
    uint8_t dval = 0;

    while(true)
    {
        // Wait for the semaphore indefinitely
        if(xSemaphoreTake(parcel_semaphore_sender,portMAX_DELAY) == pdTRUE)
        {
            // Set dval to the low byte of our tickcount
            dval = (xTaskGetTickCount() & 0xff);

            //Transmit messages using self reception request
            tx_msg.data[0] = dval;
            ESP_ERROR_CHECK(twai_transmit(&tx_msg, portMAX_DELAY));

            // Chill
            vTaskDelay(pdMS_TO_TICKS(1));

            // Semaphore is not released, it gets released by receiver
            // Tell the receiver that they can look for a message now
            xSemaphoreGive(parcel_semaphore_receiver);
        }
    }

    // If we somehow got here...
    vTaskDelete(NULL);
}

static void twai_receive_task(void *arg)
{
    twai_message_t rx_message;
    int msgCounter = 0;

    while(true)
    {
        // Wait for receiver go
        if(xSemaphoreTake(parcel_semaphore_receiver,portMAX_DELAY) == pdTRUE)
        {
            // Receive message and print message data
            ESP_ERROR_CHECK(twai_receive(&rx_message, portMAX_DELAY));
            // Calculate tick delta
            int t1 = (xTaskGetTickCount() & 0xff);
            int tickDelta = t1 - rx_message.data[0];
            int tickDeltaMS = tickDelta * portTICK_PERIOD_MS;

            if(++msgCounter % 100 == 0)
            {
                ESP_LOGI(EXAMPLE_TAG, "Msg RX - data = %d, ticks %d, ms %d", rx_message.data[0], tickDelta, tickDeltaMS);
            }

            // Tell the sender to go again
            xSemaphoreGive(parcel_semaphore_sender);
        }
    }
    
    // If we somehow got here...
    vTaskDelete(NULL);
}

static void twai_control_task(void *arg)
{
    // Wait for driver to start
    xSemaphoreTake(ctrl_sem,portMAX_DELAY);

    //Start TWAI Driver for this iteration
    ESP_ERROR_CHECK(twai_start());
    ESP_LOGI(EXAMPLE_TAG, "Driver started");

    // Start the tasks, store handle to delete later
    TaskHandle_t xTaskTX = NULL;
    TaskHandle_t xTaskRX = NULL;
    xTaskCreatePinnedToCore(twai_receive_task, "TWAI_rx", 4096, NULL, RX_TASK_PRIO, &xTaskTX, tskNO_AFFINITY);    
    xTaskCreatePinnedToCore(twai_transmit_task, "TWAI_tx", 4096, NULL, TX_TASK_PRIO, &xTaskRX, tskNO_AFFINITY);

    // Give the transmitter the go signal
    xSemaphoreGive(parcel_semaphore_sender);

    // Let them run for a period of time, and then we will stop them
    // by taking their semaphores away
    vTaskDelay(pdMS_TO_TICKS(10000));

    // Stop
    ESP_LOGI(EXAMPLE_TAG, "stopping tx/rx tasks");
    vTaskSuspend(xTaskTX);
    vTaskSuspend(xTaskRX);

    // Delete 
    vTaskDelete(xTaskTX);
    vTaskDelete(xTaskRX);
    
    ESP_ERROR_CHECK(twai_stop());               //Stop the TWAI Driver
    ESP_LOGI(EXAMPLE_TAG, "Driver stopped");

    // done_sem terminates the program
    xSemaphoreGive(done_sem);
    vTaskDelete(NULL);
}

void app_main(void)
{
    //Create tasks and synchronization primitives
    ctrl_sem = xSemaphoreCreateBinary();
    done_sem = xSemaphoreCreateBinary();
    parcel_semaphore_sender = xSemaphoreCreateBinary();
    parcel_semaphore_receiver = xSemaphoreCreateBinary();

    xTaskCreatePinnedToCore(twai_control_task, "TWAI_ctrl", 4096, NULL, CTRL_TSK_PRIO, NULL, tskNO_AFFINITY);

    //Install TWAI driver
    ESP_ERROR_CHECK(twai_driver_install(&g_config, &t_config, &f_config));
    ESP_LOGI(EXAMPLE_TAG, "Driver installed");

    // Tell contorl task to start
    xSemaphoreGive(ctrl_sem);
    // Wait until done
    xSemaphoreTake(done_sem, portMAX_DELAY);

    //Uninstall TWAI driver
    ESP_ERROR_CHECK(twai_driver_uninstall());
    ESP_LOGI(EXAMPLE_TAG, "Driver uninstalled");

    //Cleanup
    vSemaphoreDelete(ctrl_sem);
    vSemaphoreDelete(parcel_semaphore_sender);
    vSemaphoreDelete(parcel_semaphore_receiver);
    vSemaphoreDelete(done_sem);
    // vQueueDelete(done_sem);
}
