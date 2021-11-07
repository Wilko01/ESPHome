Example configuration that was tested by me with an ESP32 and a SSD1306. Copy and paste the code below under all other code in the code field of the ESPHome device.


#start code
#specify the connection to the SSD1306
#Connect to the GND and 3,3 but better to 5V
i2c:
  sda: 16
  scl: 17
  scan: true #Will display the i2C address

font:
  - file: 'arial.ttf' #this font file needs to be uploaded to the Home Assistant folder /config/esphome
    id: font1
    size: 8
    
  - file: 'BebasNeue-Regular.ttf'
    id: font2
    size: 48
    
  - file: 'slkscr.ttf'
    id: font3
    size: 14

#Aquire the hte value from the entity in Home Assistant
sensor:
  - platform: homeassistant
    id: TH10
    entity_id: sensor.temperature_158d0005782421
    internal: true

display:
  - platform: ssd1306_i2c
    model: "SSD1306 128x64"
    reset_pin: 0
    address: 0x3C
    contrast: 60%
#Make sure taht there is no comment after the following line with 'lambda' as it will lead to errors
    lambda: |-
      it.printf(0, 0, id(font1), "TH10 kleine kamer");
      if (id(TH10).has_state()) {
        it.printf(127, 23, id(font3), TextAlign::TOP_RIGHT , "%.1f°", id(TH10).state);
      }
#Print the value of the temperature sensor which is gained from Home Assistant
#Print the text at column 0 and row 60
#end code
