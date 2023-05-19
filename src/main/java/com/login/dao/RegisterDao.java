package com.login.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;




public class RegisterDao {
	
	String url="jdbc:mysql://localhost:3306/marko";
	String user="root";
	String pass="root";
	
	public boolean registerUser(String username,String email,String password) {
		//System.out.println("username in dao class : " +username);
		
		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			Connection con =DriverManager.getConnection(url,user,pass);
			
			String query="insert into Register(username,email,password) values (?,?,?);";
			
			PreparedStatement pt =con.prepareStatement(query);
			pt.setString(1, username);
			pt.setString(2, email);
			pt.setString(3, password);
			
		   int rowAffected=pt.executeUpdate();
			
		    if(rowAffected>0) {
		    	return true;
		    }
		    
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return false;
		
	}

}
