//过滤非法字符  
function stripscript(s){   
    var pattern = new RegExp("[`~!@#$^&*()=|{}':;',\\[\\].<>/?~！@#￥……&*（）——|{}【】‘；：”“'。，、？]");   
    var rs = "";   
    for (var i = 0; i < s.length; i++) {   
	    rs = rs+s.substr(i, 1).replace(pattern, '');   
    }   
    return rs;   
}   