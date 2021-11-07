Example configuration that was tested by me with an ESP326. Copy and paste the code below under all other code in the code field of the ESPHome device. Touch pin 27 to see the state change in the log.
[Info of ESP32 Touch Pa](https://esphome.io/components/binary_sensor/esp32_touch.html#esp32-touch-binary-sensor)

esphome:
  name: esp18
  platform: ESP32
  board: esp32doit-devkit-v1


#start code
esp32_touch:
  setup_mode: false #true shows debug messages in the log and enables to see the intensity of the touch action. 
                   #Make sure to set to false once setup to limit the log spam

binary_sensor:
  - platform: esp32_touch
    name: "ESP32 Touch Pad GPIO27"
    pin: GPIO27
    threshold: 400
#end code