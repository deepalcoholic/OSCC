project(kia-soul-steering)

set(ARDUINO_DEFAULT_BOARD uno)
SET(ARDUINO_DEFAULT_PORT ${SERIAL_PORT_STEERING})
set(ARDUINO_DEFAULT_BAUDRATE ${SERIAL_BAUD_STEERING})

add_definitions(-DSERIAL_BAUD=${ARDUINO_DEFAULT_BAUDRATE})

add_custom_target(
    kia-soul-steering-monitor
    COMMAND screen ${ARDUINO_DEFAULT_PORT} ${ARDUINO_DEFAULT_BAUDRATE})

add_custom_target(
    kia-soul-steering-monitor-log
    COMMAND screen -L ${ARDUINO_DEFAULT_PORT} ${ARDUINO_DEFAULT_BAUDRATE})

generate_arduino_firmware(
    kia-soul-steering
    SRCS
    ${CMAKE_SOURCE_DIR}/common/libs/arduino_init/arduino_init.cpp
    ${CMAKE_SOURCE_DIR}/common/libs/DAC_MCP49xx/DAC_MCP49xx.cpp
    ${CMAKE_SOURCE_DIR}/common/libs/mcp_can/mcp_can.cpp
    ${CMAKE_SOURCE_DIR}/common/libs/pid/oscc_pid.cpp
    ${CMAKE_SOURCE_DIR}/common/libs/serial/oscc_serial.cpp
    ${CMAKE_SOURCE_DIR}/common/libs/can/oscc_can.cpp
    ${CMAKE_SOURCE_DIR}/common/libs/time/oscc_time.cpp
    ${CMAKE_SOURCE_DIR}/common/libs/dac/oscc_dac.cpp
    ${CMAKE_SOURCE_DIR}/common/libs/signal_smoothing/oscc_signal_smoothing.cpp
    src/main.cpp
    src/globals.cpp
    src/init.cpp
    src/communications.cpp
    src/steering_control.cpp)

target_include_directories(
    kia-soul-steering
    PRIVATE
    include
    ${CMAKE_SOURCE_DIR}/common/include
    ${CMAKE_SOURCE_DIR}/common/libs/arduino_init
    ${CMAKE_SOURCE_DIR}/common/libs/DAC_MCP49xx
    ${CMAKE_SOURCE_DIR}/common/libs/mcp_can
    ${CMAKE_SOURCE_DIR}/common/libs/pid
    ${CMAKE_SOURCE_DIR}/common/libs/serial
    ${CMAKE_SOURCE_DIR}/common/libs/can
    ${CMAKE_SOURCE_DIR}/common/libs/time
    ${CMAKE_SOURCE_DIR}/common/libs/dac
    ${CMAKE_SOURCE_DIR}/common/libs/signal_smoothing)
