package com.qf.util.common;


import java.beans.PropertyDescriptor;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Random;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import net.sourceforge.pinyin4j.PinyinHelper;
import net.sourceforge.pinyin4j.format.HanyuPinyinCaseType;
import net.sourceforge.pinyin4j.format.HanyuPinyinOutputFormat;
import net.sourceforge.pinyin4j.format.HanyuPinyinToneType;
import net.sourceforge.pinyin4j.format.HanyuPinyinVCharType;
import net.sourceforge.pinyin4j.format.exception.BadHanyuPinyinOutputFormatCombination;

import org.apache.commons.beanutils.PropertyUtilsBean;
import org.apache.commons.lang.StringUtils;
import org.springframework.data.mongodb.core.query.Criteria;


/**
*
* 项目名称：qf
* 类名称：Tools
* 类描述：字符串操作
* 创建人：周广文
* 创建时间：2015年5月13日 上午11:36:05
* 修改人：周广文
* 修改时间：2015年5月13日 上午11:36:05
* 修改备注：
* @version
*
*/
public class Tools {
	 
	
	private Map<String,Object> map=new HashMap<String, Object>();
	/**
	 * 随机生成六位数验证码 
	 * @return
	 */
	public static int getRandomNum(){
		 Random r = new Random();
		 return r.nextInt(900000)+100000;//(Math.random()*(999999-100000)+100000)
	}
	
	/**
	 * 检测字符串是否不为空(null,"","null")
	 * @param s
	 * @return 不为空则返回true，否则返回false
	 */
	public static boolean notEmpty(String s){
		return s!=null && !"".equals(s) && !"null".equals(s);
	}
	
	/**
	 * 检测字符串是否为空(null,"","null")
	 * @param s
	 * @return 为空则返回true，不否则返回false
	 */
	public static boolean isEmpty(String s){
		return s==null || "".equals(s) || "null".equals(s);
	}
	
	/**
	 * 字符串转换为字符串数组
	 * @param str 字符串
	 * @param splitRegex 分隔符
	 * @return
	 */
	public static String[] str2StrArray(String str,String splitRegex){
		if(isEmpty(str)){
			return null;
		}
		return str.split(splitRegex);
	}
	
	/**
	 * 用默认的分隔符(,)将字符串转换为字符串数组
	 * @param str	字符串
	 * @return
	 */
	public static String[] str2StrArray(String str){
		return str2StrArray(str,",\\s*");
	}
	
	/**
	 * 按照yyyy-MM-dd HH:mm:ss的格式，日期转字符串
	 * @param date
	 * @return yyyy-MM-dd HH:mm:ss
	 */
	public static String date2Str(Date date){
		return date2Str(date,"yyyy-MM-dd HH:mm:ss");
	}
	
