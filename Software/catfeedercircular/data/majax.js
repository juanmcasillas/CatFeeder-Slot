function microAjax(B,A){
    this.bindFunction=function(E,D) {
        return function() {
            return E.apply(D,[D]);
        };
    };
    this.stateChange=function(D) {
        if (this.request.readyState == 4) {
            this.callbackFunction(this.request.responseText);
        }
    };
    this.getRequest = function () {
        if (window.ActiveXObject) {
            return new ActiveXObject("Microsoft.XMLHTTP");
        } else {
            if (window.XMLHttpRequest) {
                return new XMLHttpRequest();
            }
        } return false;
    };
    this.postBody = (arguments[2] || "");
    this.callbackFunction = A;
    this.url = B;
    this.request = this.getRequest();
    if (this.request) {
        var C = this.request;
        C.onreadystatechange = this.bindFunction(this.stateChange, this);
        if (this.postBody !== "") {
            C.open("POST", B, true);
            C.setRequestHeader("X-Requested-With", "XMLHttpRequest");
            C.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
            C.setRequestHeader("Connection", "close");
        } else {
            C.open("GET", B, true);
        }
        C.send(this.postBody);
    }
}

function setValues2(url)
{
	microAjax(url, function (res) {
	    res.split(String.fromCharCode(10)).forEach(
            function (entry) {
		        fields = entry.split("|");
		        if(fields[2] == "input") {
                    var d = document.getElementById(fields[0]);
                    if (d) {
                        d.value = fields[1];
                    }
		        }
		        else if(fields[2] == "div") {
                    var d = document.getElementById(fields[0]);
				    if (d) {
                        d.innerHTML  = fields[1];
                    }
		        } else if(fields[2] == "chk") {
                    var d = document.getElementById(fields[0]);
                    if (d) {
                        d.checked  = fields[1];
                    }
				    
		        }
            }
        );
	});
}

/* My ajax implementation, so it becomes async and support multiple threads (calls) */

function ajax(url, method, data, async, callback)
{
    method = typeof method !== 'undefined' ? method : 'GET';
    async = typeof async !== 'undefined' ? async : false;

    if (window.XMLHttpRequest)
    {
        var xhReq = new XMLHttpRequest();
    }
    else
    {
        var xhReq = new ActiveXObject("Microsoft.XMLHTTP");
    }

    xhReq.onreadystatechange = function() {
        if (xhReq.readyState == 4 && xhReq.status == 200) {
            callback(xhReq.responseText);
        }
    }


    if (method == 'POST')
    {
        xhReq.open(method, url, async);
        // if you put the header, you crashes. ------WebKitFormBoundary
        // see https://www.olioapps.com/blog/formdata-fetch-gotchas/
        //xhReq.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xhReq.setRequestHeader("X-Requested-With", "XMLHttpRequest");        
        xhReq.send(data);
    }
    else
    {
        if(typeof data !== 'undefined' && data !== null)
        {
            url = url+'?'+data;
        }
        xhReq.open(method, url, async);
        xhReq.setRequestHeader("X-Requested-With", "XMLHttpRequest");
        xhReq.send(null);
    }
    //var serverResponse = xhReq.responseText;
    //alert(serverResponse);
  
    //ajax('http://www.google.com');
    //ajax('http://www.google.com', 'POST', 'q=test');

}

function setValues(url) {
        ajax(url, 'GET', null, true, function (res) {
            res.split(String.fromCharCode(10)).forEach(
                function (entry) {
                    fields = entry.split("|");
                    if(fields[2] == "input") {
                        var d = document.getElementById(fields[0]);
                        if (d) {
                            d.value = fields[1];
                        }
                    }
                    else if(fields[2] == "div") {
                        var d = document.getElementById(fields[0]);
                        if (d) {
                            d.innerHTML  = fields[1];
                        }
                    } else if(fields[2] == "chk") {
                        var d = document.getElementById(fields[0]);
                        if (d) {
                            d.checked  = fields[1];
                        }
                        
                    }
                }
            );
        });

}

function sprintf() {
    var args = arguments,
    string = args[0],
    i = 1;
    return string.replace(/%((%)|s|d)/g, function (m) {
        // m is the matched format, e.g. %s, %d
        var val = null;
        if (m[2]) {
            val = m[2];
        } else {
            val = args[i];
            // A switch statement so that the formatter can be extended. Default is %s
            switch (m) {
                case '%d':
                    val = parseFloat(val);
                    if (isNaN(val)) {
                        val = 0;
                    }
                    break;
            }
            i++;
        }
        return val;
    });
}