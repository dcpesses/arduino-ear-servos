// Mog Ears for a Spaceballs "Barf" costume
// Based on "Sweep6.pde" Source Code
// with Easing lib included at top

// -- Start Easing Library -- //

/*******************************************************************************************
  Easing equations for Arduino v0.1
  
  These functions were quickly mashed together and the code needs to be
  tidied up e.g. in terms of memory management (all variables are floats).
  
  All functions are put in the namespace "Easing".
  
  July 27, 2009
  Translated by Tobias Toft
  hello@tobiastoft.dk

  Based on the work by Robert Penner.

  ******************************************************************************************

  Easing Equations v1.5
  May 1, 2003
  (c) 2003 Robert Penner, all rights reserved. 
  This work is subject to the terms in http://www.robertpenner.com/easing_terms_of_use.html.  
  
  These tweening functions provide different flavors of 
  math-based motion under a consistent API. 
  
  Types of easing:
  
	  Linear
	  Quadratic
	  Cubic
	  Quartic
	  Quintic
	  Sinusoidal
	  Exponential
	  Circular
	  Elastic
	  Back
	  Bounce

  Discussed in Chapter 7 of 
  Robert Penner's Programming Macromedia Flash MX
  (including graphs of the easing equations)
  
  http://www.robertpenner.com/profmx
  http://www.amazon.com/exec/obidos/ASIN/0072223561/robertpennerc-20
*******************************************************************************************/

// #include "Easing.h"
namespace Easing{	
	float linearTween (float t, float b, float c, float d);
	float easeInQuad (float t, float b, float c, float d);
	float easeOutQuad (float t, float b, float c, float d);
	float easeInOutQuad (float t, float b, float c, float d);
	float easeInCubic (float t, float b, float c, float d);
	float easeOutCubic (float t, float b, float c, float d);
	float easeInOutCubic (float t, float b, float c, float d);
	float easeInQuart (float t, float b, float c, float d);
	float easeOutQuart (float t, float b, float c, float d);
	float easeInOutQuart (float t, float b, float c, float d);
	float easeInQuint (float t, float b, float c, float d);
	float easeOutQuint (float t, float b, float c, float d);
	float easeInOutQuint (float t, float b, float c, float d);
	float easeInSine (float t, float b, float c, float d);
	float easeOutSine (float t, float b, float c, float d);
	float easeInOutSine (float t, float b, float c, float d);
	float easeInExpo (float t, float b, float c, float d);
	float easeOutExpo (float t, float b, float c, float d);
	float easeInOutExpo (float t, float b, float c, float d);
	float easeInCirc (float t, float b, float c, float d);
	float easeOutCirc (float t, float b, float c, float d);
	float easeInOutCirc (float t, float b, float c, float d);
	float easeInElastic (float t, float b, float c, float d, float a=0, float p=0);
	float easeOutElastic (float t, float b, float c, float d, float a=0, float p=0);
	float easeInOutElastic (float t, float b, float c, float d, float a=0, float p=0);
	float easeInElastic (float t, float b, float c, float d);
	float easeOutElastic (float t, float b, float c, float d);
	float easeInOutElastic (float t, float b, float c, float d);
	float easeInBack (float t, float b, float c, float d, float s=1.70158);
	float easeOutBack (float t, float b, float c, float d, float s=1.70158);
	float easeInOutBack (float t, float b, float c, float d, float s=1.70158);
	float easeInBack (float t, float b, float c, float d);
	float easeOutBack (float t, float b, float c, float d);
	float easeInOutBack (float t, float b, float c, float d);
	float easeInBounce (float t, float b, float c, float d);
	float easeOutBounce (float t, float b, float c, float d);
	float easeInOutBounce (float t, float b, float c, float d);
}
#include <math.h>


// simple linear tweening - no easing
// t: current time, b: beginning value, c: change in value, d: duration
float Easing::linearTween (float t, float b, float c, float d) {
	return c*t/d + b;
}


 ///////////// QUADRATIC EASING: t^2 ///////////////////

// quadratic easing in - accelerating from zero velocity
// t: current time, b: beginning value, c: change in value, d: duration
// t and d can be in frames or seconds/milliseconds
float Easing::easeInQuad (float t, float b, float c, float d) {
	return c*(t/=d)*t + b;
}

