///////////////////////////////////////////////////////////////////////////////
// Dispatcher callback ////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////

#ifndef __CALLBACKFEEDER_H__
#define __CALLBACKFEEDER_H__

void callbackFeeder(AsyncWebServerRequest *request) {

    // DEBUGLOG("CatFeederHandler: [%s]\n", request->url().c_str());

    //
    // remove this. Just for tests the LOGGER.
    // CATFEEDER.DEBUG(request->url());
    //
    
	if (request->url() == "/catfeeder/hello") {
	
		//contruct and send and desired response
		request->send(200, "text/plain", "<h1>hello world</h1>\n");
        return;
		
	}
    if (request->url() == "/catfeeder/status") {
        String ret = CATFEEDER.Status(request);
        DEBUGLOG("callbackFeeder:/status: (%s)\n",ret.c_str());
        request->send(200, "text/plain", ret);
        return;
    }

    if (request->url() == "/catfeeder/calibrate") {
        String ret = CATFEEDER.Calibrate(request);
        DEBUGLOG("callbackFeeder:/calibrate: (%s)\n",ret.c_str());
        request->send(200, "text/plain", ret);
        return;
    }

    if (request->url() == "/catfeeder/calibrate_start") {
        String ret = CATFEEDER.Calibrate_Start(request);
        DEBUGLOG("callbackFeeder:/calibrate_start: (%s)\n",ret.c_str());
        request->send(200, "text/plain", ret);
        return;
    }

    if (request->url() == "/catfeeder/calibrate_restore") {
        String ret = CATFEEDER.Calibrate_Restore(request);
        DEBUGLOG("callbackFeeder:/calibrate_restore: (%s)\n",ret.c_str());
        request->send(200, "text/plain", ret);
        return;
    }

    if (request->url() == "/catfeeder/test_moveto") {
        String ret = CATFEEDER.Test_MoveTo(request);
        DEBUGLOG("callbackFeeder:/test_moveto: (%s)\n",ret.c_str());
        request->send(200, "text/plain", ret);
        return;
    }    

    if (request->url() == "/catfeeder/test_position") {
        String ret = CATFEEDER.Test_Position(request);
        DEBUGLOG("callbackFeeder:/test_position: (%s)\n",ret.c_str());
        request->send(200, "text/plain", ret);
        return;
    }   

    if (request->url() == "/catfeeder/scheduler_config") {
        String ret = CATFEEDER.Scheduler_Config(request);
        DEBUGLOG("callbackFeeder:/scheduler_config: (%s)\n",ret.c_str());
        request->send(200, "text/plain", ret);
        return;
    } 

    if (request->url() == "/catfeeder/scheduler_reset") {
        String ret = CATFEEDER.Scheduler_Reset(request);
        DEBUGLOG("callbackFeeder:/scheduler_reset: (%s)\n",ret.c_str());
        request->send(200, "text/plain", ret);
        return;
    } 

    if (request->url() == "/catfeeder/get_log") {
        String ret = CATFEEDER.Get_Log(request);
        DEBUGLOG("callbackFeeder:/get_log: (...)\n");
        request->send(200, "text/plain", ret);
        return;
    } 
      
    if (request->url() == "/catfeeder/reset_log") {
        String ret = CATFEEDER.Reset_Log(request);
        DEBUGLOG("callbackFeeder:/reset_log: (%s)\n",ret.c_str());
        request->send(200, "text/plain", ret);
        return;
    } 

    if (request->url() == "/catfeeder/bot_config") {
        String ret = CATFEEDER.Bot_Config(request);
        DEBUGLOG("callbackFeeder:/bot_config: (%s)\n",ret.c_str());
        request->send(200, "text/plain", ret);
        return;
    } 

   

  
}

#endif