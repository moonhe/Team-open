<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>ChungBuk University Major Books!</title>
<link href="bootstrap/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="bootstrap/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css">
<link href="bootstrap/vendor/magnific-popup/magnific-popup.css" rel="stylesheet" type="text/css">
<link href="bootstrap/css/freelancer.min.css" rel="stylesheet">

</head>
<body id="page-top">
	<%
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		
	 %>

	
	<nav
		class="navbar navbar-expand-lg bg-secondary fixed-top text-uppercase"
		id="mainNav">
	<div class="container">
		<a class="navbar-brand js-scroll-trigger" href="/">CBNU Major
			Books!</a>
		<button
			class="navbar-toggler navbar-toggler-right text-uppercase bg-primary text-white rounded"
			type="button" data-toggle="collapse" data-target="#navbarResponsive"
			aria-controls="navbarResponsive" aria-expanded="false"
			aria-label="Toggle navigation">
			Menu <i class="fa fa-bars"></i>
		</button>
		<div class="collapse navbar-collapse" id="navbarResponsive">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item mx-0 mx-lg-1"><a
					class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger"
					href="/jsp/BookSearch.jsp">SEARCH BOOKS</a></li>
				<li class="nav-item mx-0 mx-lg-1"><a
					class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger"
					href="/jsp/BookBuy.jsp">BUY BOOKS</a></li>


				<%
					if (userID == null) {
				%>
				<li class="nav-item mx-0 mx-lg-1"><a
					class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger"
					href="/jsp/login.jsp">LOGIN</a></li>
				<%
					} else {
				%>
				<li class="nav-item mx-0 mx-lg-1"><a
					class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger"
					href="/jsp/logoutAction.jsp">LOGOUT</a></li>
				<%
					}
				%>
				<li class="nav-item mx-0 mx-lg-1"><a
					class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger"
					href="contactDev.jsp">CONTACT DEVELOPER</a></li>
			</ul>
		</div>
	</div>
	</nav>

	<!-- Header -->
	<header class="masthead bg-primary text-white text-center">
	<div class="container">
		<img class="img-fluid mb-5 d-block mx-auto" src="bootstrap/img/profile.png"
			alt="">
		<h1 class="text-uppercase mb-0">전공책 다나와!</h1>
		<hr class="star-light">
		<h2 class="font-weight-light mb-0">번거롭지 않게 한 번에 찾아보세요</h2>
	</div>
	</header>
	
	
	<script src="bootstrap/vendor/jquery/jquery.min.js"></script>
	<script src="bootstrap/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="bootstrap/vendor/jquery-easing/jquery.easing.min.js"></script>
	<script src="bootstrap/vendor/magnific-popup/jquery.magnific-popup.min.js"></script>
	<script src="bootstrap/js/jqBootstrapValidation.js"></script>
	<script src="bootstrap/js/contact_me.js"></script>
	<script src="bootstrap/js/freelancer.min.js"></script>

</body>
</html>