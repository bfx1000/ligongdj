package com.qf.app.approute.controller;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.qf.app.approute.service.AppRouteService;
import com.qf.util.aes.AES;
import com.qf.util.common.JackJson;
import com.qiniu.util.Auth;




/**
*
* 项目名称：qf
* 类名称：AppRouteController
* 类描述：路由表
* 创建人：郭桦
* 创建时间：2015年5月20日  
* @version
*
*/
@SuppressWarnings("all")
@Controller
@RequestMapping("/appRoute")
public class AppRouteController {

	private AppRouteService appuserService;

	public AppRouteService getAppuserService() {
		return appuserService;
	}
	@Autowired
	public void setAppuserService(AppRouteService appuserService) {
		this.appuserService = appuserService;
	}
	
	private static final String[] controllerArr = { "settlement/queryAgreementById","apptianqi/queryTvList"};

	
	//判断路径是否有效
	public static boolean useLoop( String targetValue) {
	    for (String s : controllerArr) {
	        if (s.equals(targetValue)) {
	            return true;
	        }
	    }
	    return false;
	}
	
	/**
	 * 处理所有请求
	 * @param para
	 * @param request
	 * @param response
	 * @param file
	 * @return
	 */
	@RequestMapping("route")
	public String toRoute(String para,HttpServletRequest request, HttpServletResponse response,@RequestParam(value="file",required=false)CommonsMultipartFile file){
		Map<String,Object> rm = new HashMap<String,Object>();  //返回信息map
		String returnString = "forward:/appRoute/sendError";
		try{
			if(para!=null && !"".equals(para)){
				para = AES.decrypt(para);
				Map<String,Object> valueMap = JackJson.fromJsonToObject(para,Map.class);  //传值map
				System.out.println("============1=============="+valueMap);
				//判断valueMap是否为空   空返回错误信息
				if(valueMap==null){
					rm.put("result","0");
					rm.put("msg", "para解析成map失败"); 
				}else{
					String action  = (String)valueMap.get("action");
					 
					//分割action
					if(action==null || "".equals(action)){
						rm.put("result","0");
						rm.put("msg", "访问action为空，请填写action信息"); //para为空  信息传递失败
					}else{
						if(useLoop(action)){
							request.setAttribute("valueMap", valueMap);//把解析好的map传递给下一个方法
							request.setAttribute("para", para);
							request.setAttribute("file", file);
							returnString = "forward:/" + action;
						}else{
							rm.put("result","0");
							rm.put("msg", "访问action无效，请检查action"); 
						}
					}
				}
			}
			request.setAttribute("rm", rm);
		}catch(Exception e){
			e.printStackTrace();
		}
		return returnString;
		
	}
	
	
	private static String ACCESS_KEY = "Ah4z9AJkH2t7AmikErx7vxi2wwIm053XAO_O_wbl";
	private static String SECRET_KEY = "stWRYKZbaLokjAubK5LRQycdoElKnMth0I2D7GvC";
	
	@RequestMapping("getToken")
	public void getToken(String para,HttpServletRequest request, HttpServletResponse responsee){
		Map<String,Object> rm = new HashMap<String,Object>();  //返回信息map
		try{
			if(para!=null && !"".equals(para)){
				para = AES.decrypt(para);
				 
				Map<String,Object> valueMap = JackJson.fromJsonToObject(para,Map.class);  //传值map
				//判断valueMap是否为空   空返回错误信息
				if(valueMap==null){
					rm.put("result","0");
					rm.put("msg", "para解析成map失败"); 
				}else{
					String bucket  = (String)valueMap.get("bucket");
					 
					if(bucket==null || "".equals(bucket)){
						rm.put("result","0");
						rm.put("msg", "bucket不能为空"); 
					}else{
						Auth auth = Auth.create(ACCESS_KEY, SECRET_KEY);
						rm.put("result","1");
						rm.put("token", auth.uploadToken(bucket)); 
					}
				}
			}
			request.setAttribute("rm", rm);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	
	
	/**
	 * 返回错误信息
	 * @param para
	 * @param request
	 * @param response
	 */
	@RequestMapping("sendError")
	public void sendError(String para,HttpServletRequest request, HttpServletResponse response){
		Map<String,Object> rm = (Map<String,Object>)request.getAttribute("rm");  //返回信息map
		String json  = "";
		try{
			json = JackJson.fromObjectToJson(rm);
			 //System.out.println("json==="+json);
			String resultjson = AES.encrypt(json);
			response.setContentType("text/html;charset=utf-8");  
            response.getWriter().write(resultjson);  
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	
}
