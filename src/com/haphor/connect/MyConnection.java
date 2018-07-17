package com.haphor.connect;

import java.sql.Connection;
import java.sql.DriverManager;

public class MyConnection implements MyProvider {

	static Connection con =null;
	
	public static Connection getCon() {
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(url,username,password);
			
		}catch(Exception e) {
			
			
		}
		return con;
	}
	
}
