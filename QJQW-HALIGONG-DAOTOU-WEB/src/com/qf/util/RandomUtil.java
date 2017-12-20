package com.qf.util;

import java.util.Random;

public class RandomUtil {
	 //生成8位随机数     首位现阶段为1
	 public static String getRandom8() {
		 Random r = new Random();
		 String a = "1";
		 for(int i=0;i<7;i++){
			 int b =  r.nextInt(10) ;
			 a += b+"" ;
		 }
		  
		 return a ;
   }
	 
	//生成6位随机数   密码
	 public static String getRandom6() {
		 Random r = new Random();
		 String a = "";
		 for(int i=0;i<6;i++){
			 int b =  r.nextInt(10) ;
			 a += b+"" ;
		 }
		  
		 return a ;
   }
	 
	 public static void main(String[] args) {
		 System.out.println(getRandom6());
	}
}
