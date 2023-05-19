package com.login;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.login.dao.RegisterDao;

@WebServlet("/registration")
public class Register extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String username =request.getParameter("username");
		String email =request.getParameter("email");
		String password =request.getParameter("password");
		
		//System.out.println(username);
		
		RegisterDao dao = new RegisterDao();
		if(dao.registerUser(username, email, password)) {
			request.getSession().setAttribute("registrationSuccess", true);
			response.sendRedirect("login.jsp");
		}
		
		
	}

}
