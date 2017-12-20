package com.qf.util.filter;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.regex.PatternSyntaxException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;


/**
*
* 项目名称：qf
* 类名称：XSSRequestWrapper
* 类描述： 敏感字符过滤器,直接干掉所有敏感字符,宁杀错不放过
* 创建人：周广文
* 创建时间：2015年5月16日 上午11:09:33
* 修改人：周广文
* 修改时间：2015年5月16日 上午11:09:33
* 修改备注：
* @version
*
*/
public class XSSRequestWrapper extends HttpServletRequestWrapper {
	public XSSRequestWrapper(HttpServletRequest servletRequest) {
		super(servletRequest);
	}
	
	/** 从写getParameterMap 方法. 拦截所有内容
	* (non-Javadoc)
	* @see javax.servlet.ServletRequestWrapper#getParameterMap()
	*/
	@Override
	public Map<String, String[]> getParameterMap() {
		// TODO Auto-generated method stub
		Map properties = super.getParameterMap();
		Map returnMap = new HashMap(); 
		Iterator entries = properties.entrySet().iterator(); 
		Map.Entry entry; 
		String name = "";  
		String value = "";  
		while (entries.hasNext()) {
			entry = (Map.Entry) entries.next(); 
			name = (String) entry.getKey(); 
			Object valueObj = entry.getValue(); 
			if(null == valueObj){ 
				value = ""; 
			}else if(valueObj instanceof String[]){ 
				String[] values = (String[])valueObj;
				for(int i=0;i<values.length;i++){ 
					 value = values[i] + ",";
				}
				value = value.substring(0, value.length()-1); 
			}else{
				value = valueObj.toString(); 
			}
			returnMap.put(stripXSS(name),stripXSS(value)); 
		}
		
		
		return returnMap;
	}

	
	/**重写getParameterValues 方法
	* (non-Javadoc)
	* @see javax.servlet.ServletRequestWrapper#getParameterValues(java.lang.String)
	*/
	@Override
	public String[] getParameterValues(String parameter) {
		String[] values = super.getParameterValues(parameter);
		if (values == null) {
			return null;
		}

		int count = values.length;
		String[] encodedValues = new String[count];
		for (int i = 0; i < count; i++) {
			encodedValues[i] = stripXSS(values[i]);
		}
		return encodedValues;
	}

	
	/**重写getParameter 方法
	* (non-Javadoc)
	* @see javax.servlet.ServletRequestWrapper#getParameter(java.lang.String)
	*/
	@Override
	public String getParameter(String parameter) {
		String value = super.getParameter(parameter);
		return stripXSS(value);
	}

	
	/**重写getHeader 方法
	* (non-Javadoc)
	* @see javax.servlet.http.HttpServletRequestWrapper#getHeader(java.lang.String)
	*/
	@Override
	public String getHeader(String name) {
		String value = super.getHeader(name);
		return stripXSS(value);
	}
//	@Override
//	public Object getAttribute(String name) {
//		// TODO Auto-generated method stub
//		String value =(String) super.getAttribute(name);
//		return stripXSS(value);
//	}
	
	private String stripXSS(String value) {
		if (value != null) {
			// NOTE: It's highly recommended to use the ESAPI library and
			// uncomment the following line to
			// avoid encoded attacks.
			// value = ESAPI.encoder().canonicalize(value);
			// Avoid null characters
			value = value.replaceAll("", "");
			// Avoid anything between script tags
			Pattern scriptPattern = Pattern.compile("<script>(.*?)</script>",
					Pattern.CASE_INSENSITIVE);
			value = scriptPattern.matcher(value).replaceAll("");
			// Avoid anything in a src="..." type of e­xpression
//			scriptPattern = Pattern.compile("src[\r\n]*=[\r\n]*\\\'(.*?)\\\'",
//					Pattern.CASE_INSENSITIVE | Pattern.MULTILINE
//							| Pattern.DOTALL);
//			value = scriptPattern.matcher(value).replaceAll("");
//			scriptPattern = Pattern.compile("src[\r\n]*=[\r\n]*\\\"(.*?)\\\"",
//					Pattern.CASE_INSENSITIVE | Pattern.MULTILINE
//							| Pattern.DOTALL);
			value = scriptPattern.matcher(value).replaceAll("");
			// Remove any lonesome </script> tag
			scriptPattern = Pattern.compile("</script>",
					Pattern.CASE_INSENSITIVE);
			value = scriptPattern.matcher(value).replaceAll("");
			// Remove any lonesome <script ...> tag
			scriptPattern = Pattern.compile("<script(.*?)>",
					Pattern.CASE_INSENSITIVE | Pattern.MULTILINE
							| Pattern.DOTALL);
			value = scriptPattern.matcher(value).replaceAll("");
			// Avoid eval(...) e­xpressions
			scriptPattern = Pattern.compile("eval\\((.*?)\\)",
					Pattern.CASE_INSENSITIVE | Pattern.MULTILINE
							| Pattern.DOTALL);
			value = scriptPattern.matcher(value).replaceAll("");
			// Avoid e­xpression(...) e­xpressions
			scriptPattern = Pattern.compile("e­xpression\\((.*?)\\)",
					Pattern.CASE_INSENSITIVE | Pattern.MULTILINE
							| Pattern.DOTALL);
			value = scriptPattern.matcher(value).replaceAll("");
			// Avoid javascript:... e­xpressions
			scriptPattern = Pattern.compile("javascript:",
					Pattern.CASE_INSENSITIVE);
			value = scriptPattern.matcher(value).replaceAll("");
			// Avoid vbscript:... e­xpressions
			scriptPattern = Pattern.compile("vbscript:",
					Pattern.CASE_INSENSITIVE);
			value = scriptPattern.matcher(value).replaceAll("");
			// Avoid onload= e­xpressions
			scriptPattern = Pattern.compile("onload(.*?)=",
					Pattern.CASE_INSENSITIVE | Pattern.MULTILINE
							| Pattern.DOTALL);
			value = scriptPattern.matcher(value).replaceAll("");
			scriptPattern = Pattern.compile("href=(.*?)",
					Pattern.CASE_INSENSITIVE | Pattern.MULTILINE
							| Pattern.DOTALL);
			value = scriptPattern.matcher(value).replaceAll("href='http://www.qjqw.com'");
		//	value = StringFilter(value);

		}
		return value;
	}

	
	/**
	* StringFilter(直接干掉所有敏感字符)
	* TODO(任何场景,任何字段,任何类型)
	* @param name
	* @param @return 所有对象
	* @return String DOM对象
	* @Exception 异常对象
	* @since  CodingExample　Ver(编码范例查看) 1.1
	*/
	public static String StringFilter(String str) throws PatternSyntaxException {
		// 只允许字母和数字
		// String regEx = "[^a-zA-Z0-9]";
		// 清除掉所有特殊字符
		String regEx = "[`~!@#$%^&*()|{}':;'\\[\\]<>?~！@#￥%……&*（）|{}【】‘；：”“’。，、？]";
		Pattern p = Pattern.compile(regEx);
		Matcher m = p.matcher(str);
		return m.replaceAll("").trim();
	}
}