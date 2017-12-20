package com.qf.util.aes;

import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;


public class AES {

	public static String encrypt(String cleartext) throws Exception {
		SecretKeySpec keySpec = new SecretKeySpec(Constants.Aes_Key.getBytes(), "AES");
		// IvParameterSpec ivSpec = new IvParameterSpec(iv.getBytes());
		// ECB模式不需要传入IV
		Cipher ecipher = Cipher.getInstance("AES/ECB/PKCS5Padding");
		ecipher.init(Cipher.ENCRYPT_MODE, keySpec);
		return Base64.encodeBytes(ecipher.doFinal(cleartext.getBytes("UTF-8")));
	}

	public static String decrypt(String encrypted) throws Exception {
		SecretKeySpec keySpec = new SecretKeySpec(Constants.Aes_Key.getBytes(), "AES");
		// IvParameterSpec ivSpec = new IvParameterSpec(iv.getBytes());
		// ECB模式不需要传入IV
		Cipher ecipher = Cipher.getInstance("AES/ECB/PKCS5Padding");
		ecipher.init(Cipher.DECRYPT_MODE, keySpec);
		return new String(ecipher.doFinal(Base64.decode(encrypted)),"UTF-8");
	}

}