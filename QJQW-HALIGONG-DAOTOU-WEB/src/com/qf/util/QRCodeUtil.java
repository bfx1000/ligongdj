package com.qf.util;  
  
import java.awt.Rectangle;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.imageio.ImageReadParam;
import javax.imageio.ImageReader;
import javax.imageio.stream.ImageInputStream;
import javax.servlet.http.HttpServletRequest;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.WriterException;
import com.google.zxing.common.BitMatrix;
  
/** 
 * 二维码工具类 
 *  
 */  
public class QRCodeUtil {
	

public static String createErWei(String value,int widthx,int heighty,String realPath){
		
		String path=value+".png";
		
		File fileMl = new File(realPath); 
		if  (!fileMl .exists())      
		{       
	        fileMl.mkdirs();
		}
		
		try {
			Hashtable<EncodeHintType, String> hints= new Hashtable<EncodeHintType, String>();
			hints.put(EncodeHintType.CHARACTER_SET, "UTF-8");
			BitMatrix byteMatrix = new MultiFormatWriter().encode(value, BarcodeFormat.QR_CODE, widthx, heighty);
						   
			int BLACK = 0xff000000;
			int WHITE = 0xFFFFFFFF;
			int width = byteMatrix.getWidth();
			int height = byteMatrix.getHeight();
			BufferedImage image = new BufferedImage(width, height,BufferedImage.TYPE_INT_ARGB);
			for (int x = 0; x < width; x++) {
				for (int y = 0; y < height; y++) {
					image.setRGB(x, y, byteMatrix.get(x, y) ? BLACK : WHITE);
				}
			}
						   
			Iterator<ImageReader> it = ImageIO.getImageReadersByFormatName("png");    
			ImageReader reader = it.next(); 
			ByteArrayOutputStream os = new ByteArrayOutputStream();
			ImageIO.write(image, "png", os);
			InputStream is = new ByteArrayInputStream(os.toByteArray());
			ImageInputStream iis  = ImageIO.createImageInputStream(is);
			reader.setInput(iis, false);
			ImageReadParam param = reader.getDefaultReadParam();
			Rectangle rect = new  Rectangle(20, 20, 160,160); 
			param.setSourceRegion(rect);
			BufferedImage bi = reader.read(0,param);
				           
			File file = new File(realPath,path);
			ImageIO.write(bi,"png",file);
		} catch (Exception e) {
			path = "error";
			e.printStackTrace();
		}		
		return path;
	}






public static String createErWeiCemetery(String path,int widthx,int heighty,String realPath){
	
//	String path=value+".png";
	
	File fileMl = new File(realPath); 
	if  (!fileMl .exists())      
	{       
        fileMl.mkdirs();
	}
	
	try {
		Hashtable<EncodeHintType, String> hints= new Hashtable<EncodeHintType, String>();
		hints.put(EncodeHintType.CHARACTER_SET, "UTF-8");
		BitMatrix byteMatrix = new MultiFormatWriter().encode(path, BarcodeFormat.QR_CODE, widthx, heighty);
					   
		int BLACK = 0xff000000;
		int WHITE = 0xFFFFFFFF;
		int width = byteMatrix.getWidth();
		int height = byteMatrix.getHeight();
		BufferedImage image = new BufferedImage(width, height,BufferedImage.TYPE_INT_ARGB);
		for (int x = 0; x < width; x++) {
			for (int y = 0; y < height; y++) {
				image.setRGB(x, y, byteMatrix.get(x, y) ? BLACK : WHITE);
			}
		}
					   
		Iterator<ImageReader> it = ImageIO.getImageReadersByFormatName("png");    
		ImageReader reader = it.next(); 
		ByteArrayOutputStream os = new ByteArrayOutputStream();
		ImageIO.write(image, "png", os);
		InputStream is = new ByteArrayInputStream(os.toByteArray());
		ImageInputStream iis  = ImageIO.createImageInputStream(is);
		reader.setInput(iis, false);
		ImageReadParam param = reader.getDefaultReadParam();
		Rectangle rect = new  Rectangle(20, 20, 160,160); 
		param.setSourceRegion(rect);
		BufferedImage bi = reader.read(0,param);
			           
		File file = new File(realPath);
		ImageIO.write(bi,"png",file);
	} catch (Exception e) {
		path = "error";
		e.printStackTrace();
	}		
	return path;
}

public static String createErWei_Tuiguang(String value,String user_id,int widthx,int heighty,String realPath){
	String path=user_id+".png";
	
	//判断文件是否存在   存在不继续生成
	File file_isExist=new File(realPath,path);   
	if(!file_isExist.exists()){  //文件不存在    
		System.out.println("----------文件不存在,生成新二维码-----------");
		File fileMl = new File(realPath); 
		if(!fileMl .exists()){   
	        fileMl.mkdirs();
		}
		try {
			Hashtable<EncodeHintType, String> hints= new Hashtable<EncodeHintType, String>();
			hints.put(EncodeHintType.CHARACTER_SET, "UTF-8");
			BitMatrix byteMatrix = new MultiFormatWriter().encode(value, BarcodeFormat.QR_CODE, widthx, heighty);
						   
			int BLACK = 0xff000000;
			int WHITE = 0xFFFFFFFF;
			int width = byteMatrix.getWidth();
			int height = byteMatrix.getHeight();
			BufferedImage image = new BufferedImage(width, height,BufferedImage.TYPE_INT_ARGB);
			for (int x = 0; x < width; x++) {
				for (int y = 0; y < height; y++) {
					image.setRGB(x, y, byteMatrix.get(x, y) ? BLACK : WHITE);
				}
			}
			Iterator<ImageReader> it = ImageIO.getImageReadersByFormatName("png");    
			ImageReader reader = it.next(); 
			ByteArrayOutputStream os = new ByteArrayOutputStream();
			ImageIO.write(image, "png", os);
			InputStream is = new ByteArrayInputStream(os.toByteArray());
			ImageInputStream iis  = ImageIO.createImageInputStream(is);
			reader.setInput(iis, false);
			ImageReadParam param = reader.getDefaultReadParam();
			Rectangle rect = new  Rectangle(20, 20, 160,160); 
			param.setSourceRegion(rect);
			BufferedImage bi = reader.read(0,param);
				           
			File file = new File(realPath,path);
			ImageIO.write(bi,"png",file);
		} catch (Exception e) {
			path = "error";
			e.printStackTrace();
		}		   
	}    
	return path;
}

}  