// quadratic easing out - decelerating to zero velocity
float Easing::easeOutQuad (float t, float b, float c, float d) {
	return -c *(t/=d)*(t-2) + b;
}

// quadratic easing in/out - acceleration until halfway, then deceleration
float Easing::easeInOutQuad (float t, float b, float c, float d) {
	if ((t/=d/2) < 1) return c/2*t*t + b;
	return -c/2 * ((--t)*(t-2) - 1) + b;
}


 ///////////// CUBIC EASING: t^3 ///////////////////////

// cubic easing in - accelerating from zero velocity
// t: current time, b: beginning value, c: change in value, d: duration
// t and d can be frames or seconds/milliseconds
float Easing::easeInCubic (float t, float b, float c, float d) {
	return c*(t/=d)*t*t + b;
}

// cubic easing out - decelerating to zero velocity
float Easing::easeOutCubic (float t, float b, float c, float d) {
	return c*((t=t/d-1)*t*t + 1) + b;
}

// cubic easing in/out - acceleration until halfway, then deceleration
float Easing::easeInOutCubic (float t, float b, float c, float d) {
	if ((t/=d/2) < 1) return c/2*t*t*t + b;
	return c/2*((t-=2)*t*t + 2) + b;
}


 ///////////// QUARTIC EASING: t^4 /////////////////////

// quartic easing in - accelerating from zero velocity
// t: current time, b: beginning value, c: change in value, d: duration
// t and d can be frames or seconds/milliseconds
float Easing::easeInQuart (float t, float b, float c, float d) {
	return c*(t/=d)*t*t*t + b;
}

// quartic easing out - decelerating to zero velocity
float Easing::easeOutQuart (float t, float b, float c, float d) {
	return -c * ((t=t/d-1)*t*t*t - 1) + b;
}

// quartic easing in/out - acceleration until halfway, then deceleration
float Easing::easeInOutQuart (float t, float b, float c, float d) {
	if ((t/=d/2) < 1) return c/2*t*t*t*t + b;
	return -c/2 * ((t-=2)*t*t*t - 2) + b;
}


 ///////////// QUINTIC EASING: t^5  ////////////////////

// quintic easing in - accelerating from zero velocity
// t: current time, b: beginning value, c: change in value, d: duration
// t and d can be frames or seconds/milliseconds
float Easing::easeInQuint (float t, float b, float c, float d) {
	return c*(t/=d)*t*t*t*t + b;
}

// quintic easing out - decelerating to zero velocity
float Easing::easeOutQuint (float t, float b, float c, float d) {
	return c*((t=t/d-1)*t*t*t*t + 1) + b;
}

// quintic easing in/out - acceleration until halfway, then deceleration
float Easing::easeInOutQuint (float t, float b, float c, float d) {
	if ((t/=d/2) < 1) return c/2*t*t*t*t*t + b;
	return c/2*((t-=2)*t*t*t*t + 2) + b;
}



 ///////////// SINUSOIDAL EASING: sin(t) ///////////////

// sinusoidal easing in - accelerating from zero velocity
// t: current time, b: beginning value, c: change in position, d: duration
float Easing::easeInSine (float t, float b, float c, float d) {
	return -c * cos(t/d * (M_PI/2)) + c + b;
}

// sinusoidal easing out - decelerating to zero velocity
float Easing::easeOutSine (float t, float b, float c, float d) {
	return c * sin(t/d * (M_PI/2)) + b;
}

// sinusoidal easing in/out - accelerating until halfway, then decelerating
float Easing::easeInOutSine (float t, float b, float c, float d) {
	return -c/2 * (cos(M_PI*t/d) - 1) + b;
}


 ///////////// EXPONENTIAL EASING: 2^t /////////////////

// exponential easing in - accelerating from zero velocity
// t: current time, b: beginning value, c: change in position, d: duration
float Easing::easeInExpo (float t, float b, float c, float d) {
	return (t==0) ? b : c * pow(2, 10 * (t/d - 1)) + b;
}

// exponential easing out - decelerating to zero velocity
float Easing::easeOutExpo (float t, float b, float c, float d) {
	return (t==d) ? b+c : c * (-pow(2, -10 * t/d) + 1) + b;
}

