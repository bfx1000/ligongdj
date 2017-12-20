$(function(){
    scroWidth=window.innerWidth;
	scroHeight=window.innerHeight;


    //һ���˵����
    $(".box_category_jisi").css({width:scroWidth,height:"auto"});
    $(".box_category_bz").css({width:scroWidth,height:"auto"});


    //�����˵����
    $(".second_menu").css({width:scroWidth,height:scroHeight});
    $(".second_menu2").css({width:scroWidth,height:scroHeight});

    //�����˵��µĲ˵���
    $(".nav li a").click(function(){
        $(".nav li a").removeClass();
        $(this).addClass("show");
    });

    //������룬����һ���˵�
    $("#foot_jisi").click(function(){
        $(".box_category_jisi").css({display:"block"});
    });



   

    //������ϵ�  ��X��
    $(".end").click(function(){
        $(".bg_content,.box_content").css({display:"none"});
    });


    //������ϵ�  ��ȡ��
    $(".quxiao").click(function(){
        $(".bg_content,.box_content").css({display:"none"});
    });


    //总结算页
    $(".sum_accounts").css({width:scroWidth+"px",height:scroHeight+"px"});
    $(".sum_bg,.sum_content").css({width:scroWidth});

   

    //底部圆圈
    $(".all_check img").toggle(function(){
        var src_img=$(this).attr("src");
        var src_img_before=src_img.substring(0,src_img.lastIndexOf("_")+1);
        $(this).attr("src",src_img_before+"pre.png");

        var foot_img=$(".check_btn img").attr("src");
        var foot_img_before=foot_img.substring(0,foot_img.lastIndexOf("_")+1);
        $(".check_btn img").attr("src",foot_img_before+"pre.png");


    },function(){
        var src_img=$(this).attr("src");
        var src_img_before=src_img.substring(0,src_img.lastIndexOf("_")+1);
        $(this).attr("src",src_img_before+"n.png");


        var foot_img=$(".check_btn img").attr("src");
        var foot_img_before=foot_img.substring(0,foot_img.lastIndexOf("_")+1);
        $(".check_btn img").attr("src",foot_img_before+"n.png");
    });


    $('ul.promptu-menu2').promptumenu({width:scroWidth, height:scroWidth/720*70, rows: 1, direction: 'horizontal', pages: false});


});

var c_p = 1,footflag = 1,uid = 0,mmsg = 0,action_flag = false,
//			keyevt=getKeyevt(),
    imei =0,platform = -1,version = 0,os_version = 0,productor=0,device_width=0,device_height=0,t_added = 0,i_page=2;
var uid = 0;
var opId =180;
//    zy_init();


window.uexOnload = function(type){
    if (!type) {
        setfootstyle(footflag,0,'footer');
//            alert(k+'*'+g);
        zy_con("content","index_content.html",0,$$("header").offsetHeight,$$("footer").offsetHeight,window.screen.height);
        indexFunc();
        if(!getstorage('def_fontsize')) {
            setstorage('def_fontsize',window.getComputedStyle(document.body,null).fontSize);
        }
    }
};


