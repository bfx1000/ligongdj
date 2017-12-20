package com.qf.util.common;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.util.Map;

import com.google.gson.Gson;

public class CallUrlUtil {
	public static void main(String[] args) {
		String url = "https://graph.qq.com/oauth2.0/token?grant_type=authorization_code&client_id=101282319&client_secret=842b9135d1742f8222215a6ba94ed608&code=DF421C3DC5C503A86BA09E051E3371E4&state=test&redirect_uri=http%3A%2F%2Fwww.qjqw.com%2FQQLoginCallBack%3Fa%3D1";
		String result = callUrlByGet(url);
		System.out.println(result+"!");
		Gson gson = new Gson();
		Map p = gson.fromJson(result, Map.class);
//		Map<String,Object> p = JackJson.fromJsonToObject(result,Map.class);
		System.out.println(p);
	}
	public static String callUrlByGet(String callurl){  
        String result = "";  
        try {  
            URL url = new URL(callurl+"?imageInfo");  
            URLConnection connection = url.openConnection();  
            connection.connect();  
              
            BufferedReader reader = new BufferedReader(new InputStreamReader(connection.getInputStream(),"utf-8"));  
            String line;  
            while((line = reader.readLine())!= null){  
                result += line;  
                result += "\n";  
            }  
            result = result.replace("\n", "");  
        } catch (Exception e) {  
            e.printStackTrace();  
            return "";  
        }  
        return result;  
    }  
	
	public static String callUrlByGet2(String callurl){  
        String result = "";  
        try {  
            URL url = new URL(callurl);  
            URLConnection connection = url.openConnection();  
            connection.connect();  
              
            BufferedReader reader = new BufferedReader(new InputStreamReader(connection.getInputStream(),"utf-8"));  
            String line;  
            while((line = reader.readLine())!= null){  
                result += line;  
                result += "\n";  
            }  
            result = result.replace("\n", "");  
        } catch (Exception e) {  
            e.printStackTrace();  
            return "";  
        }  
        return result;  
    }  
}
