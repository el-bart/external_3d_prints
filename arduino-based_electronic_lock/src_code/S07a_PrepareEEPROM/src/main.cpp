#include <Arduino.h>
#include <EEPROM.h>

void setup() {
  Serial.begin(9600);

  Serial.print("EEPROM size: ");
  Serial.print(EEPROM.length());
  Serial.println(" B");

  // Write default values to EEPROM
  Serial.print("Writing values to EEPROM...");
  EEPROM.update(0, 90);   // Lock position (closed)
  EEPROM.update(1, '1');  // First code number
  EEPROM.update(2, '2');  // Second code number
  EEPROM.update(3, '3');  // Third code number
  EEPROM.update(4, '4');  // Fourth code number
  Serial.println("OK");

  // Read values from EEPROM
  Serial.println("Reading values from EEPROM:");
  for (int i = 0; i < 5; i++) {
    byte val = EEPROM.read(i);
    Serial.print("0x");
    Serial.println(val, HEX);
  }
}

void loop() {
}
