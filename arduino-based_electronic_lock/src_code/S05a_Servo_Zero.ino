#include <Servo.h>

void setup() {
  Servo myServo;
  myServo.attach(10);
  myServo.write(0);
}

void loop() {
}
