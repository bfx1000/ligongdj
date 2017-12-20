$(function(){
    //Í·²¿
    $(".menu>ul>li").click(function(){
        $(this).css({borderBottom:" 2px solid #6fb5de"})
            .siblings().css({border:"none"});
    });

    $(".navbar .collapse ul li.btn").click(function(){
        $(this).css({borderBottom:"none"});
    });

   var pageImg=1;
    var imgNum=$(".srmy_container>div").length;
    var pageCount=Math.ceil(imgNum/4);
    $(".pre").click(function(){
        if(pageImg==imgNum){
            $(".srmy_container").animate({left:"+="-500});
            pageImg--;
        }else{
            pageImg=imgNum;
        }
    });

    $(".next").click(function(){
        if(pageImg==1){
            $(".srmy_container").animate({left:"+="+500});
            pageImg++;
        }else{
            pageImg=1;
        }
    });


});