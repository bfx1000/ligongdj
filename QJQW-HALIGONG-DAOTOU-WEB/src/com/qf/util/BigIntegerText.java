package com.qf.util;

import java.math.BigInteger;

import com.qf.util.common.Tools;

public class BigIntegerText {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		RightsHelper ri=new RightsHelper();
		String i="1,2,10,11,12";
		BigInteger r=ri.sumRights(Tools.str2StrArray(i));
		 
		
	}
	

}
