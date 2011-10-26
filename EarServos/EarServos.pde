/*
  State change detection (edge detection)
 	
 Often, you don't need to know the state of a digital input all the time,
 but you just need to know when the input changes from one state to another.
 For example, you want to know when a button goes from OFF to ON.  This is called
 state change detection, or edge detection.
 
 This example shows how to detect when a button or button changes from off to on
 and on to off.
 	
 The circuit:
 * pushbutton attached to pin 2 from +5V
 * 10K resistor attached to pin 2 from ground
 * LED attached from pin 13 to ground (or use the built-in LED on
   most Arduino boards)
 
 created  27 Sep 2005
 modified 14 Oct 2010
 by Tom Igoe

This example code is in the public domain.
 	
 http://arduino.cc/en/Tutorial/ButtonLeftStateChange
 
 */

// this constant won't change:
const int buttonPin1 = 2;    // the pin that the pushbutton is attached to
const int buttonPin2 = 3;    // the pin that the pushbutton is attached to
const int ledLeft = 9;       // the pin that the LED is attached to
const int ledRight = 10;     // the pin that the LED is attached to
const int maxVal = 100;
const int ms = 10;           // delay in milliseconds

// Variables will change:
int buttonTogglePushCounter = 0;   // counter for the number of button presses
int buttonRightPushCounter = 0;   // counter for the number of button presses
int buttonToggleState = 0;         // current state of the button
int buttonRightState = 0;         // current state of the button
int lastButtonToggleState = 0;     // previous state of the button
int lastButtonRightState = 0;     // previous state of the button
int value = 0;
int tween = 0;
int earLeftVal = 0;
int earRightVal = 0;


void setup() {
  // initialize buttons:
  pinMode(buttonPin1, INPUT);
  pinMode(buttonPin2, INPUT);
  // initialize LED output:
  pinMode(ledLeft, OUTPUT);
  pinMode(ledRight, OUTPUT);
  Serial.begin(9600);
}


void loop() {
  // read the pushbutton input pin:
  buttonToggleState = digitalRead(buttonPin1);
  buttonRightState = digitalRead(buttonPin2);



  if (lastButtonRightState != buttonRightState) {
    buttonToggleState = !buttonToggleState;
    if (buttonTogglePushCounter % 2 != 0) buttonTogglePushCounter++;
  }
  lastButtonRightState = buttonRightState;

  // compare the buttonLeftState to its previous state
  if (buttonToggleState != lastButtonToggleState) {
    // if the state has changed, increment the counter
    if (buttonToggleState == HIGH) {
      // if the current state is HIGH then the button
      // wend from off to on:
      buttonTogglePushCounter++;
      Serial.println("Toggle ON");
      Serial.print("1) Number of button pushes:  ");
      Serial.println(buttonTogglePushCounter, DEC);
    } 
    else {
      Serial.println("Toggle OFF"); 
    }
  }

  // save the current state as the last state, 
  //for next time through the loop
  lastButtonToggleState = buttonToggleState;

  if (buttonTogglePushCounter % 2 == 0 || buttonRightState == LOW) {
    if (value < maxVal) {
      value++;
    }
  } else {
    if (value > 0) {
      value--;
    }
  }
  if (value!=0 && value!=maxVal) {
    tween = easeInOutQuad((ms*value), 0, maxVal, (ms*maxVal));
    Serial.print("Value:  "); 
    Serial.print(value, DEC);
    Serial.print(", Tween:  "); 
    Serial.println(tween, DEC);
    sync(tween, value);
  }
  delay(ms);
}

void sync(int leftVal, int rightVal) {
  leftVal = constrain(leftVal, 0, maxVal);
  analogWrite(ledLeft, leftVal);
  rightVal = constrain(rightVal, 0, maxVal);
  analogWrite(ledRight, rightVal);
}

// t: current time, b: beginning value, c: change in value, d: duration
// t and d can be in frames or seconds/milliseconds

// quadratic easing in/out - acceleration until halfway, then deceleration
float easeInOutQuad (float t, float b, float c, float d) {
  if ((t/=d/2) < 1) return c/2*t*t + b;
  return -c/2 * ((--t)*(t-2) - 1) + b;
}

// exponential easing in/out - accelerating until halfway, then decelerating
float easeInOutExpo (float t, float b, float c, float d) {
  if (t==0) return b;
  if (t==d) return b+c;
  if ((t/=d/2) < 1) return c/2 * pow(2, 10 * (t - 1)) + b;
  return c/2 * (-pow(2, -10 * --t) + 2) + b;
}



