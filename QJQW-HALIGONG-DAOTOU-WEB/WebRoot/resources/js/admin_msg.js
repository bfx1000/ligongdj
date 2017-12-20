$(function(){
	$("#page-content a").click(function(){
		$(this).addClass('rz_active').siblings('a').removeClass('rz_active');
	});
});