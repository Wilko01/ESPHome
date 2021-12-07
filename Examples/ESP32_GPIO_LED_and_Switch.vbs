Example configuration that was tested by me with an ESP32 and a LED with 3k resistor. Copy and paste the code below under all other code in the code field of the ESPHome device.
[Switch](hhttps://esphome.io/components/switch/gpio.html)
[Binary sensor](https://esphome.io/components/binary_sensor/gpio.html)
[Binary sensor component](https://esphome.io/components/binary_sensor/index.html#config-binary-sensor)

Connect a LED with ~3k resistor to GPIO 15
Connect a wire to GPIO02 and turn the light on and off by placing the other end of the wire to GND. 

#start code
switch:
  - platform: gpio
    pin:
      number: GPIO15
      inverted: false
    id: LED01
    name: led01 #by providing a name the Relay01 will become visible in Home Assistant under the name as described by name

binary_sensor:
  - platform: gpio
    pin: 
      number: GPIO2
      inverted: true
      mode:
        input: true
        pullup: true
    id: "Button"
    name: Button01 #by providing a name the button will become visible in Home Assistant
    
    on_press:
      then:
        - switch.turn_on: LED01
    on_release:
      then:
        - switch.turn_off: LED01
#end code
