<%@page import="com.product.*"%>
<%@page import="com.marko.DbCon"%>
<%@page import="com.product.dao.ProductDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>WelCome to Marko Shopping</title>

<jsp:include page="/WEB-INF/include/header.jsp" />



  <style>
        /* Custom styles for product cards */
        .product-card {
            background-color: #f0eee4;
            padding: 20px;
            margin: 10px;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
        }

       .product-card img {
            width: 100%;
            max-height: 200px;
        }
        
          .button-custom {
        background-color: #FFD700; 
    }
    
            .heading-container {
            background-color: #f8f9fa;
            padding: 40px 0;
            text-align: center;
        }

        .heading-container h2 {
            font-size: 32px;
            font-weight: bold;
            margin-bottom: 20px;
        }
        
    </style>
    
    

</head>
<body>

 <jsp:include page="/WEB-INF/include/navbar.jsp" />


<!-- Heading for all Products -->
<div class="container mt-4 heading-container">
    <h2 class="text-center">All Products</h2>
</div>



<%
 
 ProductDao pd=new ProductDao(DbCon.getConnection());
		
 List<Products> products=pd.getAllProducts();

%>


<!-- Show all products here -->
<div class="container">
    <div class="row">
    
     <%
        if(!products.isEmpty()){
        	for( Products p:products ){ %>
        		  
       <div class="col-md-4">
            <div class="product-card">
                <img src="product_image/<%= p.getImage() %>" alt="Product 2">
                <h5><%= p.getName() %></h5>
                <p><%= p.getDesc() %></p>
                <p> Price: <%= p.getPrice() %></p>
                <a href="addtocart?id=<%= p.getId() %>" class="btn button-custom"> Add to Cart</a>
               
               <!--  <button class="btn button-custom">Buy Now</button> -->
            </div>
        </div>
        		  
       <% }	
        }
     %>
    
        
       
    </div>
</div>




<jsp:include page="/WEB-INF/include/footer.jsp" />
</body>
</html>