Programming language used: C


#include <stdio.h>
#include <string.h>
#include "driver/gpio.h"
#include "driver/uart.h"
#include <correct.h>
void app_main()
{
        gpio_set_direction(GPIO_NUM_17, GPIO_MODE_OUTPUT); //assumed we are using pin 17
        gpio_set_level(GPIO_NUM_17, 0);
        uart_config_t uart_config = 
        {
                .baud_rate = 115200,
                .data_bits = UART_DATA_8_BITS,
                .parity = UART_PARITY_DISABLE,
                .stop_bits = UART_STOP_BITS_1,
                .flow_ctrl = UART_HW_FLOWCTRL_DISABLE
        };
        uart_param_config(UART_NUM_1, &uart_config);
        uart_driver_install(UART_NUM, 128, 0, 0, NULL, 0);
        char *hello = "HELLO\n";
        uart_write_bytes(UART_NUM_1, hello, 6);
        uint8_t buf[128] = {0};
        int l1 = uart_read_bytes(UART_NUM_1, buf, 128, pdMS_TO_TICKS(3000));
        if (l1<=0 || strncmp(buf, "ACK", 3) != 0)
                return;
        gpio_config_t io_conf = 
        {
                .pin_bit_mask = (1ULL << GPIO_NUM_4), //assumed the START button is connected to pin 4
                .mode = GPIO_MODE_INPUT,
                .pull_up_en = GPIO_PULLUP_DISABLE, //assumed the pin is LOW initially, waiting until pin is HIGH
                .pull_down_en = GPIO_PULLUP_ENABLE,
                .intr_type = GPIO_INTR_DISABLE
        };
        gpio_config(&io_conf);
        while(gpio_get_level(START_BUTTON_GPIO) == 0)
                vTaskDelay(pdMS_TO_TICKS(10));
        char *ready = "READY\n";
        uart_write_bytes(UART_NUM_1, ready, 6);
        buf = {0};
        l2 = uart_read_bytes(UART_NUM_1, buf, 128, pdMS_TO_TICKS(3000));
        if (l2 <= 0 || strncmp(buf, "PASSWORD:", 9) != 0)
                return;
        char *pass = buf + 9;
        gpio_set_level(GPIO_NUM_17, 1);


}