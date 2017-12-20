package com.qf.util.mail;
/**   
 * 简单邮件（不带附件的邮件）发送器   
 */ 
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.mail.internet.MimeUtility;

import jxl.Cell;
import jxl.Sheet;
import jxl.Workbook;
import jxl.read.biff.BiffException;
import jxl.write.Label;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;

import com.qf.util.common.DateUtil;
import com.qf.util.controller.BaseController;


    
public class SimpleMailSender extends BaseController {    
/**   
  * 以文本格式发送邮件   
  * @param mailInfo 待发送的邮件的信息   
  */    
    public boolean sendTextMail(MailSenderInfo mailInfo)throws Exception{    
      // 判断是否需要身份认证    
      MyAuthenticator authenticator = null;    
      Properties pro = mailInfo.getProperties();   
      if (mailInfo.isValidate()) {    
      // 如果需要身份认证，则创建一个密码验证器    
        authenticator = new MyAuthenticator(mailInfo.getUserName(), mailInfo.getPassword());    
      }   
      
      // 根据邮件会话属性和密码验证器构造一个发送邮件的session    
      Session sendMailSession = Session.getDefaultInstance(pro,authenticator); 
      //sendMailSession.setDebug(true);
      //logBefore(logger, "构造一个发送邮件的session");
      
      // 根据session创建一个邮件消息    
      Message mailMessage = new MimeMessage(sendMailSession);    
      // 创建邮件发送者地址    

         // mailMessage.setFrom(new InternetAddress(nick + "<" + from + ">"));
         
		  Address from = new InternetAddress(MimeUtility.encodeText("全球祭祀祈福网-云祈福")+"<"+ mailInfo.getFromAddress()+ ">");    
		  // 设置邮件消息的发送者    
		  mailMessage.setFrom(from);    
		  // 创建邮件的接收者地址，并设置到邮件消息中    
		  Address to = new InternetAddress(mailInfo.getToAddress());    
		  mailMessage.setRecipient(Message.RecipientType.TO,to);    
		  // 设置邮件消息的主题    
		  mailMessage.setSubject(mailInfo.getSubject());    
		  // 设置邮件消息发送的时间    
		  mailMessage.setSentDate(new Date());    
		  // 设置邮件消息的主要内容    
		  String mailContent = mailInfo.getContent();    
		  mailMessage.setText(mailContent);    
		  // 发送邮件    
		  Transport.send(mailMessage);
		  //logBefore(logger, mailInfo.getToAddress() +"发送成功！");
		  System.out.println(mailInfo.getToAddress() +"发送成功！");

      
      return true;    
    }    
       
    /**   
      * 以HTML格式发送邮件   
      * @param mailInfo 待发送的邮件信息   
      */    
    public  boolean sendHtmlMail(MailSenderInfo mailInfo) throws Exception{    
      // 判断是否需要身份认证    
      MyAuthenticator authenticator = null;   
      Properties pro = mailInfo.getProperties();   
      //如果需要身份认证，则创建一个密码验证器     
      if (mailInfo.isValidate()) {    
        authenticator = new MyAuthenticator(mailInfo.getUserName(), mailInfo.getPassword());   
      }    
      // 根据邮件会话属性和密码验证器构造一个发送邮件的session    
      Session sendMailSession = Session.getDefaultInstance(pro,authenticator);    
        
      // 根据session创建一个邮件消息    
      Message mailMessage = new MimeMessage(sendMailSession);    
      // 创建邮件发送者地址    
      Address from = new InternetAddress(mailInfo.getFromAddress());    
      // 设置邮件消息的发送者    
      mailMessage.setFrom(from);    
      // 创建邮件的接收者地址，并设置到邮件消息中    
      Address to = new InternetAddress(mailInfo.getToAddress());    
      // Message.RecipientType.TO属性表示接收者的类型为TO    
      mailMessage.setRecipient(Message.RecipientType.TO,to);    
      // 设置邮件消息的主题    
      mailMessage.setSubject(mailInfo.getSubject());    
      // 设置邮件消息发送的时间    
      mailMessage.setSentDate(new Date());    
      // MiniMultipart类是一个容器类，包含MimeBodyPart类型的对象    
      Multipart mainPart = new MimeMultipart();    
      // 创建一个包含HTML内容的MimeBodyPart    
      BodyPart html = new MimeBodyPart();    
      // 设置HTML内容    
      html.setContent(mailInfo.getContent(), "text/html; charset=utf-8");    
      mainPart.addBodyPart(html);    
      // 将MiniMultipart对象设置为邮件内容    
      mailMessage.setContent(mainPart);    
      // 发送邮件    
      Transport.send(mailMessage);    
      return true;    
    }    
 
