package com.qf.util.filter;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;


/**
*
* 项目名称：qf
* 类名称：ContentReplaceHttpServletRequestWapper
* 类描述：装饰者模式, 屏蔽敏感字符
* 创建人：周广文
* 创建时间：2015年5月16日 下午4:56:14
* 修改人：周广文
* 修改时间：2015年5月16日 下午4:56:14
* 修改备注： 备用. 最后启用
* @version
*
*/
public class ContentReplaceHttpServletRequestWapper extends
HttpServletRequestWrapper {
	 private static Properties keywords;
	 
	    static {
	        keywords = new Properties();
	        try {
	            keywords.load(ContentReplaceHttpServletRequestWapper.class
	                    .getClassLoader().getResourceAsStream("keyword.properties"));
	        } catch (IOException e) {
	            e.printStackTrace();
	        }
	    }
	 
	    public ContentReplaceHttpServletRequestWapper(HttpServletRequest request) {
	        super(request);
	    }
	 
	    @Override
	    public String getParameter(String name) {
	        //content和name是要过滤的请求参数名称
	        if ("content".equals(name) || "title".equals(name)) {
	            String old = super.getParameter(name);
	            old = doFilter(old);
	            return old;
	        }
	        return super.getParameter(name);
	    }
	 
	    private String doFilter(String old) {
	        for (Object temp : keywords.keySet()) {
	            try {
	                String key = new String(((String) temp).getBytes("ISO-8859-1"),"UTF-8");
	                old = old.replaceAll(key, keywords.getProperty((String)temp));
	            } catch (UnsupportedEncodingException e) {
	                e.printStackTrace();
	            }
	        }
	        return old;
	    }
}
