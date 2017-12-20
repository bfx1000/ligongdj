$(function(){
    $(".set_menu>div").click(function(){
        $(this).css({backgroundColor:"#5abbf4",color:"#fff"}).siblings().css({backgroundColor:"#fff",color:"#5abbf4"});
        var menu_index=$(this).index();
        $(".menu_content>div").eq(menu_index).removeClass('menu_cont_hidden').siblings().addClass('menu_cont_hidden');
    });
});