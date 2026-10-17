# ESP Experiments

Terminal-only experiments for the ESP-12E ESP8266 NodeMCU and ESP32-CAM.
Record observed results and failures here as each experiment is completed.

## Boards and SDKs

| Board | Chip | SDK |
|---|---|---|
| NodeMCU ESP-12E ESP8266MOD | ESP8266 | ESP8266_RTOS_SDK |
| ESP32-CAM | ESP32 | ESP-IDF |

Keep each experiment's source, build configuration, wiring notes, and serial
logs with its project. Record SDK versions and the serial device used.

## Result record

For each experiment, fill in:
- Date and board:
- SDK version:
- Build and flash:
- Observed behavior:
- Measurements:
- Problems and next step:

Do not mark an experiment complete until the behavior has been tested on the
listed board and the result is recorded.

## Catalogue

Status values: `NOT STARTED`, `IN PROGRESS`, `BLOCKED`, `DONE`.

| ID | Experiment | Board | Status | Result |
|---|---|---|---|---|
| 01 | Terminal toolchain: build, flash, and read boot logs | Both | NOT STARTED | |
| 02 | GPIO output: blink an LED; document pin and polarity | Both | NOT STARTED | |
| 03 | GPIO input: button, debounce, and state reporting | Both | NOT STARTED | |
| 04 | Timers: periodic work and timing measurements | Both | NOT STARTED | |
| 05 | FreeRTOS tasks: scheduling, priorities, delays, and stack use | Both | NOT STARTED | |
| 06 | Queues: producer/consumer, full-queue behavior, and backpressure | Both | NOT STARTED | |
| 07 | Synchronization: notifications, mutexes, event groups, and watchdog recovery | Both | NOT STARTED | |
| 08 | Wi-Fi station: scan, connect, disconnect, and reconnect | Both | NOT STARTED | |
| 09 | Wi-Fi provisioning: configure credentials without embedding them in source | Both | NOT STARTED | |
| 10 | UDP telemetry: send measurements and detect packet loss | Both | NOT STARTED | |
| 11 | TCP service: parse messages, handle timeouts, and survive disconnects | Both | NOT STARTED | |
| 12 | MQTT: publish state, receive commands, and reconnect after broker failure | Both | NOT STARTED | |
| 13 | TLS: validate a server certificate and test failed validation | Both | NOT STARTED | |
| 14 | OTA update: install an update and test recovery from a failed update | Both | NOT STARTED | |
| 15 | ESP32-CAM capture: capture and store an image; record memory and errors | ESP32-CAM | NOT STARTED | |
| 16 | ESP32-CAM streaming: stream frames while keeping control responsive | ESP32-CAM | NOT STARTED | |
| 17 | Capstone: configurable camera node with telemetry, protected streaming, OTA, and recovery | ESP32-CAM | NOT STARTED | |

## Terminal workflow

Use the SDK's terminal environment and build tools; no Arduino IDE is needed.
Record the exact commands that work for each board and serial port. For
ESP-IDF projects, the usual workflow is `idf.py build`, `idf.py -p PORT flash`,
and `idf.py -p PORT monitor`. Use the ESP8266_RTOS_SDK's corresponding build
and flash workflow for the NodeMCU.

Check the ESP32-CAM board's pinout and power requirements before wiring or
flashing. Record any USB-to-UART adapter and boot-mode steps used.