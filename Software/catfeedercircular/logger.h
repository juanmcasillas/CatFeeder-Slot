// use 4 letter to create the include files CATF
#ifndef __CATFEEDER_LOGGER__H__
#define __CATFEEDER_LOGGER__H__

#include <Arduino.h>
#include <FS.h>

#ifndef DBG_OUTPUT_PORT
#define DBG_OUTPUT_PORT Serial
#endif 

#ifndef RELEASE
#define DEBUGLOG(...) DBG_OUTPUT_PORT.printf(__VA_ARGS__)
#else
#define DEBUGLOG(...)
#endif


class LoggerClass {      
protected:
    String fname;
    File   fd;
    FS *_fs;
    bool ENABLE_SERIALDEBUG = true;

    const static char *levels[];   
    const static byte _DEBUG;
    const static byte _INFO;
    const static byte _WARNING;
    const static byte _ERROR;

public:
    LoggerClass();

    bool begin(FS *fs, String fname);
    void EnableSerialDebug(int speed);


    void DEBUG_LOG(const char *fmt, ...); // to serial port

    void DEBUG(const char *fmt, ...);
    void INFO(const char *fmt, ...);
    void WARNING(const char *fmt, ...);
    void ERROR(const char *fmt, ...);

    bool Truncate();

protected:
    void log(int level, const char *fmt, va_list pArg);   // to file.
    String build_entry(const char *fmt, va_list pArg);
    String timestamp_mark();

};

extern LoggerClass LOGGER;

#endif