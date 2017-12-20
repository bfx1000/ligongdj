$(function(){
    $(".corpus_second_menu a").click(function(){
        $(this).css({backgroundColor:"#ffffff",color:"#4097ca"}).siblings().css({backgroundColor:"#4097ca",color:"#ffffff"});
    });

    function addListener(element,e,fn){
        if(element.addEventListener){
            element.addEventListener(e,fn,false);
        } else {
            element.attachEvent("on" + e,fn);
        }
    }
    //用户名
    var myinput = document.getElementById("denglu_user");
    addListener(myinput,"click",function(){
        if (myinput.value=='用户名'){
            myinput.value ="";
        }
    });
    addListener(myinput,"blur",function(){
        if (myinput.value ==""){
            myinput.value='用户名';
        }
    });

    //密码
    var myinput_pwd = document.getElementById("denglu_pwd");
    addListener(myinput_pwd,"click",function(){
        if (myinput_pwd.value=='密码'){
            myinput_pwd.value ="";
        }
    });
    addListener(myinput_pwd,"blur",function(){
        if (myinput_pwd.value ==""){
            myinput_pwd.value='密码';
        }
    });


});