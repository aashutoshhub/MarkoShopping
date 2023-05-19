package com.login;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.login.dao.LoginDao;

@WebServlet("/login")
public class Login extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String username =request.getParameter("username");
		String password =request.getParameter("password");
		
		System.out.println(username);
		
		HttpSession session=request.getSession();
		
		LoginDao dao=new LoginDao();
		if(dao.check(username, password)) {
			
			
			session.setAttribute("username", username);
			session.setAttribute("password", password);
			response.sendRedirect("order.jsp");
		}
		
	
		
		/* response.sendRedirect("login.jsp"); */
		
		
	}

}
