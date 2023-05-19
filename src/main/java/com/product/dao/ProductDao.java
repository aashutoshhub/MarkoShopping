package com.product.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.marko.model.Cart;
import com.mysql.cj.protocol.Resultset;
import com.product.Products;

public class ProductDao {
	
	private Connection con;
	private String query;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public ProductDao(Connection con) {
		this.con = con;
	}
	
	public List<Products> getAllProducts(){
		
		List<Products> product=new ArrayList<>();
		
		try {
			query="select * from Products";
			ps=this.con.prepareStatement(query);
			rs=ps.executeQuery();
			
			while(rs.next()) {
				Products prod=new Products();
				prod.setId(rs.getInt("id"));
				prod.setName(rs.getString("name"));
				prod.setPrice(rs.getInt("price"));
				prod.setDesc(rs.getString("des"));
				prod.setImage(rs.getString("image"));
				
				product.add(prod);
			}
			
		} catch (Exception e) {
			e.getStackTrace();
		}
		
		return product;
	}
	
	
	public List<Cart> getCartProducts(ArrayList<Cart> cart){
		
		List<Cart> cartItems=new ArrayList<>();
		
		try {
			if(cart.size()>0) {
				for(Cart items:cart) {
					query="select * from Products where id=?";
					ps=this.con.prepareStatement(query);
					ps.setInt(1, items.getId());
					rs=ps.executeQuery();
					while(rs.next()) {
						Cart ct=new Cart();
						ct.setId(rs.getInt("id"));
						ct.setPrice(rs.getInt("price")*items.getQuantity());
						ct.setDesc(rs.getString("des"));
						ct.setName(rs.getString("name"));
						ct.setImage(rs.getString("image"));
						ct.setQuantity(items.getQuantity());
						
						cartItems.add(ct);
					}
					
				}
			}
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.getStackTrace();
		}
		
		return cartItems;
	}

}
