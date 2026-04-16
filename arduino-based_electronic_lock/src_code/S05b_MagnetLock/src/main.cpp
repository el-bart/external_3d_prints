#include <Arduino.h>
#include <Servo.h>

#define PIN_HALL A0
#define PIN_SERVO 10
#define SERVO_OPEN 0
#define SERVO_CLOSED 90

Servo myServo;
int lastPos;

void moveServo(int pos) {
  // Connect to servo
  myServo.attach(PIN_SERVO);

  // Move servo to desired position
  myServo.write(pos);

  // Save the position as last known
  lastPos = pos;

  // Wait 500 ms for movemnent
  delay(500);

  // Disconnect from servo
  myServo.detach();
}

void setup() {
  // Setup hall sensor pin as input with pull-up
  pinMode(PIN_HALL, INPUT_PULLUP);
  
  // Close lock
  moveServo(SERVO_CLOSED);
}

void loop() {
  // Do nothing if lock is open
  if(lastPos == SERVO_OPEN) return;

  // Check status of Hall sensor
  bool sensorStatus = analogRead(PIN_HALL) < 512;

  // If magnet is present, open lock
  if(sensorStatus) moveServo(SERVO_OPEN);
}

