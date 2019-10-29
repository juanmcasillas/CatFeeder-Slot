///////////////////////////////////////////////////////////////////////////////
/// STEPPER MOTOR Adapter /////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////

#ifndef __MOTORSTEPPERCLASS_H__
#define __MOTORSTEPPERCLASS_H__

#include <Arduino.h>
#include <Servo.h>

#ifndef DBG_OUTPUT_PORT
#define DBG_OUTPUT_PORT Serial
#endif 

#ifndef RELEASE
#define DEBUGLOG(...) DBG_OUTPUT_PORT.printf(__VA_ARGS__)
#else
#define DEBUGLOG(...)
#endif



class MotorStepperClass {
    public:
        int stepsPerRev = 4096;  // pasos para una vuelta completa
        //int stepsPerRev = 4076;  // pasos para una vuelta completa
        const int numSteps = 4;
    protected:
        // motor: 28BYJ48
        // driver ULN2003
        //                             ESP8266           ULN2003 COLOR
        const int motorPin1 = D1;   // D1  (GPIO14)      IN1     black 
        const int motorPin2 = D2;   // D2  (GPIO12)      IN2     white 
        const int motorPin3 = D5;   // D5  (GPIO13)      IN3     Blue  
        const int motorPin4 = D6;   // D6  (GPIO15)      IN4     Red 
        
        int motorSpeed =  5;      // variable para fijar la velocidad milis
        int stepCounter = 0;     // contador para los pasos
        
        
        //tablas con la secuencia de encendido (descomentar la que necesiteis)
        //secuencia 1-fase
        //const int numSteps = 4;
        //const int stepsLookup[4] = { B1000, B0100, B0010, B0001 };
        
        //secuencia 2-fases
        
        const int stepsLookup[4] = { B1100, B0110, B0011, B1001 };
        
        //secuencia media fase
        //const int numSteps = 8;
        //const int stepsLookup[8] = { B1000, B1100, B0100, B0110, B0010, B0011, B0001, B1001 };
    
    public:
        void begin();
        void Clockwise();
        void Anticlockwise();
        static void Move(int counter, int steps, MotorStepperClass *motor);

    protected:

       void _set_output(int step);
};



#endif