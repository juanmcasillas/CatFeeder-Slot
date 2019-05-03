import os
from flask import Flask, render_template, request

app = Flask(__name__, 
    static_url_path='', 
    static_folder='catfeedercircular/data',
    template_folder='catfeedercircular/templates')  # templates not used for now.

@app.route('/')
def index():
    return app.send_static_file('index.html')

# TO IMPLEMENT
#/admin/values

#/admin/connectionstate

@app.route('/scan')
def scan():
    element = '{ "rssi": "%s", "ssid": "%s", "bssid": "%s","channel": %s, "secure": %s,"hidden": %s }'


    json = []
    json.append( element % ("RSSI1", "WLAN1", 12, 3, 2, "false") )
    json.append( element % ("RSSI2", "WLAN2", 14, 4, 4, "true") )

    return "[ %s ]" % ",".join(json)


@app.route('/admin/connectionstate')
def admin_connectionstate():
    return "connectionstate|CONNECTED|div" 


@app.route('/admin/values')
def admin_values():
    lines = []
    lines.append("ssid|MY_SSID|input")
    lines.append("password|MY_PASSWD|input")
    lines.append("ip_0|192|input")
    lines.append("ip_1|168|input")
    lines.append("ip_2|1|input")
    lines.append("ip_3|1|input")
    lines.append("nm_0|192|input")
    lines.append("nm_1|168|input")
    lines.append("nm_2|1|input")
    lines.append("nm_3|2|input")
    lines.append("gw_0|192|input")
    lines.append("gw_1|168|input")
    lines.append("gw_2|1|input")
    lines.append("gw_3|3|input")

    lines.append("dns_0|8|input")
    lines.append("dns_1|8|input")
    lines.append("dns_2|8|input")
    lines.append("dns_3|8|input")
    
    lines.append("dhcp||chk")

    return "\n".join(lines)
	
@app.route('/admin/generalvalues')
def admin_generalvalues():    
    lines = []
    lines.append("devicename|CatFeederDeviceName|input")
    lines.append("userversion|1.0|div")

    return "\n".join(lines)

@app.route('/admin/ntpvalues')
def admin_ntpvalues():    
    lines = []

    lines.append("ntpserver|es.pool.ntp.org|input")
    lines.append("update|3|input")
    lines.append("tz|10|input")
    lines.append("dst|checked|chk")

    return "\n".join(lines)

@app.route('/admin/infovalues')
def admin_infovalues():    
    lines = []

    lines.append("x_ssid|CONFIGURED_SSID|div")
    lines.append("x_ip|192.168.1.4|div")
    lines.append("x_gateway|192.168.1.1|div")
    lines.append("x_netmask|255.255.255.0|div")
    lines.append("x_mac|0A:0B:0C:0D:0E|div")
    lines.append("x_dns|8.8.8.8|div")
    lines.append("x_dhcp|Enabled|div")

    lines.append("x_ntp_sync|12/04/2019 12:32:33|div")
    lines.append("x_ntp_time|12:32:34|div")
    lines.append("x_ntp_date|12/04/2019|div")

    lines.append("x_uptime|3 days|div")
    lines.append("x_last_boot|09/04/2019 11:32:33|div")

    return "\n".join(lines)

@app.route('/admin/wwwauth')
def admin_wwwauth():    
    lines = []
 
    lines.append("wwwauth|checked|chk")
    lines.append("wwwuser|username|input")
    lines.append("wwwpass|passwd|input")
    return "\n".join(lines)

@app.route('/update/updatepossible')
def update_updatepossible():    
    lines = []

    lines.append("remupd|OK|div")
    lines.append("remupdResult||div")
    return "\n".join(lines)

@app.route('/admin/restart')
def admin_restart():    
    lines = []
    return "\n".join(lines)

@app.route('/admin/shutdown')
def admin_shutdown():    
    lines = []
    return "\n".join(lines)

@app.route('/setmd5')
def setmd5():    
    md5 = request.args.get('md5')
    size = request.args.get('size')
    app.logger.debug("md5: %s, size: %s bytes" % (md5,size) )
    return "";



#TODO
#/events
#/admin/infovalues
#/admin/ntpvalues
#/admin/wwwauth

#editor file (??)
#/edit crashes -> /edit.html
#/list?dir=/

@app.route('/catfeeder/status')
def feeder_status():    
    
    json = '{ "position": %d, "lastopen": "13/04/2019 18:33:22",  "nextopen": "13/04/2019 18:33:22" }' % (app.position+1)
    app.position = ((app.position +1) % 8)       
    return json

@app.route('/catfeeder/test_position')
def feeder_test_position():    
    json = '{ "position": %d }' % (app.test_position)   
    return json

@app.route('/catfeeder/test_moveto')
def feeder_test_moveto():    
    s = request.args.get('s',type=int)
    app.test_position = s
    json = '{ "position": %d }' % (app.test_position)   
    return json    

@app.route('/catfeeder/calibrate')
def feeder_calibrate():    
    d = request.args.get('d')
    s = request.args.get('s')
    app.logger.debug("direction: %s, step: %s" % (d,s) )

    # direction l counterclock (-1) r, clock (1)

    mult = 1
    if d == 'l': mult = -1
    app.offset += float(s) * mult
    json = '{ "offset": %d  }' % (app.offset)

    return json

@app.route('/catfeeder/calibrate_start')
def feeder_calibrate_start():    
    app.offset = 0
    json = '{ "offset": %d  }' % (app.offset)
    return json


@app.route('/POSTME', methods = ['POST'])
def feeder_postme():
    fields = [k for k in request.form]                                      
    values = [request.form[k] for k in request.form]
    data = dict(zip(fields, values))
    app.logger.debug(data)
    return ""

    
@app.route('/catfeeder/bot_config', methods = ['POST','GET'])
def feeder_bot_config():    
    fields = [k for k in request.form]                                      
    values = [request.form[k] for k in request.form]
    data = dict(zip(fields, values))
    app.logger.debug(data)
    
    token = ''
    if len(fields) > 0:
        token = data['bottoken']
    json = '{ "bottoken": "%s" }' % token
    return json



if __name__ == '__main__':
    app.position = 1
    app.offset=0
    app.test_position = 1
    app.run(debug=True, host='0.0.0.0', port=6060)