package com.qf.util;


import javax.servlet.http.HttpServletRequest;


public class ChangeUrl {
//	public static String flag = "linux";
//	public static String flag = "windows";
	
	 
	 
	public static String getXiTong(){
		 if (System.getProperties().getProperty("os.name").toUpperCase().indexOf("WINDOWS") != -1) {
			 return "windows";
		}else{
			return "linux";
		}
	}
	
	public static String getExepath(HttpServletRequest request){
		String flag = getXiTong();
		String exepath = "";
		if(flag!=null && "linux".equals(flag)){
			exepath = "phantomjs ";
		}else if(flag!=null && "windows".equals(flag)){
			exepath = request.getSession().getServletContext().getRealPath("/phantomjs-2.0.0/windows/bin/phantomjs.exe");
		}
		return exepath;
	}
	
	//墓园
	public static String getUrl(String cemetery_id, HttpServletRequest request){
//		String flag = getXiTong();
		String path = request.getContextPath();
		String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()	+ path + "/";
		
		String url = "";
//		if(flag!=null && "linux".equals(flag)){
//			url = "http://www.qjqw.com.cn/webCemetery/querytoIframe?cemetery_id=" + cemetery_id;
//		}else if(flag!=null && "windows".equals(flag)){
			url = basePath + "webCemetery/querytoIframe?cemetery_id=" + cemetery_id;
//		}
		return url;
	}
	
	//许愿树
	public static String getTreeUrl(int worship_id, String img_flag, HttpServletRequest request){
		String path = request.getContextPath();
		String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()	+ path + "/";
		
//		String flag = getXiTong();
		//img_flag 1公共  2私人
		String url = "";
//		if(flag!=null && "linux".equals(flag)){
//			if("1".equals(img_flag)){//1私人
//				url = "http://www.qjqw.com.cn/webWishingTree/queryprivateWishTreeForBzImg?private_wish_tree_id=" + worship_id + "&chooseflag=1&flag=1";
//			}else{//2公共
//				url = "http://www.qjqw.com.cn/webWishingTree/querypublicWishTreeForBz?public_wish_tree_id=" + worship_id + "&chooseflag=1&flag=1";
//			}
//		}else if(flag!=null && "windows".equals(flag)){
			if("1".equals(img_flag)){//1私人
				url = basePath + "webWishingTree/queryprivateWishTreeForBzImg?private_wish_tree_id=" + worship_id + "&chooseflag=1&flag=1";
			}else{//2公共
				url = basePath + "webWishingTree/querypublicWishTreeForBz?public_wish_tree_id=" + worship_id + "&chooseflag=1&flag=1";
			}
//		}
		return url;
	}
	
	//礼佛
	public static String getLifoUrl(int worship_id, String img_flag, HttpServletRequest request){
//		String flag = getXiTong();
		//img_flag 1公共  2私人
		String path = request.getContextPath();
		String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()	+ path + "/";
		
		String url = "";
//		if(flag!=null && "linux".equals(flag)){
//			if("1".equals(img_flag)){//1公共
//				url = "http://www.qjqw.com.cn/webLifo/queryFoPubWorshipForImg?fo_id=" + worship_id + "&chooseflag=1&flag=1";
//			}else{//2私人
//				url = "http://www.qjqw.com.cn/webLifo/queryFoPersonalWorshipForImg?personal_worship_id=" + worship_id + "&chooseflag=1&flag=1";
//			}
//		}else if(flag!=null && "windows".equals(flag)){
			if("1".equals(img_flag)){//1公共
				url = basePath + "webLifo/queryFoPubWorshipForImg?fo_id=" + worship_id + "&chooseflag=1&flag=1";
			}else{//2私人
				url = basePath + "webLifo/queryFoPersonalWorshipForImg?personal_worship_id=" + worship_id + "&chooseflag=1&flag=1";
			}
//		}
		return url;
	}
	
	//宗祠（外部）
	public static String getAncestralExternalUrl(String ancestral_hall_id, HttpServletRequest request){
		
		String path = request.getContextPath();
		String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()	+ path + "/";
		
//		String flag = getXiTong();
		//img_flag 1公共  2私人
		String url = "";
//		if(flag!=null && "linux".equals(flag)){
//			url = "http://www.qjqw.com.cn/webAncestralBz/queryAncestralBzOutsideForImg?ancestral_hall_id=" + ancestral_hall_id;
//		}else if(flag!=null && "windows".equals(flag)){
			url = basePath + "webAncestralBz/queryAncestralBzOutsideForImg?ancestral_hall_id=" + ancestral_hall_id;
//		}
		return url;
	}
	
	
	//宗祠（内部）
	public static String getAncestralInternalUrl(String ancestral_hall_id, HttpServletRequest request){
		String path = request.getContextPath();
		String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()	+ path + "/";
		
//		String flag = getXiTong();
		//img_flag 1公共  2私人
		String url = "";
//		if(flag!=null && "linux".equals(flag)){
//			url = "http://www.qjqw.com.cn/Ancestral/queryAncestralBzInsideForImg?ancestral_hall_id=" + ancestral_hall_id;
//		}else if(flag!=null && "windows".equals(flag)){
			url = basePath + "Ancestral/queryAncestralBzInsideForImg?ancestral_hall_id=" + ancestral_hall_id;
//		}
		return url;
	}
	
	public static String getTemplateUrl(String cemetery_template_id, HttpServletRequest request){
		String path = request.getContextPath();
		String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()	+ path + "/";
		
//		String flag = getXiTong();
		String templateurl = "";
//		if(flag!=null && "linux".equals(flag)){
//			templateurl = "http://www.qjqw.com.cn/webCemeteryTemplate/queryCemeteryTemplateById?cemetery_template_id=" + cemetery_template_id;
//		}else if(flag!=null && "windows".equals(flag)){
			templateurl = basePath + "webCemeteryTemplate/queryCemeteryTemplateById?cemetery_template_id=" + cemetery_template_id;
//		}
		return templateurl;
	}
	

	
}
