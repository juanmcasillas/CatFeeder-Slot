///////////////////////////////////////////////////////////////////////////////
/// CATFEEDER Adapter /////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////

#include "catfeeder.h"

 MotorStepperClass CATFEEDER_STEPPER_MOTOR;

// arduino init
String CatFeederClass::begin(FS *fs) {
    
    if (!DBG_OUTPUT_PORT) {
        DBG_OUTPUT_PORT.begin(115200);
	    DBG_OUTPUT_PORT.print("\n\n");
    #ifndef RELEASE
	    DBG_OUTPUT_PORT.setDebugOutput(true);
    #endif
    }

    _fs = fs;
    if (!_fs) { _fs->begin(); }

    // init the logger
    if (!_logger.begin(_fs, this->LOGGER_FILE)) {
        DEBUGLOG("Can't open logger file: %s\n", this->LOGGER_FILE.c_str());
    }

    _logger.INFO("CatFeeder starting");

    // init the refence to the stepper
    _motor->begin();

    // load configuration
    this->LoadConfig();

    // configure the scheduler checker. Do the things each second.

    _ticker.attach(this->SCHEDULE_PERIOD, &CatFeederClass::CheckScheduler, static_cast<void*>(this)); 

}

// show some log info about configuration, starts, and so on (e.g. position, dates, schedules)
void CatFeederClass::IsRunning() {
    _logger.INFO("CatFeeder is Running and Handle Requests!");
    _logger.INFO(" CONFIG::position: %d", this->position);
    _logger.INFO(" CONFIG::lastopen: %s", this->lastopen.c_str());
    _logger.INFO(" CONFIG::nextopen: %s", this->nextopen.c_str());
    for (int i=0; i< this->PROGRAMS; i++) {
        _logger.INFO(" CONFIG::schedule[%d]: %s", i, this->scheduler[i].c_str());
    }

    DEBUGLOG("\r\n");
    DEBUGLOG("Flash chip size: %u\r\n", ESP.getFlashChipRealSize());
    DEBUGLOG("Scketch size: %u\r\n", ESP.getSketchSize());
    DEBUGLOG("Free flash space: %u\r\n", ESP.getFreeSketchSpace());
    DEBUGLOG("Heap Available: %u\r\n", ESP.getFreeHeap());
}

// exercise the logger with some data
void CatFeederClass::DEBUG(String s) {
    _logger.DEBUG(s.c_str());
}

// advance the slot to feed. Used now to animate the first page to test things
int CatFeederClass::AdvanceSlot() {
    int new_position = ((this->position +1) % 8);
    int pre_position = this->position;
    this->position = new_position;
    this->_motor_moveto(pre_position, new_position);
    this->SaveConfig();
    this->_logger.INFO("SLOT #%d opened", new_position);
}


// get the status of the CatFeeder (sys_cal.html)
String CatFeederClass::Calibrate_Start(AsyncWebServerRequest *request) {

    this->offset = 0;
    this->position = 1; // first slot

    
    StaticJsonDocument<500> root;
    //JsonObject& root = jsonBuffer.createObject();
    root["offset"] = this->offset;
    
    String ret;
    serializeJson(root, ret);
    return(ret);
}


// set the position again, after testing the thing
// return the contents to the right position
String CatFeederClass::Calibrate_Restore(AsyncWebServerRequest *request) {
   
    if (this->test_position != this->position) {
        this->_motor_moveto(this->test_position,this->position);
        this->test_position = this->position;
    }

    return( this->Test_Position(request) );
}


// get the status of the CatFeeder (index.html)
String CatFeederClass::Status(AsyncWebServerRequest *request) {
    StaticJsonDocument<500> root;
    //JsonObject& root = jsonBuffer.createObject();
    root["position"] = this->position;
    root["lastopen"] = this->lastopen;
    root["nextopen"] = this->nextopen;
   
    String ret;
    serializeJson(root,ret);
    return(ret);
}

// move the motor to ensure the calibration (sys_cal.html)
// requires handle the motor here (next)
String CatFeederClass::Calibrate(AsyncWebServerRequest *request) {
    


    if (!request->hasArg("d") || !request->hasArg("s")) { 
        request->send(500, "text/plain", "BAD ARGS"); 
        return(""); // not reached, really
    }
    
    // get parameters
    String d = request->arg("d");
    int s = atoi(request->arg("s").c_str());

    // direction l counterclock (-1) r, clock (1)
    int mult = ( d  == "l" ? -1 : 1 );
    this->offset += s * mult;

    DEBUGLOG("CatFeederClass::Calibrate: s:%d, d:%s\n", s, ( mult == 1 ? "clockwise": "anticlockwise" ));
    schedule_function(std::bind(MotorStepperClass::Move, mult, s, _motor));

    /*
    schedule_function(
		[](s){
            // move the motor n steps remember that we have configured the motor
            // by default as half step, so we have to command two moves.

            for (int i=0; i< s; i++) {
                if (mult == 1) _motor.Clockwise();
                else _motor.Anticlockwise();

                DEBUGLOG("CatFeederClass::Calibrate: moving motor %s step #%d\n",
                    ( mult == 1 ? "clockwise": "anticlockwise" ),
                    i+1);
            }
		}
		});
    */

    StaticJsonDocument<500> root;
    //JsonObject& root = jsonBuffer.createObject();
    root["offset"] = this->offset;
    
    String ret;
    serializeJson(root,ret);
    return(ret);
}



