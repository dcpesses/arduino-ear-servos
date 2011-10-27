// Sweep
// by BARRAGAN <http://barraganstudio.com> 
// This example code is in the public domain.


#include <Servo.h> 
#include <Easing.h> 
 
Servo myservo;  // create servo object to control a servo 
                // a maximum of eight servo objects can be created 

const int buttonPin1 = 2;    // the pin that the pushbutton is attached to

int pos = 0;    // variable to store the servo position 
int buttonPushCounter = 0;
int buttonState = 0;
int lastButtonState = 0;

const int maxVal = 60;
const int minVal = 2;
const int mult = 3;
int tween = 0;

void setup() { 
  pinMode(buttonPin1, INPUT);
  myservo.attach(9);  // attaches the servo on pin 9 to the servo object 
} 
 
 
void loop() { 
  buttonState = digitalRead(buttonPin1);
  
    // compare the buttonState to its previous state
  if (buttonState != lastButtonState && buttonState == HIGH) {
    buttonPushCounter++;
    if (buttonPushCounter % 2 == 0) {
      for(pos = minVal; pos <= maxVal; pos += 1){  // goes from 0 degrees to 180 degrees
        tween = floor(Easing::easeOutQuad((pos), minVal, maxVal, (minVal)+(maxVal)));
        myservo.write(constrain(tween*mult, 10, 170));              // tell servo to go to position in variable 'pos' 
        delay(12);                       // waits 15ms for the servo to reach the position 
      } 
    } else {
      for(pos = 170; pos>=10; pos-=1){     // goes from 180 degrees to 0 degrees                        
        tween = floor(Easing::easeInOutQuad((pos), 10, 170, (10)+(170)));
        myservo.write(constrain(tween, 10, 170));              // tell servo to go to position in variable 'pos' 
        //myservo.write(pos*mult);              // tell servo to go to position in variable 'pos' 
        delay(18);                       // waits 15ms for the servo to reach the position 
      } 
    }
  }
  lastButtonState = buttonState;
}
