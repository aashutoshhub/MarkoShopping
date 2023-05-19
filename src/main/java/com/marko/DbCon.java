package com.marko;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DbCon {
	
	private static String url="jdbc:mysql://localhost:3306/marko";
	private static String user="root";
	private static String pass="root";
	private static Connection con=null;
	
	public static Connection getConnection() {
      
		if(con==null) {

			try {
				
				Class.forName("com.mysql.cj.jdbc.Driver");
				
			    con =DriverManager.getConnection(url,user,pass);
			    
			    System.out.println("connected.........");
				
				
			} catch (Exception e) {
				e.getStackTrace();
			}
		}
		
		return con;
	}

}
