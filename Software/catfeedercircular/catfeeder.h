///////////////////////////////////////////////////////////////////////////////
/// CATFEEDER Adapter /////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////

#ifndef __CATFEEDER_H__
#define __CATFEEDER_H__

#include <Arduino.h>
#include <ESP8266WiFi.h>
#include <FS.h>
#include <WiFiClient.h>
#include <TimeLib.h>
#include <NtpClientLib.h>
#include <ESPAsyncTCP.h>
#include <ESPAsyncWebServer.h>
#include <ESP8266mDNS.h>
#include <Ticker.h>
#include <ArduinoOTA.h>
#include <ArduinoJson.h>
#include <FSWebServerLib.h>
#include <Hash.h>

//#include "bot.h"
#include "logger.h"
#include "motorstepper.h"

#define CATFEEDER_SLOTS 8
#define CATFEEDER_PROGRAMS CATFEEDER_SLOTS-1

extern MotorStepperClass CATFEEDER_STEPPER_MOTOR;

class CatFeederClass {
    public:
        int position = 1; // to set the position of the feeder (there are put from outside, so watch out) // CONFIG
        int test_position = 1; // the test position used to test the calibration
        int offset = 0; // the offset for the calibration process    
        String lastopen = ""; // CONFIG
        String nextopen = ""; // CONFIG

    protected:
        String CATFEEDER_CONFIG_FILE =  "/catfeeder.json";
        String LOGGER_FILE = "/catfeeder.log";
        
        MotorStepperClass *_motor = &CATFEEDER_STEPPER_MOTOR;
        LoggerClass _logger;
        //BotClass _bot;
        String wifissid = "";
        String wifipassword = "";

        String scheduler[CATFEEDER_PROGRAMS];   // CONFIG   
        int SLOTS = CATFEEDER_SLOTS;
        int PROGRAMS = CATFEEDER_PROGRAMS;
        int ANGLE = abs(360 / CatFeederClass::SLOTS);
        float SCHEDULE_PERIOD = 1.0f;
        


        FS *_fs;            // ICPFS implementation
        Ticker _ticker;     // Periodic Time Dispatcher (see CheckScheduler)

    public:
        String begin(FS* fs);
        void IsRunning(); // shows the start information
        void DEBUG(String s); // shows a simple trace (to test the log, remove it)
        static void CheckScheduler(void *arg); // Programmed each 1 second. Passed myself as arg.
        int AdvanceSlot(); // advance the feeder in 1 slot
        
        inline int getPROGRAMS() { return this->PROGRAMS; }
        inline String getScheduler(int p) { return this->scheduler[p]; }
        inline void setLastOpen(String s) { this->lastopen = s; }
        inline LoggerClass *getLogger() { return &this->_logger; }

        // exposed WWW methods (REST)
        String Status(AsyncWebServerRequest *request);
        String Calibrate(AsyncWebServerRequest *request);
        String Calibrate_Start(AsyncWebServerRequest *request);
        String Calibrate_Restore(AsyncWebServerRequest *request);
        String Test_MoveTo(AsyncWebServerRequest *request);
        String Test_Position(AsyncWebServerRequest *request);
        String Scheduler_Config(AsyncWebServerRequest *request);
        String Scheduler_Reset(AsyncWebServerRequest *request);
        String Get_Log(AsyncWebServerRequest *request);
        String Reset_Log(AsyncWebServerRequest *request);
        String Bot_Config(AsyncWebServerRequest *request);

        String GetTimeStampNow();
        unsigned long ToTimestamp(String d); 

        // bot management.
        bool RunBot();
        //inline bool isBotActive() { return this->_bot.isActive(); }

    // internal methods used to do things
    protected:
        // configuration management

        bool SaveConfig();
        bool LoadConfig();

        // helpers
        int _pos_in_range(int pos); // configure the position inside the range (SLOTS)

        // motor comander
        void _motor_moveto(int a, int b); // move the motor to slot given in pos
        void _sort(int a[], int size);
};

#endif
