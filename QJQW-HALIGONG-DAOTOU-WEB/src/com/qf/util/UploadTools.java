package com.qf.util;


import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Random;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.qf.util.common.BizResult;

public class UploadTools {
	
	
	/**
	 * 将上传的文件进行重命名
	 * @return
	 */
	public static String reName(String name) {
		String fileName = (UUID.randomUUID()+"").split("-")[0]+(System.currentTimeMillis()+Math.round(Math.random()*10000));
		if (name.indexOf(".") != -1) {
			fileName += name.substring(name.lastIndexOf("."));
		}
		return fileName;
	}
   /**
    * 上传多个人文件重新命名 
    * @return
    */
	
	public static String[] reName(String[] name) {
		String[] fileName = new String[name.length];
        for(int i=0;i<name.length;i++){
			fileName[i] = (UUID.randomUUID()+"").split("-")[0]+(System.currentTimeMillis()+Math.round(Math.random()*10000));
			if (name[i].indexOf(".") != -1) {
				fileName[i] += name[i].substring(name[i].lastIndexOf("."));
			}
        }
		return fileName;
	}
	/**
	 * 压缩后的文件名
	 * @return
	 */
	public static String zipName(String name) {
		String prefix = "";
		if (name.indexOf(".") != -1) {
			prefix = name.substring(0, name.lastIndexOf("."));
		} else {
			prefix = name;
		}
		return prefix + ".zip";
	}
	/**
	 * 文件上传
	 * @param is 文件流
	 * @param root  文件存放目录
	 * @param fileName   文件名
	 * @return
	 */
	public static boolean upload(InputStream is,String root,String fileName){
		try {
	        File targetFile = new File(root,fileName);
	        if (!targetFile.getParentFile().exists()) {
	        	targetFile.getParentFile().mkdirs();
			}
	        OutputStream os = new FileOutputStream(targetFile);
	        byte[] buffer = new byte[2048];
	        int length  = 0 ;
	        while((length = is.read(buffer))>0){
	            os.write(buffer, 0, length);
	        }
	        is.close();
	        os.close();
	        return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		
	}
	/**
	 * mutifile上传文件方法
	 * @param file
	 * @param request
	 * @param relroot
	 * @return
	 */
	public static String uploadSpringMVCfile(MultipartFile file,HttpServletRequest request,String relroot){
		if (file.getSize()>0) {
			String newName = reName(file.getOriginalFilename());
			String path = request.getSession().getServletContext().getRealPath(relroot);
			File targetFile = new File(path, newName);
			String imagePath = relroot +File.separator+ newName;
			if (!targetFile.exists()) {
				targetFile.mkdirs();
			}
			try {
				file.transferTo(targetFile);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return imagePath;
		}
		else{
			return null;
		}	
			
		
	}
public static BizResult UploadFiles(CommonsMultipartFile[] files,HttpServletRequest request, String serverpath) {
		
		BizResult result = new BizResult();
		
		if (files == null && files.length == 0) {
			result.result = true;
			result.message = "无文件上传";
			return result;
		}
		// 验证文件格式
		for (CommonsMultipartFile file : files) {
			if (!file.isEmpty()) {

				String filename = file.getOriginalFilename();
				String ftype = filename
						.substring(filename.lastIndexOf(".") + 1);
				String[] allowtype = { "jpg", "jpeg", "png", "gif", "doc",
						"pdf", "docx", "xls", "xlsx", "ppt", "pptx", "txt",
						"mp3", "mp4", "flv", "rtf", "zip", "rar" };
				boolean isnameok = false;
				for (int a = 0; a < allowtype.length; a++) {
					if (allowtype[a].equals(ftype)) {
						isnameok = true;
					}
				}
				if (file.getSize() > 1024 * 10000) {
					result.result = false;
					result.message = "请不要上传大于10M的图片";
					return result;
				}
				if (isnameok == false) {
					result.result = false;
					result.message = "图片格式有误，系统不支持" + ftype + "格式！";
					return result;					
				}
			}
		}
		List<String> fileList = new ArrayList<String>();
		for (CommonsMultipartFile file : files) {
			if (!file.isEmpty()) {
				String filename = file.getOriginalFilename();
				String ftype = filename
						.substring(filename.lastIndexOf(".") + 1);
				String pathFile =  serverpath;
				String pathFileRa = request.getSession().getServletContext().getRealPath("/goods" +pathFile);
				File fileMl = new File(pathFileRa); 
				if  (!fileMl .exists())      
				{       
			        if (fileMl.mkdirs()) {  
			            System.out.println("创建目录成功！");  
			        }else{
			        	System.out.println("创建目录失败！");  
			        }
				}
				String webpath = pathFile + "/"+ getRandomFilename() + ftype;
				String filepath = request.getSession().getServletContext()
						.getRealPath("/goods" +webpath);
				fileList.add(webpath);
				System.out.println("【上传文件】：" + filepath);
				try {
					byte[] bytes = file.getBytes();
					BufferedOutputStream stream = new BufferedOutputStream(
							new FileOutputStream(new File(filepath)));
					stream.write(bytes);
					stream.close();
				} catch (Exception e) {
					e.printStackTrace();
					result.result = false;
					result.message = "上传图片发生异常！" + e.toString();
					return result;	
				}
			}
		}
		// 写入数据库
		System.out.println("共有" + fileList.size() + "个文件上传成功！" );
		result.result = true;
		result.message = "共有" + fileList.size() + "个文件上传成功！" ;
		result.list = fileList;
		return result;
	}
/*
 * 生成随机文件名
 */
public static String getRandomFilename() {
	String RandomFilename = "";
	Random rand = new Random();// 生成随机数
	int random = rand.nextInt();

	Calendar calCurrent = Calendar.getInstance();
	int intDay = calCurrent.get(Calendar.DATE);
	int intMonth = calCurrent.get(Calendar.MONTH) + 1;
	int intYear = calCurrent.get(Calendar.YEAR);
	String now = String.valueOf(intYear) + "_" + String.valueOf(intMonth)
			+ "_" + String.valueOf(intDay) + "_";

	RandomFilename = now
			+ String.valueOf(random > 0 ? random : (-1) * random) + ".";
	return RandomFilename;
}	
}