    /*
     * @title:标题
     * @content:内容
     * @type:类型,1:文本格式;2:html格式
     * @tomail:接收的邮箱
     */
    public boolean sendMail(String title,String content,String type,String tomail) throws Exception{   
        
    	//这个类主要是设置邮件   
	     MailSenderInfo mailInfo = new MailSenderInfo();    
	     mailInfo.setMailServerHost("smtp.qq.com");    
	     mailInfo.setMailServerPort("25");    
	     mailInfo.setValidate(true);    
	     mailInfo.setUserName("itfather@1b23.com");    
	     mailInfo.setPassword("tttt");//您的邮箱密码    
	     mailInfo.setFromAddress("itfather@1b23.com");    
	     mailInfo.setToAddress(tomail);    
	     mailInfo.setSubject(title);    
	     mailInfo.setContent(content);    
	     //这个类主要来发送邮件   
	  
	     SimpleMailSender sms = new SimpleMailSender();   
	     
	     if("1".equals(type)){
	    	 return sms.sendTextMail(mailInfo);//发送文体格式    
	     }else if("2".equals(type)){
	    	 return sms.sendHtmlMail(mailInfo);//发送html格式   
	     }
	     return false;
	   }
    /**
     * @param SMTP  	邮件服务器
     * @param PORT		端口
     * @param EMAIL		本邮箱账号
     * @param PAW		本邮箱密码
     * @param toEMAIL	对方箱账号
     * @param TITLE		标题
     * @param CONTENT	内容
     * @param TYPE		1：文本格式;2：HTML格式
     */
    public static void sendEmail(String SMTP, String PORT, String EMAIL, String PAW, String toEMAIL, String TITLE, String CONTENT, String TYPE) throws Exception{ 
    	
        //这个类主要是设置邮件   
	     MailSenderInfo mailInfo = new MailSenderInfo();
	     
	     mailInfo.setMailServerHost(SMTP);    
	     mailInfo.setMailServerPort(PORT);    
	     mailInfo.setValidate(true);    
	     mailInfo.setUserName(EMAIL);    
	     mailInfo.setPassword(PAW);   
	     mailInfo.setFromAddress(EMAIL);    
	     mailInfo.setToAddress(toEMAIL);    
	     mailInfo.setSubject(TITLE);    
	     mailInfo.setContent(CONTENT);    
	     //这个类主要来发送邮件   
	  
	     SimpleMailSender sms = new SimpleMailSender();
	     
	    if("1".equals(TYPE)){
	    	sms.sendTextMail(mailInfo);
	    }else{
	    	sms.sendHtmlMail(mailInfo);
	    }
	     
	   }
  
   	public void sendAllMail(File file){
   		
   		System.out.println("sendAllMail : " +file.getName());
   		BufferedReader in = null;
   		try {
		    List<String> saveList = new ArrayList<String>();			
			in = new BufferedReader(new InputStreamReader(new FileInputStream(file), "gbk"));
			String line;
			while ((line = in.readLine()) != null) {
				System.out.println("!!!!!!!!!"+line);
				saveList.add(line);
			}
			in.close();
			System.out.println("saveList:="+saveList.size());			
			System.out.println(file.getName() + ":end");
   					

   		} catch (Exception e) {
   			e.printStackTrace();
   		}finally{
               try{
                   if(in!=null){
                       in.close();
                   }
               }
               catch(Exception ex){
               	ex.printStackTrace();
               }
           }		
   	}
   	
