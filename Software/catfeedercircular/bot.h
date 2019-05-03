#ifndef __CATFEEDER_BOT_H__
#define __CATFEEDER_BOT_H__

#include <Arduino.h>
#include <ESP8266WiFi.h>
#include <WiFiClientSecure.h>
#include <UniversalTelegramBot.h>

class BotClass {
    public:
        String token = "";
        UniversalTelegramBot *botimpl = 0;

        bool Init(String token);
        inline bool isActive() { return _active; }
        

        // external interface to manage the bot.

        boolean needsRun(); // check if the interval has passed
        void updateRun();   // update timestamp marks
        
        int getUpdates();
        String getMessage(int i);
        String getId(int i);
        bool sendMessage(String id, String msg);
        
       
    protected:
        WiFiClientSecure _client;
        bool _active = false;

        // interval configuration
        int Bot_lasttime = 0;
        int Bot_rcv_delay = 1000; // 1 second
        int last_message_received = 0;
};

#endif