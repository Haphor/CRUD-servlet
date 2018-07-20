<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Welcome ${LogUser}</title>


<%-- <jsp:include page="includes/cssincludes4welcome.jsp"></jsp:include> --%>
<link href="../StylesAndScript4NAV/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="../StylesAndScript4NAV/css/logo-nav.css" rel="stylesheet">
<link rel="stylesheet" href="../css/Footer-with-social-icons.css">
<link rel="stylesheet" href="../css/content.css">
</head>
<body>
<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");// HTTP 1.1

response.setHeader("Pragma", "no-cache");// HTTP 1.0

response.setHeader("Expires", "0");//Proxies

if(request.getSession().getAttribute("LogUser")==null){
	
	response.sendRedirect(request.getContextPath());
}


%>
<style>
.pointer{
	
	cursor: pointer;
	
}


</style>
<script>
function addlines()
{
	text = document.getElementById('mytext').value;
	text = text.replace(/  /g,"&nbsp");
	text = text.replace(/\n/g, "<br>");
	document.getElementById('mytext').value = text;
	
}

</script>

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
              <a class="nav-link pointer" id="home">Home
                <!-- <span class="sr-only">(current)</span> -->
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link pointer" id="profile">Profile</a>
            </li>
          </ul>
        </div>
      </div>
</nav>


</header>
<main>
<div id="content">
<div class="main">
  	<h2>News Feed</h2>
  	<div class="postarea">
  		<form action="../posting" method="post" onsubmit="addlines()">
  			<table>
  				<tr>
  					<td>
					  	<div id="image">
					  	<img alt="User Pic" src="${pageContext.request.contextPath}/displayImage" width="80px" height="80px"class="img-circle img-responsive"> 
					  	</div>
				  	</td>
				  	<td>
					  	<textarea id="mytext" name="mypost" required placeholder="What's on your mind? ${LogUser}"></textarea>
					</td>
					<td>
					<input id="postbtn" type="submit" value="Post"/>
					</td>
				</tr>
			</table>
	  	</form> 
  	</div>
  	<div class="feeds">
  		<c:forEach items="${allpost}" var="posts">
  			<div>
  				<h4>${posts.fullname}</h4>
  				<p id="myconts">${posts.content}</p>
  				<small>${posts.date}</small>
  				<c:if test="${posts.userid==LogId}">
  				<a href="../deletePost?curpost=${posts.postid}"class="deletebtn pointer">Delete</a>
  				</c:if>
  			</div>
  		</c:forEach>
  	</div>
</div>
</div>
</main>
<footer>
<jsp:include page="../pages/includes/footer.jsp"></jsp:include>
</footer>
<script src="../StylesAndScript4NAV/vendor/jquery/jquery.min.js"></script>
<script src="../StylesAndScript4NAV/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="../js/jquery-3.3.1.min.js"></script>
<script>
$(document).ready(function(){
	 $('#home').click(function(){
		 location.reload();
		
	});
	 
	$('#profile').click(function(){
		$('#content').load('../pages/includes/profile.jsp');
		
	});
});



</script>
</body>
</html>