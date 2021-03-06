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
    size: 16


display:
  - platform: ssd1306_i2c
    model: "SSD1306 128x64"
    reset_pin: 0
    address: 0x3C
    contrast: 60%
#Make sure taht there is no comment after the following line with 'lambda' as it will lead to errors
    lambda: |-
      it.printf(64, 31, id(font1), TextAlign::TOP_CENTER, "Test");
#Print the text at column 64 and row 31
#end code
