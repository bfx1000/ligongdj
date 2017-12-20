package com.qf.util;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

import org.json.JSONObject;

public class AddressUtils {

	
	
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		
		AddressUtils addressUtils = new AddressUtils();
		
		  String ip = "123.166.107.190";
//		  String ip = "192.168.1.107";
		  String address = "";
		  
		  try {
			  
//		   address = addressUtils.getAddress("ip="+ip, "utf-8");
			  address = addressUtils.getAddress2(ip);
		  } catch (Exception e) {
			  System.out.println("111");
			  e.printStackTrace();
		  }
		  
		  System.out.println(address);
		  

	}
	/**
	 * 获取地址
	 * @param params
	 * @param encoding
	 * @return
	 * @throws Exception
	 */
	public String getAddress1(String ip){
		try{
			String returnStr = this.getRs2(ip);
			
			JSONObject json=null;
			
			if(returnStr != null){
				
				json = new JSONObject(returnStr);
				
				if("0".equals(json.get("code").toString())){
					
					StringBuffer buffer = new StringBuffer();
					
					//buffer.append(decodeUnicode(json.optJSONObject("data").getString("country")));//国家
					
					//buffer.append(decodeUnicode(json.optJSONObject("data").getString("area")));//地区
					
					buffer.append(decodeUnicode(json.optJSONObject("data").getString("region")));//省份
					
					buffer.append(decodeUnicode(json.optJSONObject("data").getString("city")));//市区
					
//					buffer.append(decodeUnicode(json.optJSONObject("data").getString("county")));//地区
					
//					buffer.append(decodeUnicode(json.optJSONObject("data").getString("isp")));//ISP公司
					System.out.println("address===="+buffer.toString());
					return buffer.toString();
				}else{
					return "黑龙江哈尔滨";
				}
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return "黑龙江哈尔滨";
		
	}
	/**新浪  地址
	 * @param params
	 * @param encoding
	 * @return
	 * @throws Exception
	 */
	public String getAddress2(String ip){
		
		try{
			String returnStr = this.getRs2(ip);
			
			JSONObject json=null;
			
			if(returnStr != null){
				
				json = new JSONObject(returnStr);
				
				if("1".equals(json.get("ret").toString())){
					
					StringBuffer buffer = new StringBuffer();
					
					buffer.append(decodeUnicode(json.getString("province").toString()));//省份
					
					buffer.append(decodeUnicode(json.getString("city").toString()));//市区
					
					System.out.println("address===="+buffer.toString());
					return buffer.toString();
				}else{
					return "黑龙江省哈尔滨市";
				}
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return "黑龙江省哈尔滨市";
		
	}
	
	public static String getRs2(String ip) {
//		String action = "http://ip.taobao.com/service/getIpInfo.php?ip="+ip;  //淘宝
		String action = "http://int.dpool.sina.com.cn/iplookup/iplookup.php?format=json&ip="+ip;
		try {
			URL url = new URL(action);
			HttpURLConnection http = (HttpURLConnection) url.openConnection();

			http.setRequestMethod("GET");
			http.setRequestProperty("Content-Type","application/x-www-form-urlencoded");
			http.setDoOutput(true);
			http.setDoInput(true);
			System.setProperty("sun.net.client.defaultConnectTimeout", "30000");// 连接超时30秒
			System.setProperty("sun.net.client.defaultReadTimeout", "30000"); // 读取超时30秒
			http.connect();
			System.out.println("--->"+http.getResponseCode());
//			OutputStream os = http.getOutputStream();
//			ip = "ip="+ip;
//			os.write(ip.getBytes("UTF-8"));// 传入参数
//			os.flush();
//			os.close();

			InputStream is = http.getInputStream();
			int size = is.available();
			byte[] jsonBytes = new byte[size];
			is.read(jsonBytes);
			String message = new String(jsonBytes, "UTF-8");
			return message;
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 从url获取结果
	 * @param path
	 * @param params
	 * @param encoding
	 * @return
	 */
	public String getRs(String path, String params, String encoding){
		
		URL url = null;
		
		HttpURLConnection connection = null;
			
		try {
			
			url = new URL(path);
				
			connection = (HttpURLConnection)url.openConnection();// 新建连接实例
				
			connection.setConnectTimeout(3000);// 设置连接超时时间，单位毫�?
			
			connection.setReadTimeout(3000);// 设置读取数据超时时间，单位毫�?
			
			connection.setDoInput(true);// 是否打开输出�? true|false
			
			connection.setDoOutput(true);// 是否打开输入流true|false
			
			connection.setRequestMethod("POST");// 提交方法POST|GET
			
			connection.setUseCaches(false);// 是否缓存true|false
			long start = System.currentTimeMillis()/1000;
			System.out.println("start=="+start);
			connection.connect();// 打开连接端口
			long end = System.currentTimeMillis()/1000;
			
			if(end-start>3000){
				return null;
			}
			
			DataOutputStream out = new DataOutputStream(connection.getOutputStream());
			
			out.writeBytes(params);
			
			out.flush();
			
			out.close();
			
			BufferedReader reader = new BufferedReader(new InputStreamReader(connection.getInputStream(),encoding));
			
			StringBuffer buffer = new StringBuffer();
			
			String line = "";
			
			while ((line = reader.readLine())!= null) {
				
				buffer.append(line);
				
			}
			
			reader.close();
			
			return buffer.toString();
		} catch (Exception e) {
			System.out.println("11111111");
			e.printStackTrace();
			
		}finally{
			
			connection.disconnect();// 关闭连接
			
		}
		return null;
	}
	/**
	 * 字符转码
	 * @param theString
	 * @return
	 */
	public static String decodeUnicode(String theString){
		
		char aChar;
		
		int len = theString.length();
		
		StringBuffer buffer = new StringBuffer(len);
		
		for (int i = 0; i < len;) {
			
			aChar = theString.charAt(i++);
			
			if(aChar == '\\'){
				
				aChar = theString.charAt(i++);
			
				if(aChar == 'u'){
					
					int val = 0;
					
					for(int j = 0; j < 4; j++){
						
						aChar = theString.charAt(i++);
						
						switch (aChar) {
						
						case '0':
							
						case '1':
							
						case '2':
							
						case '3':
							
						case '4':
						
						case '5':
							
						case '6':
						
						case '7':
							
						case '8':
							
						case '9':
							
						val = (val << 4) + aChar - '0';
						
						break;
	
						case 'a':
							
						case 'b':
							
						case 'c':
							
						case 'd':
							
						case 'e':
							
						case 'f':
							
						val = (val << 4) + 10 + aChar - 'a';
						       
						break;
						
						case 'A':
							
						case 'B':
							
						case 'C':
							
						case 'D':
							
						case 'E':
							
						case 'F':
						  
						val = (val << 4) + 10 + aChar - 'A';
						       
						break;
						       
						default:
						
						throw new IllegalArgumentException(
					         
							"Malformed      encoding.");
					    }
						
					}
					
					buffer.append((char) val);
					
					}else{
						
						if(aChar == 't'){
							
							aChar = '\t';
						}
						
						if(aChar == 'r'){
							
							aChar = '\r';
						}
						
						if(aChar == 'n'){
							
							aChar = '\n';
						}
						
						if(aChar == 'f'){
							
							aChar = '\f';
							
						}
						
						buffer.append(aChar);
					}
				
				}else{
					
					buffer.append(aChar);
					
				}
				
			}
		
		return buffer.toString();
		
	}

}