// move the feeder to the given slot CatFeeder (sys_cal.html)
String CatFeederClass::Test_MoveTo(AsyncWebServerRequest *request) {

    if (!request->hasArg("s")) { 
        request->send(500, "text/plain", "BAD ARGS"); 
        return(""); // not reached, really
    }
    
    // get parameters
    int b = atoi(request->arg("s").c_str());
    int a = this->test_position;

    // range check
    b = this->_pos_in_range(b);
    
    if (a != b) {
        this->_motor_moveto(a,b);
        this->test_position = b;
    }

    StaticJsonDocument<500> root;
    //JsonObject& root = jsonBuffer.createObject();
    root["position"] = this->test_position;

    String ret;
    serializeJson(root,ret);
    return(ret);
}

// get the test position of the CatFeeder (sys_cal.html)
String CatFeederClass::Test_Position(AsyncWebServerRequest *request) {

    StaticJsonDocument<500> root;
    //JsonObject& root = jsonBuffer.createObject();
    root["position"] = this->test_position;

    String ret;
    serializeJson(root,ret);
    return(ret);
}



// scheduler functions
String CatFeederClass::Scheduler_Config(AsyncWebServerRequest *request) {


	if (request->params() > 0)  // Save Scheduler Settings
	{

        // clear configuration
        this->lastopen = "";
        for (int i=0; i< this->PROGRAMS; i++) this->scheduler[i] = "";

        int ptr = 0;
        this->_logger.INFO("Storing programs");
		for (uint8_t i = 0; i < request->params(); i++) {
            AsyncWebParameter* p = request->getParam(i);
			
            if (p->name().startsWith("sched_") && p->value() != "") { 
                this->scheduler[ptr] = p->value();
                ptr++;
                if (ptr > this->PROGRAMS) break;
                DEBUGLOG("Arg %d: %s = %s\r\n", i, p->name().c_str(), p->value().c_str());
                this->_logger.INFO("Program #%d: %s", i, p->value().c_str());
            }
		}
        
		this->SaveConfig();
		this->_logger.INFO("Configuration saved");
        //request->redirect("/schedule.html");
        //request->redirect("/"); // to force the reload of the configuration :(
        //return("OK"); // not reached
	}

    // always return the data
    // retrieve data as json

    StaticJsonDocument<500> root;
    //JsonObject& root = jsonBuffer.createObject();
    JsonObject doc = root.to<JsonObject>();
    JsonArray jsonscheduler = doc.createNestedArray("scheduler");
	
    for (int i=0; i< this->PROGRAMS; i++) {
        jsonscheduler.add(this->scheduler[i]);
    }

    String ret;
    serializeJson(root,ret);
    return(ret);
}


// scheduler functions
String CatFeederClass::Scheduler_Reset(AsyncWebServerRequest *request) {


	
    // clear configuration and position
    this->_logger.INFO("Reset programs. Setting position to initial value (1)");
    for (int i=0; i< this->PROGRAMS; i++) this->scheduler[i] = "";
    this->_motor_moveto(this->position, 1);
    this->position = 1;
    this->lastopen = "";
  
   	this->SaveConfig();
	this->_logger.INFO("Configuration saved");

    // always return the data
    // retrieve data as json

    StaticJsonDocument<500> root;
    JsonObject doc = root.to<JsonObject>();
    JsonArray jsonscheduler = doc.createNestedArray("scheduler");
	
    for (int i=0; i< this->PROGRAMS; i++) {
        jsonscheduler.add(this->scheduler[i]);
    }

    String ret;
    serializeJson(root,ret);
    return(ret);
}


String CatFeederClass::Get_Log(AsyncWebServerRequest *request) {
    File logfd = _fs->open(this->LOGGER_FILE,"r");
    if (!logfd) {
        return ("CAN'T OPEN LOG FILE");
    }

    String ret = "";
    while (logfd.available()){
            ret += char(logfd.read());
    }
    logfd.close();
    return(ret);

}
String CatFeederClass::Reset_Log(AsyncWebServerRequest *request) {
    this->_logger.Truncate();
    return("*log truncated*");  
}


