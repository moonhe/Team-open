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
<link href="../bootstrap/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="../bootstrap/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css">
<link href="../bootstrap/vendor/magnific-popup/magnific-popup.css" rel="stylesheet" type="text/css">
<link href="../bootstrap/css/freelancer.css" rel="stylesheet">
<link href="../bootstrap/css/api.css" rel="stylesheet">

</head>
 <body id="page-top">

	<style>
body {
	background-color: #f4fff4;
}
</style>

    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg bg-secondary fixed-top text-uppercase" id="mainNav">
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
					href="/jsp/BookBuy.jsp">PURCHASE BOOKS</a></li>

				<li class="nav-item mx-0 mx-lg-1"><a
					class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger"
					href="/jsp/login.jsp">LOGIN</a></li>
					
				<li class="nav-item mx-0 mx-lg-1"><a
					class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger"
					href="contactDev.jsp">CONTACT DEVELOPER</a></li>
			</ul>
		</div>
	</div>
    </nav>
    
    <br><br><br><br><br><br>
    
    
	<div class="container">
		<div class="col lg-4"></div>
		<div class="col lg-4">
			<div class="jumbotron" style="padding-top:20px">
				<form method="post" action="loginAction.jsp">
					<h3 style="text-align:center">SIGN IN</h3>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="ID" name="userID" maxlength="20"/>
					</div>
					<div class="form-group">
						<input type="password" class="form-control" placeholder="PASSWORD" name="userPassword" maxlength="20" />
					</div>
					<input type="submit" class="btn btn-primary form-control" value="LOGIN" />	
					
				</form>
				<br>
					Aren't you a member yet? <a href="join.jsp">SIGN UP</a>
			</div>
		</div>
	</div>
	
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	
	<div class="copyright py-4 text-center text-white">
		<div class="container">
			<small>Copyright &copy; CBNU MAJOR BOOKS 2018</small>
		</div>
	</div>
	
</body>
</html>
