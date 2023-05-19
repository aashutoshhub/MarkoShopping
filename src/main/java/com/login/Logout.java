package com.login;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;


@WebServlet("/logout")
public class Logout extends HttpServlet {
	
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
		HttpSession session =request.getSession();
		
		if(session.getAttribute("username")!=null) {
			session.removeAttribute("username");
			session.invalidate(); //remove all the data
			 response.sendRedirect("login.jsp"); 
		}else {
			response.sendRedirect("index.jsp"); 
		}
	}

}
