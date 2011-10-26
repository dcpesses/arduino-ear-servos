// Sweep
// by BARRAGAN <http://barraganstudio.com> 
// This example code is in the public domain.


#include <Servo.h> 
 
Servo myservo1;  // create servo object to control a servo 
Servo myservo2;

const int buttonPin1 = 2;    // the pin that the pushbutton is attached to
const int buttonPin2 = 3;

const int maxVal = 180;
const int minVal = 0;
const int ms = 5;           // delay in milliseconds

int buttonTogglePushCounter = 0;   // counter for the number of button presses
int buttonRightPushCounter = 0;   // counter for the number of button presses
int buttonToggleState = 0;         // current state of the button
int buttonRightState = 0;         // current state of the button
int lastButtonToggleState = 0;     // previous state of the button
int lastButtonRightState = 0;     // previous state of the button

int pos1 = 0;    // variable to store the servo position
int pos2 = 0;
int value = 0;
int tween = 0;
int earLeftVal = 0;
int earRightVal = 0;

void setup() {
  // initialize buttons:
  pinMode(buttonPin1, INPUT);
  pinMode(buttonPin2, INPUT);
  // initialize servos 
  myservo1.attach(9);
  myservo2.attach(10);
  // init debug
  Serial.begin(9600);
} 
 
 
void loop() { 
  
  // read the pushbutton input pins:
  buttonToggleState = digitalRead(buttonPin1);
  buttonRightState = digitalRead(buttonPin2);
  
  
    // compare the buttonLeftState to its previous state
  if (buttonToggleState != lastButtonToggleState) {
    // if the state has changed, increment the counter
    if (buttonToggleState == HIGH) {
      // if the current state is HIGH then the button
      buttonTogglePushCounter++;
      Serial.println("Toggle ON");
      Serial.print("1) Number of button pushes:  ");
      Serial.println(buttonTogglePushCounter, DEC);
    } else {
      Serial.println("Toggle OFF"); 
    }
  }
  
  if (buttonTogglePushCounter % 2 == 0 && buttonToggleState != lastButtonToggleState) {
    earsUp();
  } else {
    earsDown();
  }
  lastButtonToggleState = buttonToggleState;
}

void earsUp () {
  int pos1 = 0;
  Serial.println("earsUp");
  for(pos1 = 0; pos1 < 180; pos1++) {    // goes from 0 degrees to 180 degrees 
    myservo1.write(pos1);              // tell servo to go to position in variable 'pos' 
    myservo2.write(pos1);              // tell servo to go to position in variable 'pos' 
    delay(ms);                       // waits 15ms for the servo to reach the position 
  }
}

void earsDown () {
  int pos2 = 0;
  Serial.println("earsDown"); 
  for(pos2 = 180; pos2>=1; pos2--) {     // goes from 180 degrees to 0 degrees                             
    myservo1.write(pos2);              // tell servo to go to position in variable 'pos' 
    myservo2.write(pos2);              // tell servo to go to position in variable 'pos' 
    delay(ms);                       // waits 15ms for the servo to reach the position 
  } 
}
