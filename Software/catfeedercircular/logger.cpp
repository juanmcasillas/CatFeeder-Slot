#include <TimeLib.h>
#include <FS.h>

#include "logger.h"

LoggerClass LOGGER;

const char *LoggerClass::levels[] = { "DEBUG", "INFO", "WARNING", "ERROR" };
const byte LoggerClass::_DEBUG = 0;
const byte LoggerClass::_INFO = 1;
const byte LoggerClass::_WARNING = 2;
const byte LoggerClass::_ERROR = 3;


bool LoggerClass::begin(FS *fs, String fname) {

    if (!DBG_OUTPUT_PORT) {
        DBG_OUTPUT_PORT.begin(115200);
	    DBG_OUTPUT_PORT.print("\n\n");
    #ifndef RELEASE
	    DBG_OUTPUT_PORT.setDebugOutput(true);
    #endif
    }

    _fs = fs;
    if (!_fs) { _fs->begin(); }
    
    this->fname = fname;
    this->fd = _fs->open(this->fname,"a");
    if (!this->fd) {
        return (false);
    }
    return(true);
}

bool LoggerClass::Truncate() {
  if (this->fd) {
      // not implemented in my version so ...
      // return( SPIFFS_truncate(_fs, this->fd) );
      this->fd.close();
      _fs->remove(this->fname);
      this->fd = _fs->open(this->fname,"a");
      if (!this->fd) {
        return (false);
      }
  }  
  return(false);
}

LoggerClass::LoggerClass() {
    this->fname = "";
}

void LoggerClass::EnableSerialDebug(int speed) {
    LoggerClass::ENABLE_SERIALDEBUG = true;
    if (!ENABLE_SERIALDEBUG) return
    Serial.begin(speed);
}

void LoggerClass::DEBUG_LOG(const char *fmt, ...) {
    if (!LoggerClass::ENABLE_SERIALDEBUG) return;
    va_list pArg;
    va_start(pArg, fmt);
    String ret = this->build_entry(fmt, pArg);
    va_end(pArg);    

    // write to Serial Port
    DBG_OUTPUT_PORT.write(ret.c_str());
}

void LoggerClass::DEBUG(const char *fmt, ...) {
    if (!this->fd) return;    
    va_list pArg;
    va_start(pArg, fmt);
    this->log(this->_DEBUG, fmt, pArg);
    va_end(pArg);    

}
void LoggerClass::INFO(const char *fmt, ...) {

    if (!this->fd) return;    
    va_list pArg;
    va_start(pArg, fmt);
    this->log(this->_INFO, fmt, pArg);
    va_end(pArg);   

}
void LoggerClass::WARNING(const char *fmt, ...){
    if (!this->fd) return;    
    va_list pArg;
    va_start(pArg, fmt);
    this->log(this->_WARNING, fmt, pArg);
    va_end(pArg);   
}
void LoggerClass::ERROR(const char *fmt, ...){
    if (!this->fd) return;    
    va_list pArg;
    va_start(pArg, fmt);
    this->log(this->_ERROR, fmt, pArg);
    va_end(pArg);   
}



// protected methods

void LoggerClass::log(int level, const char *fmt, va_list pArg) {

    String ret = this->build_entry(fmt, pArg);
    String tmark = this->timestamp_mark();
    int lensz = tmark.length() + ret.length() + 16;
    char *log = (char *)malloc(lensz);

    sprintf(log,"[%s] [%s] %s\n", tmark.c_str(), this->levels[level], ret.c_str());
    // write to log. PrettyPrint the buffer.
     int v = this->fd.write((uint8_t *)log, strlen(log));
    this->fd.flush();
    free(log);
}


String LoggerClass::build_entry(const char *fmt, va_list pArg) {
    char *buf = (char *)malloc(1024);
    int len = vsprintf(buf, fmt, pArg);
    
    String ret = buf;
    free(buf);
    return(ret);
}

String LoggerClass::timestamp_mark() {
    time_t t = now(); 
    char *buf = (char *)malloc(1024);
    sprintf(buf, "%02d/%02d/%04d %02d:%02d:%02d", day(t), month(t), year(t), hour(t), minute(t), second(t));
    String ret = buf;
    free(buf);
    return(ret);
}

