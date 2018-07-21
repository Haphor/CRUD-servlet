<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>MeysMook Sign In or Sign Up</title>


<%-- <jsp:include page="includes/cssincludes.jsp"></jsp:include> --%>

<link href="StylesAndScript4NAV/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="StylesAndScript4NAV/css/logo-nav.css" rel="stylesheet">


</head>
<body>
<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");// HTTP 1.1

response.setHeader("Pragma", "no-cache");// HTTP 1.0

response.setHeader("Expires", "0");//Proxies

if(request.getSession().getAttribute("LogUser")!=null){
	
	response.sendRedirect("Home");
}
%>
<header>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
      <div class="container">
        <a class="navbar-brand" href="#">
          <img src="http://placehold.it/300x60?text=Logo" width="150" height="30" alt="">
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item">
              <a class="nav-link" href="#" data-toggle="modal" data-target="#myModal">Sign In
                <!-- <span class="sr-only">(current)</span> -->
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#" data-toggle="modal" data-target="#myModal2">Sign Up</a>
            </li>
          </ul>
        </div>
      </div>
</nav>

</header>
<main>
<!-- Login And SignUp Modal - START -->
<jsp:include page="includes/SignUpIn.jsp"></jsp:include>
<jsp:include page='includes/messageModal.jsp'></jsp:include>
<h1 align="center" style="padding-top:300px;"><small>Welcome to </small>MeysMook</h1>
</main>

<footer>
<jsp:include page="includes/footer.jsp"></jsp:include>

</footer>
<script src="StylesAndScript4NAV/vendor/jquery/jquery.min.js"></script>
<script src="StylesAndScript4NAV/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<script type="text/javascript" src="StylesAndScript4LogModal/js/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="StylesAndScript4LogModal/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>