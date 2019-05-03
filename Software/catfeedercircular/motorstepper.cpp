///////////////////////////////////////////////////////////////////////////////
/// STEPPER MOTOR Adapter /////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////

#include "motorstepper.h"

void MotorStepperClass::begin() {
    pinMode(this->motorPin1, OUTPUT);
    pinMode(this->motorPin2, OUTPUT);
    pinMode(this->motorPin3, OUTPUT);
    pinMode(this->motorPin4, OUTPUT);
}

void MotorStepperClass::Clockwise() {

  this->_set_output(this->stepCounter);
  delay(this->motorSpeed);


  this->stepCounter++;
  if (this->stepCounter >= this->numSteps) this->stepCounter = 0;

  
}
 
void MotorStepperClass::Anticlockwise() {
  this->stepCounter--;
  if (this->stepCounter < 0) this->stepCounter = this->numSteps - 1;
  
  this->_set_output(this->stepCounter);
  delay(this->motorSpeed);


}
 
void MotorStepperClass::_set_output(int step) {
  digitalWrite(this->motorPin1, bitRead(this->stepsLookup[step], 0));
  digitalWrite(this->motorPin2, bitRead(this->stepsLookup[step], 1));
  digitalWrite(this->motorPin3, bitRead(this->stepsLookup[step], 2));
  digitalWrite(this->motorPin4, bitRead(this->stepsLookup[step], 3));
}

// static implementation overloading stepCounter.
void MotorStepperClass::Move(int counter, int steps, MotorStepperClass *motor) {
  for (int i=0; i< steps; i++) {
    if (counter == 1) motor->Clockwise();
    else motor->Anticlockwise();
  }
}