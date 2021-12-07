Example configuration that was tested by me. Copy and paste the code below under all other code in the code field of the ESPHome device.
[Automations and if then else](https://esphome.io/guides/automations.html#config-lambda)
[Switch](hhttps://esphome.io/components/switch/gpio.html)
[Binary sensor](https://esphome.io/components/binary_sensor/gpio.html)
[Binary sensor component](https://esphome.io/components/binary_sensor/index.html#config-binary-sensor)

..
#Pay special attention to the indenting
#start code
time:
  - platform: homeassistant
    id: homeassistant_time

    on_time:
      - seconds: 0  # needs to be set, otherwise every second this is triggered!
        minutes: '*'  # Every minute
        then:
          lambda: !lambda |-
            if (id(CV_Floor_Pump_Temp_In).has_state() >= 44) {
              id(Relay01).turn_off();
              //Send alarm!!!!!!!!!!!!!!!!
              }
            else {
                if ((id(homeassistant_time).now().hour >= 06) and (id(homeassistant_time).now().hour <= 20)) {
                  if (id(CV_Floor_Pump_Temp_In).has_state() >= 40) {
                    id(Relay01).turn_off();
                    } 
                else {
                  
                  }  
                }
            }            
            
#end code
