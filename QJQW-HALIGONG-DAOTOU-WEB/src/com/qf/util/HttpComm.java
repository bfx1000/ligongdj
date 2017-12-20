package com.qf.util;


import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.URL;
import java.net.URLConnection;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.HttpStatus;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.util.EntityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import net.sf.json.JSONObject;

public class HttpComm {

	private static final Logger logger = LoggerFactory.getLogger(HttpComm.class);
    /**
     * 向指定URL发送GET方法的请求
     * 
     * @param url
     *            发送请求的URL
     * @param param
     *            请求参数，请求参数应该是 name1=value1&name2=value2 的形式, 也可以为空
     * @return URL 所代表远程资源的响应结果
     */
    public static String sendGet(String url, String param) {
        String urlNameString = StringUtils.isBlank(param) ? url : url + "?" + param;

        int i = 3;
        String responseContent = null; // 响应内容
        while (i > 0) {
            HttpClient httpClient = new DefaultHttpClient(); // 创建默认的httpClient实例
            try {
                HttpGet httpGet = new HttpGet(urlNameString); // 创建org.apache.http.client.methods.HttpGet
                HttpResponse response = httpClient.execute(httpGet); // 执行GET请求
                HttpEntity entity = response.getEntity(); // 获取响应实体
                if (null != entity) {
                    responseContent = EntityUtils.toString(entity, "UTF-8");
//                    EntityUtils.consume(entity); // Consume response content
                }
                break;
            } catch (Exception e) {
                i--;
                if (i == 0) {
                    logger.error("异常堆栈信息如下 \n", e);
                }
            } finally {
                httpClient.getConnectionManager().shutdown(); // 关闭连接,释放资源
            }
        }

        return responseContent;
    }

    /**
     * 向指定 URL 发送POST方法的请求
     * 
     * @param url
     *            发送请求的 URL
     * @param param
     *            请求参数，请求参数应该是 name1=value1&name2=value2 的形式。
     * @return 所代表远程资源的响应结果
     */
    public static String sendPost(String url, String param) {
        PrintWriter out = null;
        BufferedReader in = null;
        String result = "";
        try {
            URL realUrl = new URL(url);
            // 打开和URL之间的连接
            URLConnection conn = realUrl.openConnection();
            // 设置通用的请求属性
            conn.setRequestProperty("accept", "*/*");
            conn.setRequestProperty("connection", "Keep-Alive");
            conn.setRequestProperty("user-agent",
                    "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1;SV1)");
            // 发送POST请求必须设置如下两行
            conn.setDoOutput(true);
            conn.setDoInput(true);
            // 获取URLConnection对象对应的输出流
            out = new PrintWriter(conn.getOutputStream());
            // 发送请求参数
            out.print(param);
            // flush输出流的缓冲
            out.flush();
            // 定义BufferedReader输入流来读取URL的响应
            in = new BufferedReader(
                    new InputStreamReader(conn.getInputStream()));
            String line;
            while ((line = in.readLine()) != null) {
                result += line;
            }
        } catch (Exception e) {
             
            e.printStackTrace();
        }
        //使用finally块来关闭输出流、输入流
        finally{
            try{
                if(out!=null){
                    out.close();
                }
                if(in!=null){
                    in.close();
                }
            }
            catch(IOException ex){
                ex.printStackTrace();
            }
        }
        return result;
    }

    public static String sendGet(String url, Map<String, Object> map) {
    	return sendGet(url, Map2QueryString(map));
    }

    public static String sendPostWithBody(String url, String body) {
    	DefaultHttpClient client = new DefaultHttpClient();
        HttpPost post = new HttpPost(url);
        JSONObject response = null;
        try {
          StringEntity s = new StringEntity(body.toString());
          s.setContentEncoding("UTF-8");
          s.setContentType("application/json");//发送json数据需要设置contentType
          post.setEntity(s);
          HttpResponse res = client.execute(post);
          if(res.getStatusLine().getStatusCode() == HttpStatus.SC_OK){
            HttpEntity entity = res.getEntity();
            String content = EntityUtils.toString(res.getEntity());
            String result = new String(content.getBytes("ISO-8859-1"),"UTF-8");// 返回json格式：
            logger.info("response result = {}", result);
            response = JSONObject.fromObject(result);
          }
        } catch (Exception e) {
          throw new RuntimeException(e);
        }
        return response.toString();
    }

    private static String Map2QueryString(Map<String, Object> map) {
 
    	StringBuilder param = new StringBuilder();
    	for (Map.Entry<String, Object> entry : map.entrySet()) {
    		param.append(entry.getKey());
    		param.append("=");
    		param.append(entry.getValue());
    		param.append("&");
    	}
    	return param.substring(0, param.length()-1);
    }
}