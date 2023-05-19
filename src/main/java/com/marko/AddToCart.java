package com.marko;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import com.marko.model.Cart;


@WebServlet("/addtocart")
public class AddToCart extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html;charset=UTF-8");
		
		try (PrintWriter out=response.getWriter()){
			
			ArrayList<Cart> cartitems=new ArrayList<>();
			
			int id=Integer.parseInt(request.getParameter("id"));
			
			Cart cm=new Cart();
			cm.setId(id);
			cm.setQuantity(1);
			
			HttpSession session =request.getSession();
			ArrayList<Cart> cart_list=(ArrayList<Cart>) session.getAttribute("cart-list");
			
			if(cart_list==null) {
				cartitems.add(cm);
				session.setAttribute("cart-list", cartitems);
				response.sendRedirect("index.jsp");
			}else {
					out.println("cart list exits............");
					cartitems=cart_list;
					
					boolean exits=false;
					
					for(Cart c:cart_list) {
						if(c.getId()==id) {
							exits=true;
							out.println("<h1 style='color:crimson;text-align:center' >item already exits in cart..........</h1>");
						}
					}
					
					if(!exits) {
						cartitems.add(cm);
						response.sendRedirect("index.jsp");
					}
					
			}
			
			
			for(Cart c:cartitems) {
				out.println(c.getId());
			}
			
			
			 //session.setAttribute("cartList", cart_list);
			 
			 //response.sendRedirect("cart.jsp");
			
			
			
			
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
