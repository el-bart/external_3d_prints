#include <Arduino.h>
#define PIN_HALL A0

void setup() {
  // Setup hall sensor pin as input with pull-up
  pinMode(PIN_HALL, INPUT_PULLUP);

  // Setup built-in LED pin as output
  pinMode(LED_BUILTIN, OUTPUT);

  // Setup serial communication for debugging
  Serial.begin(9600);
  
}

void loop() {
  // Read value from hall sensor
  int hallValue = analogRead(PIN_HALL);

  // Convert to boolean
  bool hallStatus = hallValue < 512;

  Serial.println(hallValue);

  // Light up LED when magnet is in range
  digitalWrite(LED_BUILTIN, hallStatus);
}