////
/// config

bool CatFeederClass::SaveConfig() {

	StaticJsonDocument<512> json;
    JsonObject doc = json.to<JsonObject>();
   //StaticJsonDocument<1024> jsonBuffer;
	//JsonObject& json = jsonBuffer.createObject();
    json["position"] = this->position;
    json["lastopen"] = this->lastopen;
    json["nextopen"] = this->nextopen; // deprecated.
    //json["bottoken"] = this->_bot.token;

	JsonArray jsonscheduler = doc.createNestedArray("scheduler");
    for (int i=0; i < this->PROGRAMS; i++) {
	    jsonscheduler.add(this->scheduler[i]);
    }

	File configFile = _fs->open(CATFEEDER_CONFIG_FILE, "w");
	if (!configFile) {
		DEBUGLOG("Failed to open config file %s for writing\r\n", CATFEEDER_CONFIG_FILE.c_str());
		configFile.close();
		return false;
	}

#ifndef RELEASE
	String temp;
    serializeJsonPretty(json, temp);
	//json.prettyPrintTo(temp);
    DEBUGLOG(temp.c_str());
#endif

	serializeJson(json,configFile);
	configFile.flush();
	configFile.close();
	return true;
}

bool CatFeederClass::LoadConfig() {

	File configFile = _fs->open(CATFEEDER_CONFIG_FILE, "r");
	if (!configFile) {
		DEBUGLOG("CatFeeder: Failed to open config file %s\n", CATFEEDER_CONFIG_FILE.c_str());
		return false;
	}

	size_t size = configFile.size();
	std::unique_ptr<char[]> buf(new char[size]);

	configFile.readBytes(buf.get(), size);
	configFile.close();
	DEBUGLOG("JSON file size: %d bytes\r\n", size);
	StaticJsonDocument<1024> json;
	//JsonObject& json = jsonBuffer.parseObject(buf.get());

    auto error = deserializeJson(json, buf.get());
	if (error) {
		DEBUGLOG("CatFeeder: Failed to parse config file %s\r\n", CATFEEDER_CONFIG_FILE.c_str());
		return false;
	}
#ifndef RELEASE
	String temp;
	serializeJsonPretty(json, temp);
	DEBUGLOG(temp.c_str());
#endif
    
    if (json.containsKey("position")) {
        this->position = json["position"].as<int>();
    }

    if (json.containsKey("lastopen")) {
        this->lastopen = json["lastopen"].as<const char *>();
    }
   
    if (json.containsKey("nextopen")) {
        this->nextopen = json["nextopen"].as<const char *>();
    }

    //if (json.containsKey("bottoken")) {
    //    this->_bot.token = json["bottoken"].as<const char *>();
    //}

    if (json.containsKey("scheduler")) {
        for (int i=0; i < this->PROGRAMS; i++) {
            this->scheduler[i] = json["scheduler"][i].as<const char *>();
        }
    }
    
	DEBUGLOG("CatFeederConfig Config initialized.\r\n");
	DEBUGLOG("position:  %d\n", this->position);
    DEBUGLOG("lastopen:  %s\n", this->lastopen.c_str());
    DEBUGLOG("nextopen:  %s\n", this->nextopen.c_str());
    //DEBUGLOG("bot token: %s\n", this->_bot.token.c_str());

    for (int i=0; i < this->PROGRAMS; i++) {
        DEBUGLOG("scheduler[%d]: %s\n", i, this->scheduler[i].c_str());
    }
    DEBUGLOG("\n\n");
	return true;
}

// schedule things

void CatFeederClass::CheckScheduler(void *arg) {
    CatFeederClass *self = reinterpret_cast<CatFeederClass *>(arg);

    // TODO
    //DEBUGLOG("TICK: %s\n", self->GetTimeStampNow().c_str());
    
    int programs = self->getPROGRAMS();
    unsigned long mystamp,prgstamp;
    
    String mytime = self->GetTimeStampNow();
    mystamp = self->ToTimestamp(mytime);

    for (int i=0; i< programs; i++) {
        String sched = self->getScheduler(i);
        if (sched != "") {
            prgstamp = self->ToTimestamp(sched);
            // DEBUGLOG(" TICK_check #%d: %s->%s | %lu|%lu\n", i, mytime.c_str(), sched.c_str(), mystamp, prgstamp);
            if (mystamp == prgstamp) {
                // do things if matches
                DEBUGLOG(" TICK_MATCH! #%d %s %s\n", i, mytime.c_str(), sched.c_str());
                 self->setLastOpen(sched.c_str());
                 self->AdvanceSlot();
            }
        }
    }
}

