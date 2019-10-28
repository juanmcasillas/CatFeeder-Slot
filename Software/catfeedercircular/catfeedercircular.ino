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


#include "catfeeder.h"

// CatFeeder variable /////////////////////////////////////////////////////////

CatFeederClass CATFEEDER;

// include the callback code //////////////////////////////////////////////////

#include "callback.h"

/// ARDUINO BLOCK /////////////////////////////////////////////////////////////

void setup() {
    
    // configure CatFeeder Objects
    SPIFFS.begin();
    CATFEEDER.begin(&SPIFFS);

    // configure custom handlers first
    
    ESPHTTPServer.set_usercallbackfilter("/catfeeder");
    ESPHTTPServer.setUSERCallback(callbackFeeder);
    
    // WiFi is started inside library
    // Not really needed, checked inside and started if needed
    
    ESPHTTPServer.begin(&SPIFFS);
   
    // configure the logger to be served statically
    // maybe all the static elements in the directory
    // should be handled in this way.
    ESPHTTPServer.serveStatic("/catfeeder.log", SPIFFS, "/catfeeder.log");


    CATFEEDER.IsRunning();
    /* add setup code here */
}

/// MAIN LOOP /////////////////////////////////////////////////////////////////

void loop() {
    /* add main program code here */

    // DO NOT REMOVE. Attend OTA update from Arduino IDE
    ESPHTTPServer.handle();	
    
    //if (CATFEEDER.isBotActive()) {
    //    CATFEEDER.RunBot();
    //}
}