    public  void sendAllMailByExcel(File file) {   
    	String[] ss = null; 
    	List<String[]> saveList = new ArrayList<String[]>();
    	List<String[]> errorList = new ArrayList<String[]>();
        try {  

            Workbook wb = Workbook.getWorkbook(file); 
            Sheet sheet = wb.getSheet(0); 
              
            for (int i = 0; i < sheet.getRows(); i++) { 
            	ss = new String[3]; 
                for (int j = 0; j < sheet.getColumns(); j++) {  
                    Cell cell = sheet.getCell(j, i);  
                    ss[j] = cell.getContents();
                }  
                saveList.add(ss);
            } 
            System.out.println("saveList=:"+saveList.size());
            MailSenderInfo mailInfo = null;
            int count = 0;
            int errorCount = 0;
            int saveCount = 0;
       	    mailInfo = new MailSenderInfo(); 
       	   
//      	    mailInfo.setMailServerHost("smtp.exmail.qq.com");    
//	   	    mailInfo.setMailServerPort("25");    
//	   	    mailInfo.setValidate(true);    
//	   	    mailInfo.setUserName("kefu-1@qjqw.com");    
//	   	    mailInfo.setPassword("Qifu12");//您的邮箱密码    
//	   	    mailInfo.setFromAddress("kefu-1@qjqw.com");    
	   	    
       	    
      	    mailInfo.setMailServerHost("smtp.163.com");    
	   	    mailInfo.setMailServerPort("25");    
	   	    mailInfo.setValidate(true);    
	   	    mailInfo.setUserName("qjqw.com@163.com");    
	   	    mailInfo.setPassword("13009806696");//您的邮箱密码    
	   	    mailInfo.setFromAddress("qjqw.com@163.com");  
	   	    
//      	    mailInfo.setMailServerHost("smtp.tom.com");    
//	   	    mailInfo.setMailServerPort("25");    
//	   	    mailInfo.setValidate(true);    
//	   	    mailInfo.setUserName("quyibo007@tom.com");    
//	   	    mailInfo.setPassword("778899");//您的邮箱密码    
//	   	    mailInfo.setFromAddress("quyibo007@tom.com");    
            for(String[] sst:saveList){
            	 count++;
	    	     mailInfo.setToAddress(sst[0]);    
	    	     mailInfo.setSubject(sst[1]);    
	    	     mailInfo.setContent(sst[2]);    
	    	     try {
					sendTextMail(mailInfo);
					Thread.sleep(1000);//休息0.1秒
					saveCount++;
				 } catch (Exception e) {
					errorCount++;
					//logBefore(logger, sst[0] + "发送失败！");
					System.out.println(sst[0] + "发送失败！");
					errorList.add(sst);
					//System.out.println(e.toString());
					//e.printStackTrace();
				 }
            }
            System.out.println("共:"+count+"成功"+saveCount+"失败"+errorCount);
            System.out.println("errorList:"+errorList.size());
            errorWriter(errorList);
        } catch (BiffException e) {  
            e.printStackTrace();  
        } catch (IOException e) {  
            e.printStackTrace();  
        }  
          
    } 
    
    public void errorWriter(List<String[]> errorList){
    	BufferedWriter out = null;
    	String ds = DateUtil.fromTimestampToDateMail(System.currentTimeMillis()/1000);
    	try {
			out = new BufferedWriter(new OutputStreamWriter(new FileOutputStream("C:/Users/Administrator/Desktop/mail/error"+ds+".txt"), "utf-8"));
			String[] rowModel = null;
			String id = "";
			for(int i=0;i<errorList.size();i++)
			{				
				rowModel = (String[]) errorList.get(i);
				String str = "";
				str = str + rowModel[0];
				str = str + "#";
				str = str + rowModel[1];
				str = str + "#";
				str = str + rowModel[2];
				str = str + "\r\n";
				out.write(str);
			}			
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
            try{
                if(out!=null){
                	out.close();
                }
            }
            catch(Exception ex){
            	ex.printStackTrace();
            }
        } 
    	WritableWorkbook wwb = null;
        try
        {
        	OutputStream os = new FileOutputStream("C:/Users/Administrator/Desktop/mail/error"+ds+".xls");
            wwb = Workbook.createWorkbook(os);
            //创建Excel工作表 指定名称和位置
            WritableSheet ws = wwb.createSheet("test",0);
 
            //**************往工作表中添加数据*****************
                     
           for(int i=0;i<errorList.size();i++){
        	  String[] ss = errorList.get(i);
              for(int j=0;j<ss.length;j++){
	              Label label = new Label(j,i,ss[j]);
	              ws.addCell(label);
              }
           }
                       //写入工作表
            wwb.write();
            wwb.close();
        }
        catch(Exception e)
        {
           
        }finally{
            try{
                if(wwb!=null){
                	wwb.close();
                }
            }
            catch(Exception ex){
            	ex.printStackTrace();
            }
        }
    }
    
