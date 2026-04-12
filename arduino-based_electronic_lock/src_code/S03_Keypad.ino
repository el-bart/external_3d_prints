#include <Key.h>
#include <Keypad.h>

// Define number of rows and columns
#define KEYPAD_ROWS 4
#define KEYPAD_COLS 4

// Define mapping of rows/columns to pins
byte rowPins[KEYPAD_ROWS] = {9, 8, 7, 6}; // Rows 0 to 3
byte colPins[KEYPAD_COLS] = {5, 4, 3, 2}; // Columns 0 to 3

// Define mapping of keys to characters
char keymap[KEYPAD_ROWS][KEYPAD_COLS] = {
  {'1', '2', '3', 'A'},
  {'4', '5', '6', 'B'},
  {'7', '8', '9', 'C'},
  {'*', '0', '#', 'D'}
};

// Define keypad instance
Keypad myKeypad = Keypad(makeKeymap(keymap), rowPins, colPins, KEYPAD_ROWS, KEYPAD_COLS);

void setup() {
  // Setup serial connection
  Serial.begin(9600);
}

void loop() {
  // Get pressed key
  char key = myKeypad.getKey();

  // Do nothing if no key was pressed
  if (key == NO_KEY) return;

  // Print pressed key to serial
  Serial.print(key);
}
