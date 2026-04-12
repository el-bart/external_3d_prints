#include <Servo.h>
#include <Key.h>
#include <Keypad.h>

// Setup servo
#define PIN_SERVO 10
#define SERVO_OPEN 0
#define SERVO_CLOSED 90
Servo myServo;
int lastPos;

// Setup keypad
#define KEYPAD_ROWS 4
#define KEYPAD_COLS 4
byte rowPins[KEYPAD_ROWS] = {9, 8, 7, 6}; // Rows 0 to 3
byte colPins[KEYPAD_COLS] = {5, 4, 3, 2}; // Columns 0 to 3
char keymap[KEYPAD_ROWS][KEYPAD_COLS] = {
  {'1', '2', '3', 'A'},
  {'4', '5', '6', 'B'},
  {'7', '8', '9', 'C'},
  {'*', '0', '#', 'D'}
};
Keypad myKeypad = Keypad(makeKeymap(keymap), rowPins, colPins, KEYPAD_ROWS, KEYPAD_COLS);

// Setup code options
char code[] = { '1', '2', '3', '4' }; // the correct code - any length
byte codeLen = 4;                     // length of the correct code
byte codePos = 0;                     // cursor for correctly entered code

// Helper method to move servo to given position
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
  // Set servo to locked position
  moveServo(SERVO_CLOSED);
}

void loop() {
  // Get pressed key
  char key = myKeypad.getKey();

  // Do nothing if no key was pressed
  if (key == NO_KEY) return;

  // Close lock if it is open and key was pressed
  if (lastPos == SERVO_OPEN) {
    moveServo(SERVO_CLOSED);
    return;
  }

  // Process key press
  if (key == code[codePos]) {
    // Correct key - move cursor to the right
    codePos++;
  }
  else {
    // Incorrect key - reset cursor to zero
    codePos = 0;
  }

  // Entire code was entered
  if (codePos == codeLen) {
    // Open lock
    moveServo(SERVO_OPEN);

    // Reset cursor
    codePos = 0;
  }
}
