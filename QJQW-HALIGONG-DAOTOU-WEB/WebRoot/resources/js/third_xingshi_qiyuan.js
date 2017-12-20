$(function(){
    $(".corpus_second_menu li").click(function(){
        $(this).addClass('active').siblings().removeClass('active');
    });

    $(".xsqy_title li").click(function(){
        $(this).addClass('li_active').siblings('li').removeClass('li_active');
        var li_num=$(this).index();
        $(".xsqy_content>div").eq(li_num).removeClass('content_hidden').siblings().addClass('content_hidden');
    });
});