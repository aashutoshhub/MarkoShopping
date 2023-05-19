<%@page import="com.marko.DbCon"%>
<%@page import="com.product.dao.ProductDao"%>
<%@page import="java.util.List"%>
<%@page import="com.marko.model.Cart"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="com.product.*"%>



          





<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Cart</title>
    <jsp:include page="/WEB-INF/include/header.jsp" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
          integrity="sha384-pzjw8f+ua9nlsdxcqfq4ms61twwib8ejxbhql9jrhem+n9w8g+jj9q+n0fnjwz+"
          crossorigin="anonymous">
    <style>
        .container {
            max-width: 800px;
        }

        .cart-table {
            width: 100%;
            border-collapse: collapse;
        }

        .cart-table th,
        .cart-table td {
            padding: 10px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }

        .cart-table th {
            background-color: #f8f9fa;
            font-weight: bold;
        }

        .cart-table td:last-child {
            white-space: nowrap;
        }

        .total-row td {
            font-weight: bold;
        }

        .btn-remove {
            color: #dc3545;
            border: none;
            background: none;
            cursor: pointer;
        }

        .btn-remove:hover {
            text-decoration: underline;
        }

        .quantity-input {
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .btn-quantity {
            width: 30px;
            padding: 0;
        }

        .quantity-value {
            margin: 0 10px;
            font-weight: bold;
        }

        .btn-checkout {
            width: 50%;
        }
           .button-custom {
        background-color: #FFD700; 
    }
    </style>
</head>
<body>
<jsp:include page="/WEB-INF/include/navbar.jsp" />

<%
   // to disable back button functionality
   response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");  // HTTP 1.1
   
   // for lower HTTP 
   response.setHeader("Pragma", "no-cache"); // HTTP 1.0
  		
   // for proxies 
   response.setHeader("Expires", "0");
   
   if(session.getAttribute("username") == null){
       response.sendRedirect("login.jsp");
   }
%>


  
            <%
            
            ArrayList<Cart> cart_list=( ArrayList<Cart>) session.getAttribute("cart-list");
            
           // out.println(cart_list);
            
            List<Cart> cartProduct=null;
            
            if(cart_list != null){
            	ProductDao prd=new ProductDao(DbCon.getConnection());
            	cartProduct=prd.getCartProducts(cart_list);
            	request.setAttribute("cart_list", cart_list);
            	// out.println(cartProduct);
            	 //System.out.println(prd.getCartProducts(cart_list));
            }
            
            %>




<!-- Cart Page Design -->
<div class="container mt-4">
    <h2 class="text-center">Cart</h2>
    <table class="cart-table">
        <thead>
            <tr>
                <th>Product</th>
                <th>Price</th>
                <th>Quantity</th>
                <th>Total</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <!-- Display cart items here -->

            
            <%
            
           
            
              if(cart_list != null){
            	  for(Cart c:cartProduct ){ %>
                <tr>
                    <td><%= c.getName() %></td>
                    <td><%= c.getPrice() %></td> 
                    <td>
                        <div class="quantity-input">
                            <button class="btn btn-quantity btn-outline-secondary" onclick="decrementQuantity(this)">-</button>
                            <span class="quantity-value">
                              <%
                                 int quantity = c.getQuantity();             
                              %>
                              
                               <%= quantity %>
                              
                            </span>
                            <button class="btn btn-quantity btn-outline-secondary" onclick="incrementQuantity(this)">+</button>
                        </div>
                    </td>
                    <td><%= c.getQuantity()*c.getPrice() %></td>
                    <td>
                        <button class="btn btn-remove" onclick="removeItem(this)">Remove</button>
                    </td>
                </tr>
            	 <% }
                 } 
            %>
            
     
            	
            
            
        
            
            
         
        </tbody>
        <tfoot>
            <tr class="total-row">
                <td colspan="3" class="text-right"><strong>Total:</strong></td>
                <td>480</td>
                <td></td>
            </tr>
            <tr>
                <td colspan="5" class="text-right">
                    <button class="btn button-custom btn-checkout">Checkout</button>
                </td>
            </tr>
        </tfoot>
    </table>
</div>

<script>
    function removeItem(button) {
        var row = button.closest("tr");
        row.remove();
    }

    function incrementQuantity(button) {
        var quantityValue = button.parentNode.querySelector(".quantity-value");
        var quantity = parseInt(quantityValue.textContent);
        quantity++;
        quantityValue.textContent = quantity;
        
    }

    function decrementQuantity(button) {
        var quantityValue = button.parentNode.querySelector(".quantity-value");
        var quantity = parseInt(quantityValue.textContent);
        if (quantity > 1) {
            quantity--;
            quantityValue.textContent = quantity;
        }
    }
</script>

</body>
</html>
