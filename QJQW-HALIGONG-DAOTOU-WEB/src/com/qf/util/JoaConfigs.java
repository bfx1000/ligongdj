package com.qf.util;

import java.io.InputStream;
import java.util.Properties;

public class JoaConfigs {

	static private String ipPath = null;   //获取配置文件中ip地址
	
	static {
		loads();
	}

	synchronized static public void loads() {
		if (ipPath == null) {
			InputStream is = JoaConfigs.class.getResourceAsStream("/config.properties");
			Properties dbProps = new Properties();
			try {
				dbProps.load(is);
				ipPath = dbProps.getProperty("ipPath");
			} catch (Exception e) {
				System.err.println("不能读取属性文件. "  + "请确保joa.properties在CLASSPATH指定的路径中");
			}
		}
	}

	public static String getIpFromProperties() {
		if (ipPath == null)
			loads();
		return ipPath;
	}
}