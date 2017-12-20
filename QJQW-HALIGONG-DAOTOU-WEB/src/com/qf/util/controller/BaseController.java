package com.qf.util.controller;



import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.qf.util.PageData;
import com.qf.util.UuidUtil;
import com.qf.util.aes.AES;
import com.qf.util.common.JackJson;
import com.qf.util.entity.Page;



/**
*
* 项目名称：qf
* 类名称：BaseController
* 类描述：
* 创建人：周广文
* 创建时间：2015年5月22日 下午5:13:53
* 修改人：周广文
* 修改时间：2015年5月22日 下午5:13:53
* 修改备注：
* @version
*
*/
public class BaseController {
	
	protected Logger logger = LoggerFactory.getLogger(this.getClass());

	/**
	 * 得到PageData
	 */
	public PageData getPageData(){
		return new PageData(this.getRequest());
	}
	
	/**
	 * 得到ModelAndView
	 */
	public ModelAndView getModelAndView(){
		return new ModelAndView();
	}
	
	/**
	 * 得到request对象
	 */
	public HttpServletRequest getRequest() {
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		
		return request;
	}

	/**
	 * 得到32位的uuid
	 * @return
	 */
	public String get32UUID(){
		
		return UuidUtil.get32UUID();
	}
	
	/**
	 * 得到分页列表的信息 
	 */
	public Page getPage(){
		
		return new Page();
	}

//    @ExceptionHandler
//    public String exception(HttpServletRequest request, Exception e) {  
//        request.setAttribute("exceptionMessage", e.getMessage());  
//          
//        // 根据不同的异常类型进行不同处理
//        if(e instanceof SQLException) 
//            return "testerror";   
//        else
//            return "error";  
//    }

	/**   
	 * 返回信息
	 * @param request
	 * @param response
	 * @param rm
	 * @throws Exception
	 */
	protected void returnMsg(HttpServletResponse response,Map<String,Object> rm) throws Exception {  
        String json  = "";  
        try {  
			json = JackJson.fromObjectToJson(rm);
			System.out.println("json===="+json);
//			String resultjson = AES.encrypt(json);
            response.setContentType("text/html;charset=utf-8");  
            response.getWriter().write(json);  
        } catch (IOException e) {  
        	 e.printStackTrace();
        }  
    }
}
