package com.qf.util;


import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URISyntaxException;
import java.util.Enumeration;
import java.util.Hashtable;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

import org.apache.log4j.Logger;


/**
*
* 项目名称：qf
* 类名称：PropertyReader
* 类描述：
* 创建人：周广文
* 创建时间：2015年6月4日 下午2:14:15
* 修改人：周广文
* 修改时间：2015年6月4日 下午2:14:15
* 修改备注：
* @version
*
*/
public class PropertyReader extends
HttpServletRequestWrapper{
	
	 public PropertyReader(HttpServletRequest request) {
		super(request);
		// TODO Auto-generated constructor stub
	}

	//根据key读取value
	 public static String readValue(String filePath,String key) {
	  Properties props = new Properties();
	        try {
	         InputStream in = new BufferedInputStream (PropertyReader.class.getClassLoader().getResourceAsStream(filePath));
	         props.load(in);
	         String value = props.getProperty (key);
	             
	            return value;
	        } catch (Exception e) {
	         e.printStackTrace();
	         return null;
	        }
	 }
	 
	 //读取properties的全部信息
	    public static void readProperties(String filePath) {
	     Properties props = new Properties();
	        try {
	         InputStream in = new BufferedInputStream (PropertyReader.class.getClassLoader().getResourceAsStream(filePath));
	         props.load(in);
	            Enumeration en = props.propertyNames();
	             while (en.hasMoreElements()) {
	              String key = (String) en.nextElement();
	                    String Property = props.getProperty (key);
	                     
	                }
	        } catch (Exception e) {
	         e.printStackTrace();
	        }
	    }

	    //写入properties信息
	    public static void writeProperties(String filePath,String parameterName,String parameterValue) {
	     Properties prop = new Properties();
	     try {
	      InputStream fis = PropertyReader.class.getClassLoader().getResourceAsStream(filePath);
	            //从输入流中读取属性列表（键和元素对）
	            prop.load(fis);
	            fis.close();
	            //调用 Hashtable 的方法 put。使用 getProperty 方法提供并行性。
	            //强制要求为属性的键和值使用字符串。返回值是 Hashtable 调用 put 的结果。
	            OutputStream fos = new FileOutputStream(filePath);
	            prop.setProperty(parameterName, parameterValue);
	            //以适合使用 load 方法加载到 Properties 表中的格式，
	            //将此 Properties 表中的属性列表（键和元素对）写入输出流
	            prop.store(fos, "Update '" + parameterName + "' value");
	            fos.close();
	        } catch (IOException e) {
	         System.err.println("Visit "+filePath+" for updating "+parameterName+" value error");
	        }
	    }
	    public static void writeData(String key, String value,String fileURL) {  
	        Properties prop = new Properties();  
	        InputStream fis = null;  
	        OutputStream fos = null;  
	        try {  
	              java.net.URL  url = PropertyReader.class.getClassLoader().getResource(fileURL);  
	            File file = new File(url.toURI());  
	            if (!file.exists())  
	                file.createNewFile();  
	            fis = new FileInputStream(file);  
	            prop.load(fis);  
	            fis.close();//一定要在修改值之前关闭fis  
	            fos = new FileOutputStream(file);  
	            prop.setProperty(key, value);  
	            prop.store(fos, "Update '" + key + "'+ '"+value+"'");  
	            fos.close();  
	              
	        } catch (IOException e) {  
	            System.err.println("Visit " + fileURL + " for updating "  
	            + value + " value error");  
	        } catch (URISyntaxException e) {  
	            // TODO Auto-generated catch block  
	            e.printStackTrace();  
	        }  
	        finally{  
	            try {  
	                fos.close();  
	                fis.close();  
	            } catch (IOException e) {  
	                // TODO Auto-generated catch block  
	                e.printStackTrace();  
	            }  
	        }  
	    }  
	
	 

}
