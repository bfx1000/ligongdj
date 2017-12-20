package com.qf.util.qrcode;

import java.io.File; 
import java.util.HashMap;
import java.util.Hashtable; 
import java.util.Map;
   
import com.google.zxing.BarcodeFormat; 
import com.google.zxing.EncodeHintType; 
import com.google.zxing.MultiFormatWriter; 
import com.google.zxing.common.BitMatrix; 
   
public class test { 
   
    /**
     * @param args
     * @throws Exception 
     */ 
    public static void main(String[] args) throws Exception { 
    	System.out.println("111111");
//        String text = "http://www.baidu.com"; 
//        int width = 300; 
//        int height = 300; 
//        //二维码的图片格式 
//        String format = "gif"; 
//        Hashtable hints = new Hashtable(); 
//        //内容所使用编码 
//        hints.put(EncodeHintType.CHARACTER_SET, "utf-8"); 
//        BitMatrix bitMatrix = new MultiFormatWriter().encode(text, 
//                BarcodeFormat.QR_CODE, width, height, hints); 
//        //生成二维码 
//        File outputFile = new File("d:"+File.separator+"new.gif"); 
//        MatrixToImageWriter.writeToFile(bitMatrix, format, outputFile); 
    	try {
    		 System.out.println("ggggggggggggg");
    	     String content = "120605181003;http://www.cnblogs.com/jtmjx";
    	     String path = "C:/Users/Administrator/Desktop/testImage";
    	     MultiFormatWriter multiFormatWriter = new MultiFormatWriter();
    	     Map hints = new HashMap();
    	     hints.put(EncodeHintType.CHARACTER_SET, "UTF-8");
    	     BitMatrix bitMatrix = multiFormatWriter.encode(content, BarcodeFormat.QR_CODE, 400, 400,hints);
    	     File file1 = new File(path,"餐巾纸.jpg");
    	     MatrixToImageWriter.writeToFile(bitMatrix, "jpg", file1);
    	     System.out.println("hhhhhhhhhhhhhhhh");
    	 } catch (Exception e) {
    	     e.printStackTrace();
    	 }
   
    } 
   
}
