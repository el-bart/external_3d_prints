#include <Servo.h>
#include <Keypad.h>
#include <EEPROM.h>

// Setup servo
#define PIN_SERVO 10
#define SERVO_OPEN 0
#define SERVO_CLOSED 90
Servo myServo;

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
#define CODE_LENGTH 4
char code[4];     // the correct code - any length
byte codePos = 0; // cursor for correctly entered code

// Setup EEPROM
#define EEPROM_ADDR_SERVO 0
#define EEPROM_ADDR_CODE 1

// Helper method to move servo to given position
void moveServo(int pos) {
  Serial.print("Moving servo to position ");
  Serial.println(pos);

  // Connect to servo
  myServo.attach(PIN_SERVO);

  // Move servo to desired position
  myServo.write(pos);

  // Save the position as last known to EEPROM
  EEPROM.update(EEPROM_ADDR_SERVO, pos);

  // Wait 500 ms for movemnent
  delay(500);

  // Disconnect from servo
  myServo.detach();
}

// Helper method to load code from EEPROM
void loadCode() {
  for (int i = 0; i < CODE_LENGTH; i++) {
    code[i] = EEPROM.read(EEPROM_ADDR_CODE + i);
  }
}

// Helper method to save code to EEPROM
void saveCode() {
  for (int i = 0; i < CODE_LENGTH; i++) {
    EEPROM.update(EEPROM_ADDR_CODE + i, code[i]);
  }
}

void setup() {
  // Initialize serial debug link
  Serial.begin(9600);
  Serial.println("Initializing code lock...");

  // Load code from EEPROM
  loadCode();

  // Get servo position from EEPROM
  byte savedPos = EEPROM.read(EEPROM_ADDR_SERVO);

  // If stored position does not correspond to "open" or "closed", then its
  // probably some uninitialized position or something strange, so open lock
  if (savedPos != SERVO_OPEN && savedPos != SERVO_CLOSED) {
    Serial.println("Unexpected value in EEPROM - opening lock");
    savedPos = SERVO_OPEN;
  }

  // Move servo to saved position
  moveServo(savedPos);

  // Turn on the LED to indicate system is ready
  pinMode(LED_BUILTIN, OUTPUT);
  digitalWrite(LED_BUILTIN, HIGH);
  Serial.println("Init done, system ready");
}

void loop() {
  // Get pressed key
  char key = myKeypad.getKey();

  // Do nothing if no key was pressed
  if (key == NO_KEY) return;
  Serial.print("Key pressed: ");
  Serial.println(key);

  // Read servo position
  byte lastPos = EEPROM.read(EEPROM_ADDR_SERVO);
  if (lastPos == SERVO_OPEN) {
    // Lock is open - read code for close
    code[codePos] = key;
    codePos++;

    // Entire code was entered
    if (codePos == CODE_LENGTH) {
      Serial.println("Closing lock");

      // Save new code to EEPROM
      saveCode();

      // Close lock
      moveServo(SERVO_CLOSED);

      // Reset cursor
      codePos = 0;
      Serial.println("Enter code to unlock");
    }
  } else {
    // Lock is closed - read code for open

    if (key == code[codePos]) {
      // Correct key - move cursor to the right
      codePos++;
      Serial.print("Correct number, next position ");
    }
    else {
      // Incorrect key - reset cursor to zero
      codePos = 0;
      Serial.print("Incorrect number, next position ");
    }
    Serial.println(codePos);

    // Entire code was entered
    if (codePos == CODE_LENGTH) {
      Serial.println("Opening lock");

      // Open lock
      moveServo(SERVO_OPEN);

      // Reset cursor
      codePos = 0;
      Serial.println("Enter new code to lock");
    }
  }
}
