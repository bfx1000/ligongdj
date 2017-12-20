$(function(){

    //�б�����
//    $(".mess_list_2").click(function(){
//        $(this).css({backgroundColor:"#f1f8fe"}).siblings('ul').css({backgroundColor:"#fff"});
//        var src = $(this).find("img").attr("src") ;
//        $("#kind_img_iframe").attr("src",src)
//        $(".message_bg,.message_content").css({display:"block"});
//    });

    //������Ϣ�ϵ�  �رհ�ť
    $(".message_window_close").click(function(){
        $(".message_bg,.message_content").css({display:"none"});
    });
    $(".message_content ul.mess_list_title").click(function(){
        $(this).css({backgroundColor:"#fff"});
    });

});