// exponential easing in/out - accelerating until halfway, then decelerating
float Easing::easeInOutExpo (float t, float b, float c, float d) {
	if (t==0) return b;
	if (t==d) return b+c;
	if ((t/=d/2) < 1) return c/2 * pow(2, 10 * (t - 1)) + b;
	return c/2 * (-pow(2, -10 * --t) + 2) + b;
}


 /////////// CIRCULAR EASING: sqrt(1-t^2) //////////////

// circular easing in - accelerating from zero velocity
// t: current time, b: beginning value, c: change in position, d: duration
float Easing::easeInCirc (float t, float b, float c, float d) {
	return -c * (sqrt(1 - (t/=d)*t) - 1) + b;
}

// circular easing out - decelerating to zero velocity
float Easing::easeOutCirc (float t, float b, float c, float d) {
	return c * sqrt(1 - (t=t/d-1)*t) + b;
}

// circular easing in/out - acceleration until halfway, then deceleration
float Easing::easeInOutCirc (float t, float b, float c, float d) {
	if ((t/=d/2) < 1) return -c/2 * (sqrt(1 - t*t) - 1) + b;
	return c/2 * (sqrt(1 - (t-=2)*t) + 1) + b;
}


 /////////// ELASTIC EASING: exponentially decaying sine wave  //////////////

// t: current time, b: beginning value, c: change in value, d: duration, a: amplitude (optional), p: period (optional)
// t and d can be in frames or seconds/milliseconds

float Easing::easeInElastic (float t, float b, float c, float d, float a, float p) {
	float s;
	if (t==0) return b;  if ((t/=d)==1) return b+c;  if (!p) p=d*.3;
	if (a < fabs(c)) { a=c; s=p/4; }
	else s = p/(2*M_PI) * asin (c/a);
	return -(a*pow(2,10*(t-=1)) * sin( (t*d-s)*(2*M_PI)/p )) + b;
}

float Easing::easeOutElastic (float t, float b, float c, float d, float a, float p) {
	float s;
	if (t==0) return b;  if ((t/=d)==1) return b+c;  if (!p) p=d*.3;
	if (a < fabs(c)) { a=c; s=p/4; }
	else s = p/(2*M_PI) * asin (c/a);
	return a*pow(2,-10*t) * sin( (t*d-s)*(2*M_PI)/p ) + c + b;
}

float Easing::easeInOutElastic (float t, float b, float c, float d, float a, float p) {
	float s;
	if (t==0) return b;  if ((t/=d/2)==2) return b+c;  if (!p) p=d*(.3*1.5);
	if (a < fabs(c)) { a=c; s=p/4; }
	else s = p/(2*M_PI) * asin (c/a);
	if (t < 1) return -.5*(a*pow(2,10*(t-=1)) * sin( (t*d-s)*(2*M_PI)/p )) + b;
	return a*pow(2,-10*(t-=1)) * sin( (t*d-s)*(2*M_PI)/p )*.5 + c + b;
}


//Four parameter versions
float Easing::easeInElastic (float t, float b, float c, float d) {
	float s;
	float a=0.0;
	float p=0.0;
	if (t==0) return b;  if ((t/=d)==1) return b+c;  if (!p) p=d*.3;
	if (a < fabs(c)) { a=c; s=p/4; }
	else s = p/(2*M_PI) * asin (c/a);
	return -(a*pow(2,10*(t-=1)) * sin( (t*d-s)*(2*M_PI)/p )) + b;
}

float Easing::easeOutElastic (float t, float b, float c, float d) {
	float s;
	float a=0.0;
	float p=0.0;
	if (t==0) return b;  if ((t/=d)==1) return b+c;  if (!p) p=d*.3;
	if (a < fabs(c)) { a=c; s=p/4; }
	else s = p/(2*M_PI) * asin (c/a);
	return a*pow(2,-10*t) * sin( (t*d-s)*(2*M_PI)/p ) + c + b;
}

float Easing::easeInOutElastic (float t, float b, float c, float d) {
	float s;
	float a=0.0;
	float p=0.0;
	if (t==0) return b;  if ((t/=d/2)==2) return b+c;  if (!p) p=d*(.3*1.5);
	if (a < fabs(c)) { a=c; s=p/4; }
	else s = p/(2*M_PI) * asin (c/a);
	if (t < 1) return -.5*(a*pow(2,10*(t-=1)) * sin( (t*d-s)*(2*M_PI)/p )) + b;
	return a*pow(2,-10*(t-=1)) * sin( (t*d-s)*(2*M_PI)/p )*.5 + c + b;
}

 /////////// BACK EASING: overshooting cubic easing: (s+1)*t^3 - s*t^2  //////////////

