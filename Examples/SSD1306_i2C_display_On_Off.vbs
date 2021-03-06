Example configuration that was tested by me with an ESP32 and a SSD1306. Copy and paste the code below under all other code in the code field of the ESPHome device.


#First code block which needs to be at the start of the code as it is related
#  to the boot process. Copy and past only the on_boot part and not the esphome
#  name, platform and board
esphome:
  name: esp18
  platform: ESP32
  board: esp32doit-devkit-v1
  on_boot:
    priority: -100 #lowest priority so start last
    then:
      - lambda: id(display01).turn_off();
#End first code block


#start code
#specify the connection to the SSD1306
#Connect to the GND and 3,3 but better to 5V
i2c:
  sda: 18
  scl: 19
  scan: true #Will display the i2C address

font:
  - file: 'arial.ttf' #this font file needs to be uploaded to the Home Assistant folder /config/esphome
    id: font1
    size: 16

binary_sensor: # connect the pin to GND to active the code
  - platform: gpio
    name: "Button"
    internal: true
    pin:
      number: 27
      mode: INPUT_PULLUP
    on_release:
      - lambda: id(display01).turn_on();
      - delay: 10s
      - lambda: id(display01).turn_off();

display:
  - platform: ssd1306_i2c
    model: "SSD1306 128x64"
    id: display01
    reset_pin: 0
    address: 0x3C
    contrast: 60%
#Make sure that any comment in the lambda code block is started with // as all
#  code in the block is C++.
    lambda: |-
      //Annotation in the C++ code block
      it.printf(64, 31, id(font1), TextAlign::TOP_CENTER, "Test");
#Print the text at column 64 and row 31
#end code