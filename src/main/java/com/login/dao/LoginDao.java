package com.login.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.mysql.cj.protocol.Resultset;

public class LoginDao {
	
	String url="jdbc:mysql://localhost:3306/marko";
	String user="root";
	String pass="root";
	
	public boolean check(String username,String password) {
		
		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			Connection con =DriverManager.getConnection(url,user,pass);
			
			String query="select * from Register where username=? and password=?";
			
			PreparedStatement pt =con.prepareStatement(query);
			pt.setString(1, username);
			pt.setString(2, password);
			
		    ResultSet rs=pt.executeQuery();
			
		    
		    if(rs.next()) {
		    	System.out.println("----------login successfull------------");
		    	return true;
		    }	
			
		} catch (Exception e) {
			e.getStackTrace();
		}
		
		return false;
	}

}