    public static void main(String[] args) throws Exception{   
        //这个类主要是设置邮件   
//	     MailSenderInfo mailInfo = new MailSenderInfo();    
//	     mailInfo.setMailServerHost("smtp.163.com");    
//	     mailInfo.setMailServerPort("25");    
//	     mailInfo.setValidate(true);    
//	     mailInfo.setUserName("qjqw.com");    
//	     mailInfo.setPassword("13009806696");//您的邮箱密码    
//	     mailInfo.setFromAddress("qjqw.com@163.com");    
//	     mailInfo.setToAddress("quyibo229@126.com");    
//	     mailInfo.setSubject("设置邮箱标题");    
//	     mailInfo.setContent("设置邮箱内容");    
	     //这个类主要来发送邮件   	  
	     SimpleMailSender sms = new SimpleMailSender();   
	     //sms.sendTextMail(mailInfo);
	     //发送文体格式    
	     //sms.sendHtmlMail(mailInfo);//发送html格式   
	     
	     File file = new File("C:/Users/Administrator/Desktop/mail/1315.xls");
	     sms.sendAllMailByExcel(file);
	   }
    
    public static List<Map> sendUserPswdMail(List<Map> sendList) {   
    	List<Map> errorList = new ArrayList<Map>();
        try {  
            System.out.println("saveList=:"+sendList.size());
            MailSenderInfo mailInfo = null;
            int count = 0;
            int errorCount = 0;
            int saveCount = 0;
       	    mailInfo = new MailSenderInfo(); 
       	   	   	           	    
      	    mailInfo.setMailServerHost("smtp.163.com");    
	   	    mailInfo.setMailServerPort("25");    
	   	    mailInfo.setValidate(true);    
	   	    mailInfo.setUserName("qjqw.com@163.com");    
	   	    mailInfo.setPassword("13009806696");//您的邮箱密码    
	   	    mailInfo.setFromAddress("qjqw.com@163.com");  

            for(Map map:sendList){
            	 count++;
	    	     mailInfo.setToAddress(map.get("user_email").toString());    
	    	     mailInfo.setSubject(map.get("subject").toString());    
	    	     mailInfo.setContent(map.get("content").toString());    
	    	     SimpleMailSender sms = new SimpleMailSender();
	    	     try {	    	    	
	    	    	sms.sendTextMail(mailInfo);
				 } catch (Exception e) {
					System.out.println(map.get("user_email").toString() + "发送失败！");
					errorList.add(map);
				 }
            }
            System.out.println("共:"+count+"成功"+saveCount+"失败"+errorCount);
            System.out.println("errorList:"+errorList.size());
        } catch (Exception e) {  
            e.printStackTrace();  
        }        
        return errorList;          
    }   
    
    public static Map sendUserPswdMail(Map map) {   
       
            MailSenderInfo mailInfo = null;
       	    mailInfo = new MailSenderInfo(); 
       	   	   	           	    
      	    mailInfo.setMailServerHost("smtp.163.com");    
	   	    mailInfo.setMailServerPort("25");    
	   	    mailInfo.setValidate(true);    
	   	    mailInfo.setUserName("qjqw.com@163.com");    
	   	    mailInfo.setPassword("13009806696");//您的邮箱密码    
	   	    mailInfo.setFromAddress("qjqw.com@163.com");  

		     mailInfo.setToAddress(map.get("user_email").toString());    
		     mailInfo.setSubject(map.get("subject").toString());    
		     mailInfo.setContent(map.get("content").toString());    
		     SimpleMailSender sms = new SimpleMailSender();
		     try {	    	    	
		    	sms.sendTextMail(mailInfo);
		    	return null;
			 } catch (Exception e) {
				System.out.println(map.get("user_email").toString() + "发送失败！");
				return map;
			 }    
    }  
    
}   
