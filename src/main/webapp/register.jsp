<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<jsp:include page="/WEB-INF/include/header.jsp" />

 <style>
        body {
            background-color: #f8f9fa;
        }

        .register-form {
            width: 360px;
            margin: 0 auto;
            margin-top: 100px;
            background: #fff;
            padding: 25px;
            border-radius: 5px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }

        .register-form h1 {
            font-size: 24px;
            text-align: center;
            margin-bottom: 25px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            font-weight: bold;
        }

        .form-group input {
            width: 100%;
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 3px;
        }

        .form-group input:focus {
            outline: none;
            box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.1);
            border-color: #6c757d;
        }

        .form-group .btn-primary {
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            border-color: #007bff;
        }

        .form-group .btn-primary:hover {
            background-color: #0069d9;
            border-color: #0062cc;
        }
         .login-link {
            text-align: center;
            margin-top: 20px;
        }
    </style>

</head>
<body>
 <jsp:include page="/WEB-INF/include/navbar.jsp" />
 


   <div class="container">
        <div class="register-form">
            <h1>Register</h1>
            <form action="registration" method="POST">
                <div class="form-group">
                    <label for="username">Username:</label>
                    <input type="text" class="form-control" id="username" name="username" required>
                </div>
                <div class="form-group">
                    <label for="password">Password:</label>
                    <input type="password" class="form-control" id="password" name="password" required>
                </div>
                <div class="form-group">
                    <label for="email">Email:</label>
                    <input type="email" class="form-control" id="email" name="email" required>
                </div>
                <div class="form-group">
                    <button type="submit" class="btn btn-primary">Register</button>
                </div>
            </form>
            
            <div class="login-link">
                <p>Already have an account? <a href="login.jsp">Login</a></p>
            </div>
            
        </div>
    </div>


<jsp:include page="/WEB-INF/include/footer.jsp" />
</body>
</html>