	/**
	 * 按照yyyy-MM-dd HH:mm:ss的格式，字符串转日期
	 * @param date
	 * @return
	 */
	public static Date str2Date(String date){
		if(notEmpty(date)){
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			try {
				return sdf.parse(date);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			return new Date();
		}else{
			return null;
		}
	}
	
	/**
	 * 按照参数format的格式，日期转字符串
	 * @param date
	 * @param format
	 * @return
	 */
	public static String date2Str(Date date,String format){
		if(date!=null){
			SimpleDateFormat sdf = new SimpleDateFormat(format);
			return sdf.format(date);
		}else{
			return "";
		}
	}
	
	/**
	 * 把时间根据时、分、秒转换为时间段
	 * @param StrDate
	 */
	public static String getTimes(String StrDate){
		String resultTimes = "";
		
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	    java.util.Date now;
	    
	    try {
	    	now = new Date();
	    	java.util.Date date=df.parse(StrDate);
	    	long times = now.getTime()-date.getTime();
	    	long day  =  times/(24*60*60*1000);
	    	long hour = (times/(60*60*1000)-day*24);
	    	long min  = ((times/(60*1000))-day*24*60-hour*60);
	    	long sec  = (times/1000-day*24*60*60-hour*60*60-min*60);
	        
	    	StringBuffer sb = new StringBuffer();
	    	//sb.append("发表于：");
	    	if(hour>0 ){
	    		sb.append(hour+"小时前");
	    	} else if(min>0){
	    		sb.append(min+"分钟前");
	    	} else{
	    		sb.append(sec+"秒前");
	    	}
	    		
	    	resultTimes = sb.toString();
	    } catch (ParseException e) {
	    	e.printStackTrace();
	    }
	    
	    return resultTimes;
	}
	
	/**
	 * 写txt里的单行内容
	 * @param filePath  文件路径
	 * @param content  写入的内容
	 */
	public static void writeFile(String fileP,String content){
		String filePath = String.valueOf(Thread.currentThread().getContextClassLoader().getResource(""))+"../../";	//项目路径
		filePath = (filePath.trim() + fileP.trim()).substring(6).trim();
		PrintWriter pw;
		try {
			pw = new PrintWriter( new FileWriter(filePath));
			pw.print(content);
	        pw.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	  * 验证邮箱
	  * @param email
	  * @return
	  */
	 public static boolean checkEmail(String email){
	  boolean flag = false;
	  try{
	    String check = "^([a-z0-9A-Z]+[-|_|\\.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-zA-Z]{2,}$";
	    Pattern regex = Pattern.compile(check);
	    Matcher matcher = regex.matcher(email);
	    flag = matcher.matches();
	   }catch(Exception e){
	    flag = false;
	   }
	  return flag;
	 }
	
	 /**
	  * 验证手机号码
	  * @param mobiles
	  * @return
	  */
	 public static boolean checkMobileNumber(String mobileNumber){
	  boolean flag = false;
	  try{
	    Pattern regex = Pattern.compile("^(((13[0-9])|(15([0-3]|[5-9]))|(18[0,5-9]))\\d{8})|(0\\d{2}-\\d{8})|(0\\d{3}-\\d{7})$");
	    Matcher matcher = regex.matcher(mobileNumber);
	    flag = matcher.matches();
	   }catch(Exception e){
	    flag = false;
	   }
	  return flag;
	 }

	 
	/**
	 * 读取txt里的单行内容
	 * @param filePath  文件路径
	 */
	public static String readTxtFile(String fileP) {
		try {
			
			String filePath = String.valueOf(Thread.currentThread().getContextClassLoader().getResource(""))+"../../";	//项目路径
			filePath = filePath.replaceAll("file:/", "");
			filePath = filePath.replaceAll("%20", " ");
			filePath = filePath.trim() + fileP.trim();
			
			String encoding = "utf-8";
			File file = new File(filePath);
			if (file.isFile() && file.exists()) { 		// 判断文件是否存在
				InputStreamReader read = new InputStreamReader(
				new FileInputStream(file), encoding);	// 考虑到编码格式
				BufferedReader bufferedReader = new BufferedReader(read);
				String lineTxt = null;
				while ((lineTxt = bufferedReader.readLine()) != null) {
					return lineTxt;
				}
				read.close();
			}else{
				 
			}
		} catch (Exception e) {
			 
		}
		return "";
	}

	//将javabean转为map类型，然后返回一个map类型的值
	public static Map<String, Object> beanToMap(Object obj) { 
	    Map<String, Object> params = new HashMap<String, Object>(0); 
	    try { 
	      PropertyUtilsBean propertyUtilsBean = new PropertyUtilsBean(); 
	      PropertyDescriptor[] descriptors = propertyUtilsBean.getPropertyDescriptors(obj); 
	      for (int i = 0; i < descriptors.length; i++) { 
	        String name = descriptors[i].getName(); 
	        if (!StringUtils.equals(name, "class")) { 
	          params.put(name, propertyUtilsBean.getNestedProperty(obj, name)); 
	        } 
	      } 
	    } catch (Exception e) { 
	      e.printStackTrace(); 
	    } 
	    return params; 
	}
	public static String getType(Object o){
		 
		return o.getClass().toString();
		}
	
	public static Criteria[] Operator(Map<String, Object> maps){
		if(maps!=null){
		Set<Entry<String, Object>> entries = maps.entrySet();
		   Criteria[]   cc = new Criteria[maps.size()];
		   int i=0;
		for (Entry<String, Object> entry : entries) {  
				
				if(getType(entry.getValue()).indexOf("Long")!=-1 ){
					Criteria ca=Criteria.where(entry.getKey()).gt(entry.getValue()).lt(((Long)entry.getValue()+24*60*60));
					cc[i]=ca;
					i++;
				}else if(getType(entry.getValue()).indexOf("Integer")!=-1 ){
					Criteria ca=Criteria.where(entry.getKey()).is( entry.getValue());
					cc[i]=ca;
					i++;
				}
				else{
					Criteria ca=Criteria.where(entry.getKey()).is(entry.getValue());
					cc[i]=ca;
					i++;
				}
			 

		}
		return cc;
		}else {
			return null;
		}
		
	}
	
	// 字符串转数字
	public static int StringToInteger(String val){
		int i=0;
		if(val.equals("")){
			i=0;
		}else{
			i=Integer.parseInt(val);
		}
		return i;
	}
	//数字转中文大写
	public static  String intToChinses(int d){
		String[] str={"零","壹","贰","叁","肆","伍","陆","柒","捌","玖"};
		String ss[] = new String[]{"","拾","佰","仟","万","拾","佰","仟","亿"}; 
		String s=String.valueOf(d);
		if(d==0){
			return "始祖";
		}
		StringBuffer sb=new StringBuffer();
		for(int i=0;i<s.length();i++){
		String index=String.valueOf(s.charAt(i));
		sb=sb.append(str[Integer.parseInt(index)]);
		}
		String sss=String.valueOf(sb);
		int i=0;
		for(int j=sss.length();j>0;j--){
		sb=sb.insert(j,ss[i++]);
		}
		return sb.toString();
		}
	
	/** 
     * 手机号验证 
     *  
     * @param  str 
     * @return 验证通过返回true 
     */  
    public static boolean isMobile(String str) {   
        Pattern p = null;  
        Matcher m = null;  
        boolean b = false;   
        p = Pattern.compile("^1[34578]\\d{9}$"); // 验证手机号  
        m = p.matcher(str);  
        b = m.matches();   
        return b;  
    }  
    
    public static boolean isNumeric(String str){ 
	   Pattern pattern = Pattern.compile("[0-9]*"); 
	   Matcher isNum = pattern.matcher(str);
	   if( !isNum.matches() ){
	       return false; 
	   } 
	   return true; 
	}
    

    public static String getPingYin(String src) {  
    	  
        char[] t1 = null;  
        t1 = src.toCharArray();  
        String[] t2 = new String[t1.length];  
        HanyuPinyinOutputFormat t3 = new HanyuPinyinOutputFormat();  
          
        t3.setCaseType(HanyuPinyinCaseType.LOWERCASE);  
        t3.setToneType(HanyuPinyinToneType.WITHOUT_TONE);  
        t3.setVCharType(HanyuPinyinVCharType.WITH_V);  
        String t4 = "";  
        int t0 = t1.length;  
        try {  
            for (int i = 0; i < t0; i++) {  
                // 判断是否为汉字字符  
                if (java.lang.Character.toString(t1[i]).matches(  
                        "[\\u4E00-\\u9FA5]+")) {  
                    t2 = PinyinHelper.toHanyuPinyinStringArray(t1[i], t3);  
                    t4 += t2[0];  
                } else  
                    t4 += java.lang.Character.toString(t1[i]);  
            }  
            // System.out.println(t4);  
            return t4;  
        } catch (BadHanyuPinyinOutputFormatCombination e1) {  
            e1.printStackTrace();  
        }  
        return t4;  
    } 
    
    public static String getRandomString(int length) { //length表示生成字符串的长度
        String base = "abcdefghijklmnopqrstuvwxyz0123456789";   
        Random random = new Random();   
        StringBuffer sb = new StringBuffer();   
        for (int i = 0; i < length; i++) {   
            int number = random.nextInt(base.length());   
            sb.append(base.charAt(number));   
        }   
        return sb.toString();   
     }  
    
    public static String hidString(String  src) { //隐藏部分字符
        String base = src.substring(0,src.indexOf("@"));    
        StringBuffer sb = new StringBuffer();   
        for (int i = 0; i < base.length(); i++) {   
        	if(i%2==1){
        		sb.append("*");
        	}else{
                sb.append(base.charAt(i));   
        	}
        }  
        sb.append(src.substring(src.indexOf("@")));
        return sb.toString();   
     } 
    
    public static String hidZfbString(String  src) { //隐藏显示支付宝账号
    	StringBuffer sb = new StringBuffer(); 
    	if(src.indexOf("@")==-1){
	        String base = src;   
	        if(base.length()>7){
		        for (int i = 0; i < base.length(); i++) {   
		        	if(i>2&&i<base.length()-4){
		        		sb.append("*");
		        	}else{
		                sb.append(base.charAt(i));   
		        	}
		        }  
	        }else{
	        	sb.append(base);
	        }   		
    	}else{
	        String base = src.substring(0,src.indexOf("@"));   
	        for (int i = 0; i < base.length(); i++) {   
	        	if(i>1){
	        		sb.append("*");
	        	}else{
	                sb.append(base.charAt(i));   
	        	}
	        }  
	        sb.append(src.substring(src.indexOf("@")));	         
    	}
    	return sb.toString(); 
     } 
    
	
	public static void main(String[] args) {
		//System.out.println(Tools.getPingYin("天地背景"));
		Tools.hidZfbString("13439192789");
	}
}
