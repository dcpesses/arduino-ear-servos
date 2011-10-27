// Sweep
// by BARRAGAN <http://barraganstudio.com> 
// This example code is in the public domain.


#include <Servo.h> 
#include <Easing.h> 
 
Servo servoLeft;
Servo servoRight;

const int buttonPin1 = 2;    // the pin that the pushbutton is attached to
const int buttonPin2 = 3;    // the pin that the pushbutton is attached to

int pos = 0;    // variable to store the servo position 
int buttonPushCounter = 0;
int buttonState = 0;
int lastButtonState = 0;
int buttonStateAlt = 0;
int servoState = 0;
int lastServoState = 0;

const int maxVal = 60;
const int minVal = 6;
const int mult = 3;
int tween = 0;
int tweenAlt = 0;
boolean idle = true;

void setup() { 
  pinMode(buttonPin1, INPUT);
  pinMode(buttonPin2, INPUT);
  servoLeft.attach(9);
  servoRight.attach(10);
} 
 
 
void loop() { 
  buttonState = digitalRead(buttonPin1);
  buttonStateAlt = digitalRead(buttonPin2);
  
  // compare the buttonState to its previous state
  if (buttonState != lastButtonState && buttonState == HIGH) {
    buttonPushCounter++;
    idle = false;
    if (buttonPushCounter % 2 == 0) {
      // ears up quick
      for(pos = minVal; pos <= maxVal; pos += 1){ 
        tween = floor(Easing::easeOutQuad((pos), minVal, maxVal, (minVal)+(maxVal)));
        servoLeft.write(constrain(tween*mult, 10, 170));
        servoRight.write(constrain(tween*mult, 10, 170));
       // if (pos == maxVal) idle = true;
        delay(12);
      } 
    } else {
      // ears down quick
      for (pos = 170; pos>=10; pos-=1){
        tween = floor(Easing::easeInOutQuad((pos), 10, 170, (10)+(170)));
        servoLeft.write(constrain(tween, 15, 170));
        servoRight.write(constrain(tween, 18, 170));
        //servoLeft.write(pos*mult);
        if (pos == 10) idle = true;
        delay(18);
      } 
    }
  } else if (idle == true) {
    if (tweenAlt < maxVal*mult && buttonStateAlt == LOW) {
        tweenAlt++;
        tweenAlt++;
        servoLeft.write(constrain(tweenAlt, 18, 170));
        servoRight.write(constrain(tweenAlt, 18, 170));
        delay(9);
    } else if (tweenAlt > minVal*mult && buttonStateAlt == HIGH) {
        tweenAlt--;
        tweenAlt--;
        servoLeft.write(constrain(tweenAlt, 18, 170));
        servoRight.write(constrain(tweenAlt, 18, 170));
        delay(9);
    }
  }
  lastButtonState = buttonState;
}
