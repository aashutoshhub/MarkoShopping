<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<jsp:include page="/WEB-INF/include/header.jsp" />
</head>
<body>

 <jsp:include page="/WEB-INF/include/navbar.jsp" />
 
 
order page


<%

   // to distable back button functionality
   response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");  // HTTP 1.1
   
 //for lower HTTP 
   response.setHeader("Pragma", "no-cache"); //HTTP 1.0
  		
  // for proxies 
  response.setHeader("Expires","0");
   

  if(session.getAttribute("username") == null){
	  response.sendRedirect("login.jsp");
  }
%>

Welcome, ${username}  <br/>









<jsp:include page="/WEB-INF/include/footer.jsp" />
</body>
</html>