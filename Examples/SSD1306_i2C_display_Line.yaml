Example configuration that was tested by me with an ESP32 and a SSD1306. Copy and paste the code below under all other code in the code field of the ESPHome device.
Lines, circles, etc: [More info](https://esphome.io/components/display/index.html)

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

display:
  - platform: ssd1306_i2c
    model: "SSD1306 128x64"
    reset_pin: 0
    address: 0x3C
    contrast: 60%
    lambda: |-
      it.line(0, 0, 100, 50);
#Print the value of the temperature sensor which is gained from Home Assistant
#Print the text at column 0 and row 60
#end code
