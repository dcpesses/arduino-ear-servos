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
 	
 http://arduino.cc/en/Tutorial/ButtonStateChange
 
 */

// this constant won't change:
const int buttonPin1 = 2;    // the pin that the pushbutton is attached to
const int buttonPin2 = 3;    // the pin that the pushbutton is attached to
const int ledPin = 9;       // the pin that the LED is attached to
const int ledPin2 = 10;       // the pin that the LED is attached to
const int maxVal = 255;

// Variables will change:
int buttonPushCounter = 0;   // counter for the number of button presses
int buttonPushCounter2 = 0;   // counter for the number of button presses
int buttonState = 0;         // current state of the button
int buttonState2 = 0;         // current state of the button
int lastButtonState = 0;     // previous state of the button
int lastButtonState2 = 0;     // previous state of the button
int value = 0;


void setup() {
  // initialize the button pin as a input:
  pinMode(buttonPin1, INPUT);
  pinMode(buttonPin2, INPUT);
  // initialize the LED as an output:
  pinMode(ledPin, OUTPUT);
  pinMode(ledPin2, OUTPUT);
  // initialize serial communication:
  Serial.begin(9600);
}


void loop() {
  // read the pushbutton input pin:
  buttonState = digitalRead(buttonPin1);
  buttonState2 = digitalRead(buttonPin2);

  // compare the buttonState to its previous state
  if (buttonState != lastButtonState) {
    // if the state has changed, increment the counter
    if (buttonState == HIGH) {
      // if the current state is HIGH then the button
      // wend from off to on:
      buttonPushCounter++;
      Serial.println("on");
      Serial.print("1) number of button pushes:  ");
      Serial.println(buttonPushCounter, DEC);
    } 
    else {
      // if the current state is LOW then the button
      // wend from on to off:
      Serial.println("off"); 
    }
  } 
  if (buttonState2 != lastButtonState2) {
    // if the state has changed, increment the counter
    if (buttonState2 == HIGH) {
      // if the current state is HIGH then the button
      // wend from off to on:
      buttonPushCounter2++;
      Serial.println("on");
      Serial.print("2) number of button pushes:  ");
      Serial.println(buttonPushCounter2, DEC);
    } 
  }
  // save the current state as the last state, 
  //for next time through the loop
  lastButtonState = buttonState;
  lastButtonState2 = buttonState2;


  // turns on the LED every four button pushes by 
  // checking the modulo of the button push counter.
  // the modulo function gives you the remainder of 
  // the division of two numbers:
  if (buttonPushCounter % 2 == 0 || buttonPushCounter2 % 2 == 1 ) {
    //digitalWrite(ledPin, HIGH);
    value++;
    value = constrain(value, 0, maxVal);
    analogWrite(ledPin, value);
    analogWrite(ledPin2, maxVal-value);
    delay(5);
  } else {
    //digitalWrite(ledPin, LOW);
    value--;
    value = constrain(value, 0, maxVal);
    analogWrite(ledPin, value);
    analogWrite(ledPin2, maxVal-value);
    delay(5);
  }
  
}









