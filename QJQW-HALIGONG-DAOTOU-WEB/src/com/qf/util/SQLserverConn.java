package com.qf.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;


public class SQLserverConn {
	
	public static Statement getSQLserverCon(){
		Connection dbConn = null;
		Statement stmt = null;
		try {
			//建立数据库连接
			String driverName = "com.microsoft.sqlserver.jdbc.SQLServerDriver";  //加载JDBC驱动
			String dbURL = "jdbc:sqlserver://192.168.1.133:1433; databaseName=qjqw";  //连接服务器和数据库test
//			String dbURL = "jdbc:sqlserver://127.0.0.1:1433; databaseName=qjqw";  //连接服务器和数据库test
			String userName = "sa";  //默认用户名
			String userPwd = "sa";  //密码
			Class.forName(driverName);			
			dbConn = DriverManager.getConnection(dbURL, userName, userPwd);
			if(dbConn!=null){
				stmt=dbConn.createStatement ();
			}	
		} catch (Exception e) {
			e.printStackTrace();
		}
		return stmt;
	}
	
	
}