// back easing in - backtracking slightly, then reversing direction and moving to target
// t: current time, b: beginning value, c: change in value, d: duration, s: overshoot amount (optional)
// t and d can be in frames or seconds/milliseconds
// s controls the amount of overshoot: higher s means greater overshoot
// s has a default value of 1.70158, which produces an overshoot of 10 percent
// s==0 produces cubic easing with no overshoot
float Easing::easeInBack (float t, float b, float c, float d, float s) {
	return c*(t/=d)*t*((s+1)*t - s) + b;
}

// back easing out - moving towards target, overshooting it slightly, then reversing and coming back to target
float Easing::easeOutBack (float t, float b, float c, float d, float s) {
	return c*((t=t/d-1)*t*((s+1)*t + s) + 1) + b;
}

// back easing in/out - backtracking slightly, then reversing direction and moving to target,
// then overshooting target, reversing, and finally coming back to target
float Easing::easeInOutBack (float t, float b, float c, float d, float s) {
	if ((t/=d/2) < 1) return c/2*(t*t*(((s*=(1.525))+1)*t - s)) + b;
	return c/2*((t-=2)*t*(((s*=(1.525))+1)*t + s) + 2) + b;
}


//Four parameter versions
float Easing::easeInBack (float t, float b, float c, float d) {
	float s=1.70158;
	return c*(t/=d)*t*((s+1)*t - s) + b;
}

float Easing::easeOutBack (float t, float b, float c, float d) {
	float s=1.70158;
	return c*((t=t/d-1)*t*((s+1)*t + s) + 1) + b;
}

float Easing::easeInOutBack (float t, float b, float c, float d) {
	float s=1.70158;
	if ((t/=d/2) < 1) return c/2*(t*t*(((s*=(1.525))+1)*t - s)) + b;
	return c/2*((t-=2)*t*(((s*=(1.525))+1)*t + s) + 2) + b;
}

 /////////// BOUNCE EASING: exponentially decaying parabolic bounce  //////////////

// bounce easing in
// t: current time, b: beginning value, c: change in position, d: duration
float Easing::easeInBounce (float t, float b, float c, float d) {
	return c - easeOutBounce (d-t, 0, c, d) + b;
}

// bounce easing out
float Easing::easeOutBounce (float t, float b, float c, float d) {
	if ((t/=d) < (1/2.75)) {
		return c*(7.5625*t*t) + b;
	} else if (t < (2/2.75)) {
		return c*(7.5625*(t-=(1.5/2.75))*t + .75) + b;
	} else if (t < (2.5/2.75)) {
		return c*(7.5625*(t-=(2.25/2.75))*t + .9375) + b;
	} else {
		return c*(7.5625*(t-=(2.625/2.75))*t + .984375) + b;
	}
}

// bounce easing in/out
float Easing::easeInOutBounce (float t, float b, float c, float d) {
	if (t < d/2) return easeInBounce (t*2, 0, c, d) * .5 + b;
	return easeOutBounce (t*2-d, 0, c, d) * .5 + c*.5 + b;
}

// --- End Easing Library --- //




#include <Servo.h>
// #include <Easing.h>
 
Servo servoLeft;
Servo servoRight;

const int servoLeftPin = 9;
const int servoRightPin = 10;

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
const int restThreshold = 20;  // detach when at/near rest (no hold needed)

int tween = 0;
int tweenLeft = 0;
int tweenRight = 0;

boolean idleLeft = true;
boolean idleRight = true;

boolean upLeft = false;
boolean upRight = false;

boolean leftAttached = false;
boolean rightAttached = false;

void ensureLeftAttached() {
  if (!leftAttached) {
    servoLeft.attach(servoLeftPin);
    leftAttached = true;
    servoLeft.write(servoLeftPos > 0 ? servoLeftPos : 18);
  }
}

