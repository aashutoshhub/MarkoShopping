<style>
    .navbar-custom {
        background-color: #FFD700; /* Dark Yellow color */
    }

    .navbar-custom .nav-link {
        color: #333; /* Dark gray color */
        font-weight: bold;
    }

    .navbar-custom .nav-link:hover,
    .navbar-custom .nav-link:focus {
        color: #555; /* Slightly darker gray color on hover/focus */
    }

    .navbar-custom .active {
        color: #000; /* Black color for active link */
    }
</style>







<nav class="navbar navbar-expand-lg navbar-dark navbar-custom">
    <div class="container">
        <a class="navbar-brand" href="index.jsp">MARKO Shopping</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link" href="index.jsp">Home</a>
                </li>
                <!-- Other navbar items -->
              
                <!-- Other navbar items -->
                <li class="nav-item">
                    <a class="nav-link" href="order.jsp">Orders</a>
                </li>
                <!-- Other navbar items -->
                <li class="nav-item">
                    <a class="nav-link" href="cart.jsp">
                        <i class="fas fa-shopping-cart"></i>
                        Cart <span class="badge badge-primary">2</span>
                    </a>
                </li>
                <!-- Other navbar items -->
                <li class="nav-item">
                    <a class="nav-link" href="#">Contact</a>
                </li>
                
                <%
    if (session.getAttribute("username") != null) {
%>
    <li class="nav-item">
        <form action="logout" method="post">
          <button type="submit" class="nav-link" >Logout</button>
        </form>
    </li>
<%
    } else {
%>
    <li class="nav-item">
        <a class="nav-link" href="login.jsp">Login</a>
    </li>
<%
    }
%>
                
                
               
            </ul>
        </div>
    </div>
</nav>

<script>
    // Get the current URL
    var currentUrl = window.location.href;

    // Get all the navbar links
    var navLinks = document.querySelectorAll('.navbar-nav .nav-link');

    // Loop through each navbar link
    navLinks.forEach(function (link) {
        // Check if the link's href matches the current URL
        if (link.href === currentUrl) {
            // Add the active class to the matching link
            link.classList.add('active');
        }
    });
</script>