// build the string just like the scheduled.
String CatFeederClass::GetTimeStampNow() {
    time_t t = now(); 
    char *buf = (char *)malloc(1024);
    sprintf(buf, "%02d/%02d/%04d %02d:%02d:%02d", day(t), month(t), year(t), hour(t), minute(t), second(t));
    String ret = buf;
    free(buf);
    return(ret);
}

unsigned long CatFeederClass::ToTimestamp(String d) {
    // EPOCH 01/01/1970 00:00:00
    // 1 hour	3600 seconds
    // 1 day	86400 seconds
    // 1 week	604800 seconds
    // 1 month (30.44 days) 	2629743 seconds
    // 1 year (365.24 days) 	 31556926 seconds


    int day, month, year, hour, minute, second;

    sscanf(d.c_str(),"%02d/%02d/%04d %02d:%02d:%02d",
         &day, &month, &year, &hour, &minute, &second);
    
    unsigned long ret;

    ret = (year-1970 * (unsigned long)31556926) + (month * 2629743) + (day * 86400) +
          (hour * 3600) + (minute * 60) + second;
    
    return(ret);
}


// Save Telegram Bot Token

String CatFeederClass::Bot_Config(AsyncWebServerRequest *request) {

	if (request->params() > 0 && request->hasParam("bottoken")) { // Save Bot Settings 

        // clear configuration
        AsyncWebParameter* p = request->getParam("bottoken",true);
        DEBUGLOG("Bot Token %s = %s\r\n", p->name().c_str(), p->value().c_str());
        
        //this->_bot.Init(p->value());
		this->SaveConfig();

		this->_logger.INFO("Configuration saved");
	}

    // always return the data
    // retrieve data as json

    StaticJsonDocument<500> root;
    //JsonObject& root = jsonBuffer.createObject();
    //root["bottoken"] = this->_bot.token;
    root["bottoken"] = "XXXX";

    String ret;
    serializeJson(root,ret);
    return(ret);
}


// run the bot loop
bool CatFeederClass::RunBot() {
/*
    if (this->_bot.needsRun()) {
        int numNewMessages = this->_bot.getUpdates();
        while(numNewMessages) {
            for (int i=0; i<numNewMessages; i++) {
                
                String in_msg = this->_bot.getMessage(i);
                String in_id = this->_bot.getId(i);

                // do something with the message here.
                String out_msg = "Meow Meow (" + in_msg + ")";

                this->_bot.sendMessage(in_id, out_msg);
            }
            numNewMessages = this->_bot.getUpdates();
            }

        this->_bot.updateRun();
    }
*/
}




///////////////////////////////////////////////////////////////////////////////
// Internal methods ///////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////

// move the motor to the slot pos. See the 
// current position and calculate what is the minimum route

void CatFeederClass::_motor_moveto(int a, int b) {

    int dir = 1;
    int distance = 0;
    int steps = 0;
    int angle = 0;
    int sol[3];
    int sol_1 = abs((b - a));
    int sol_2 = abs(((this->SLOTS-b)+a));
    int sol_3 = abs(((this->SLOTS-a)+b));
 
    sol[0] = sol_1;
    sol[1] = sol_2;
    sol[2] = sol_3;

    this->_sort(sol,3);
    distance = sol[0];

    if (distance == sol_1) dir = ( b > a ? 1  : -1 );
    if (distance == sol_2) dir = ( b > a ? -1 :  1 );
    if (distance == sol_3) dir = ( b > a ? -1 :  1 );

    // calculate steps to do the required angle
    angle = this->ANGLE * distance;
    steps = abs(_motor->stepsPerRev*angle/(360*2));

    // move the motor n steps remember that we have configured the motor
    // by default as half step, so we have to command two moves.

    DEBUGLOG("CatFeederClass::Test_MoveTo: %d->%d a:%d, d:%d s:%d, dr:%s\n", a,b, angle, distance, steps, ( dir == 1 ? "clockwise": "anticlockwise" ));
    schedule_function(std::bind(MotorStepperClass::Move, dir, steps, _motor));

    /*
    schedule_function(
            [](){
            for (int i=0; i< steps; i++) {
                    ( mult == 1 ? _motor.Clockwise(): _motor.Anticlockwise() );
            }        
        });
    */
    

}

int CatFeederClass::_pos_in_range(int pos) {
    // range check
    pos = (pos > this->SLOTS ? this->SLOTS: pos);
    pos = (pos < 1 ? 1 : pos);
    return(pos);
}

void CatFeederClass::_sort(int a[], int size) {
    for(int i=0; i<(size-1); i++) {
        for(int o=0; o<(size-(i+1)); o++) {
                if(a[o] > a[o+1]) {
                    int t = a[o];
                    a[o] = a[o+1];
                    a[o+1] = t;
                }
        }
    }
}


