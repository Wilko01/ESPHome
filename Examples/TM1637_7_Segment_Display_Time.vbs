Example configuration that was tested by me with an NodeMCU V3. Copy and paste the code below under all other code in the code field of the ESPHome device. The time will be retrieved from Home Assistant and displayed at the TM1637 LED.
[Info of TM1637 7-Segment Display](https://esphome.io/components/display/tm1637.html?highlight=tm1637)
[Info of TM1637 7-Segment Display](https://esphome.io/components/display/tm1637.html?highlight=tm1637)

esphome:
  name: esp18
  platform: ESP32
  board: esp32doit-devkit-v1


#start code
# Get time from Home Assistant
time:
    - platform: homeassistant
      id: homeassistant_time


# TM1637
display:
    platform: tm1637
    id: tm1637_display
    clk_pin: D4
    dio_pin: D3
    intensity: 1 # Ranging from 0 - 7
    #Make sure that any comment in the lambda code block is started with // as all
    #  code in the block is C++.
    lambda: |-
      it.strftime("%H.%M", id(homeassistant_time).now());
#end code