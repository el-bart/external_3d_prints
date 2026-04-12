#include <Servo.h>

#define PIN_SERVO 10
#define SERVO_MIN 0
#define SERVO_MAX 180
#define SERVO_STEP 30

Servo myServo;
int nextPos;

void setup() {
  // Connect to servo
  myServo.attach(PIN_SERVO);

  // Set current position to minimal one
  nextPos = SERVO_MIN;
}

void loop() {
  // Move servo to current position
  myServo.write(nextPos);

  // Increment current position
  nextPos += SERVO_STEP;

  // If we reached maximum position, go back to minimum
  if (nextPos > SERVO_MAX) nextPos = SERVO_MIN;

  // Wait 1 second
  delay(1000);
}