void ensureRightAttached() {
  if (!rightAttached) {
    servoRight.attach(servoRightPin);
    rightAttached = true;
    servoRight.write(servoRightPos > 0 ? servoRightPos : 18);
  }
}

void releaseLeftIfResting() {
  if (leftAttached && servoLeftPos <= restThreshold) {
    servoLeft.detach();
    leftAttached = false;
  }
}

void releaseRightIfResting() {
  if (rightAttached && servoRightPos <= restThreshold) {
    servoRight.detach();
    rightAttached = false;
  }
}


void setup() { 
  pinMode(buttonPin2, INPUT);
  digitalWrite(buttonPin2, HIGH);
  pinMode(buttonPin3, INPUT);
  digitalWrite(buttonPin3, HIGH);
  pinMode(buttonPin4, INPUT);
  digitalWrite(buttonPin4, HIGH);
  // Leave servos detached at boot — no hold needed at rest
} 
 
 
void loop() { 
  buttonState = digitalRead(buttonPin2);
  buttonStateLeft = digitalRead(buttonPin3);
  buttonStateRight = digitalRead(buttonPin4);
  
  // compare the buttonState to its previous state
  if (buttonState != lastButtonState && buttonState == HIGH) {
    buttonPushCounter++;
    idleLeft = false;
    if (buttonPushCounter % 2 == 0) {
      // both ears up quick
      ensureLeftAttached();
      ensureRightAttached();
      for(pos = minVal; pos <= maxVal; pos += 1){ 
        tween = floor(Easing::easeOutQuad((pos), minVal, maxVal, (minVal)+(maxVal)));
        servoLeftPos = constrain(tween*mult, 10, 170);
        servoRightPos = constrain(tween*mult, 10, 170);
        servoLeft.write(servoLeftPos);
        servoRight.write(servoRightPos);
        //allow overrides when complete
        upLeft = (servoLeftPos >= 165);
        upRight = (servoRightPos >= 165);
        delay(12);
      } 
    } else {
      // both ears down quick
      upLeft = false;
      upRight = false;
      ensureLeftAttached();
      ensureRightAttached();
      for (pos = 170; pos>=10; pos-=1){
        tween = floor(Easing::easeInOutQuad((pos), 10, 170, (10)+(170)));
        servoLeftPos = constrain(tween, 15, 170);
        servoRightPos = constrain(tween, 18, 170);
        servoLeft.write(servoLeftPos);
        servoRight.write(servoRightPos);
        //servoLeft.write(pos*mult);
        if (pos == 10) {
          idleLeft = true;
          idleRight = true;
        }
        delay(18);
      }
      releaseLeftIfResting();
      releaseRightIfResting();
    }
  } else {
    if (idleLeft == true) {
      // left ear control
      if (tweenLeft < maxVal*mult && buttonStateLeft == LOW) {
        //raise left ear
        ensureLeftAttached();
        tweenLeft++;
        tweenLeft++;
        servoLeftPos = constrain(tweenLeft, 18, 170);
        servoLeft.write(servoLeftPos);
        delay(9);
      } else if (tweenLeft > minVal*mult && buttonStateLeft == HIGH) {
        //lower left ear
        ensureLeftAttached();
        tweenLeft--;
        tweenLeft--;
        servoLeftPos = constrain(tweenLeft, 18, 170);
        servoLeft.write(servoLeftPos);
        delay(9);
        releaseLeftIfResting();
      }
    }
    if (idleRight == true) {
      // right ear control
      if (tweenRight < maxVal*mult && buttonStateRight == LOW) {
        ensureRightAttached();
        tweenRight++;
        tweenRight++;
        servoRightPos = constrain(tweenRight, 18, 170);
        servoRight.write(servoRightPos);
        delay(9);
      } else if (tweenRight > minVal*mult && buttonStateRight == HIGH) {
        ensureRightAttached();
        tweenRight--;
        tweenRight--;
        servoRightPos = constrain(tweenRight, 18, 170);
        servoRight.write(servoRightPos);
        delay(9);
        releaseRightIfResting();
      }
    }
    //override sync toggle for left & right
    if (upLeft == true && buttonStateLeft == HIGH) {
      upLeft = false;
      idleLeft = true;
    }
    if (upRight == true && buttonStateRight == HIGH) {
      upRight = false;
      idleRight = true;
    }
  }
  lastButtonState = buttonState;
}
