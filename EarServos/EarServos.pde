
#include <Servo.h> 
#include <Easing.h> 
 
Servo servoLeft;
Servo servoRight;

const int buttonPin2 = 2;
const int buttonPin3 = 3;
const int buttonPin4 = 4;

int pos = 0;    			// variable to store the servo position 
int buttonPushCounter = 0;

int buttonState = 0;
int lastButtonState = 0;

int buttonStateLeft = 0;
int buttonStateRight = 0;

int servoLeftState = 0;
//int lastServoLeftState = 0;
int servoLeftPos = 0;

int servoRightState = 0;
//int lastServoRightState = 0;
int servoRightPos = 0;

const int maxVal = 60;
const int minVal = 6;
const int mult = 3;

int tween = 0;
int tweenLeft = 0;
int tweenRight = 0;

boolean idle = true;

void setup() { 
  pinMode(buttonPin2, INPUT);
  digitalWrite(buttonPin2,HIGH);
  pinMode(buttonPin3, INPUT);
  pinMode(buttonPin4, INPUT);
  servoLeft.attach(9);
  servoRight.attach(10);
} 
 
 
void loop() { 
  buttonState = digitalRead(buttonPin2);
  buttonStateLeft = digitalRead(buttonPin3);
  buttonStateRight = digitalRead(buttonPin4);
  
  // compare the buttonState to its previous state
  if (buttonState != lastButtonState && buttonState == HIGH) {
    buttonPushCounter++;
    idle = false;
    if (buttonPushCounter % 2 == 0) {
      // both ears up quick
      for(pos = minVal; pos <= maxVal; pos += 1){ 
        tween = floor(Easing::easeOutQuad((pos), minVal, maxVal, (minVal)+(maxVal)));
	servoLeftPos = constrain(tween*mult, 10, 170);
	servoRightPos = constrain(tween*mult, 10, 170);
        servoLeft.write(servoLeftPos);
        servoRight.write(servoRightPos);
       // if (pos == maxVal) idle = true;
        delay(12);
      } 
    } else {
      // both ears down quick
      for (pos = 170; pos>=10; pos-=1){
        tween = floor(Easing::easeInOutQuad((pos), 10, 170, (10)+(170)));
	servoLeftPos = constrain(tween, 15, 170);
	servoRightPos = constrain(tween, 18, 170);
        servoLeft.write(servoLeftPos);
        servoRight.write(servoRightPos);
        //servoLeft.write(pos*mult);
        if (pos == 10) idle = true;
        delay(18);
      } 
    }
  } else if (idle == true) {
    // left ear control
    if (tweenLeft < maxVal*mult && buttonStateLeft == LOW) {
        tweenLeft++;
        tweenLeft++;
	servoLeftPos = constrain(tweenLeft, 18, 170);
        servoLeft.write(servoLeftPos);
        delay(9);
    } else if (tweenLeft > minVal*mult && buttonStateLeft == HIGH) {
        tweenLeft--;
        tweenLeft--;
	servoLeftPos = constrain(tweenLeft, 18, 170);
        servoLeft.write(servoLeftPos);
        delay(9);
    }
    // right ear control
    if (tweenRight < maxVal*mult && buttonStateRight == LOW) {
        tweenRight++;
        tweenRight++;
	servoRightPos = constrain(tweenRight, 18, 170);
        servoRight.write(servoRightPos);
        delay(9);
    } else if (tweenRight > minVal*mult && buttonStateRight == HIGH) {
        tweenRight--;
        tweenRight--;
	servoRightPos = constrain(tweenRight, 18, 170);
        servoRight.write(servoRightPos);
        delay(9);
    }
  }
  lastButtonState = buttonState;
}
