package com.bdi.test.common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBCon {
	private final static String URL;
	private final static String ID;
	private final static String PWD;
	private final static String DRIVER;
	
	static {
	URL= "jdbc:oracle:thin:@localhost:1521:xe";
	DRIVER="oracle.jdbc.driver.OracleDriver";
	ID= "bdi";
	PWD= "12345678";
	try {
		Class.forName(DRIVER);
	}catch(ClassNotFoundException e){
		e.printStackTrace();
	}
	}
	private static Connection con;
	
	public static Connection getCon() {
		if(con==null) {
			try {
				con=DriverManager.getConnection(URL,ID,PWD);
			} catch (SQLException e) {
				e.printStackTrace();
			}	
		}
		return con;
	}
}
