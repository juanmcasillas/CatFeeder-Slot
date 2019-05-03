#include "bot.h"

bool BotClass::Init(String token) {
    this->token = token;

    if (this->token == "") {
        return false;
    }

    if (_client.connected()) {
        _client.stop();
    }

    if (this->botimpl != 0) {
        delete this->botimpl;
        this->botimpl = 0;
    }
    
    _client.setInsecure();
    botimpl = new UniversalTelegramBot(this->token, this->_client);
    this->_active = true;
    return true;
}

int BotClass::getUpdates() {
    return this->botimpl->getUpdates(this->last_message_received + 1);
}

void BotClass::updateRun() { 
    this->Bot_lasttime = millis(); 
}

boolean BotClass::needsRun() { 
    return (millis() > this->Bot_lasttime + this->Bot_rcv_delay); 
}

String BotClass::getMessage(int i) { 
    return this->botimpl->messages[i].text; 
}

String BotClass::getId(int i) { 
    return this->botimpl->messages[i].chat_id; 
}

bool BotClass::sendMessage(String id, String msg) { 
    return  this->botimpl->sendMessage(id, msg, "");
}