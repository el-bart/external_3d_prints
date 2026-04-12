#include <Servo.h>

#define PIN_HALL A0
#define PIN_SERVO 10
#define SERVO_OPEN 0
#define SERVO_CLOSED 90
#define OPEN_TIME 5000 // ms

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
  // Check status of Hall sensor
  bool sensorStatus = analogRead(PIN_HALL) < 512;

  // If magnet is present, open lock, wait and then close it
  if (sensorStatus) {
    moveServo(SERVO_OPEN);
    delay(OPEN_TIME);
    moveServo(SERVO_CLOSED);
  }
}

