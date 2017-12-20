package com.qf.util.interceptor;

import java.io.BufferedInputStream;
import java.io.InputStream;
import java.util.Enumeration;
import java.util.List;
import java.util.Properties;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;

import com.mysql.fabric.xmlrpc.base.Params;
import com.qf.util.PropertyReader;
import com.qf.util.common.Const;



/**
*
* 项目名称：qf
* 类名称：InstantiationTracingBeanPostProcessor
* 类描述：
* 创建人：周广文
* 创建时间：2015年6月4日 上午11:08:31
* 修改人：周广文
* 修改时间：2015年6月4日 上午11:08:31
* 修改备注：
* @version
*
*/
public class InstantiationTracingBeanPostProcessor implements ServletContextListener  {
	  
	

	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void contextInitialized(ServletContextEvent servletContextEvent) {
		// TODO Auto-generated method stub
		  ServletContext servletContext = servletContextEvent.getServletContext();  
//	       public static void readProperties(String filePath) {
		     Properties props = new Properties();
		        try {
		         InputStream in = new BufferedInputStream (PropertyReader.class.getClassLoader().getResourceAsStream(Const.CONF));
		         props.load(in);
		            Enumeration en = props.propertyNames();
		             while (en.hasMoreElements()) {
		              String key = (String) en.nextElement();
		                    String Property = props.getProperty (key);
		                   servletContext.setAttribute(key, Property);
		                }
		        } catch (Exception e) {
		         e.printStackTrace();
		        }
	}

}