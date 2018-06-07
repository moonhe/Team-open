<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <%@ page import="crawling.chromeDriver" %> --%>
<%@ page import="user.UserDAO"%>
<!-- Database Access Object가 필요 -->
<jsp:useBean id="dri" class="crawling.chromeDriver" scope="page" />
<%@ page import="org.openqa.selenium.chrome.ChromeDriver"%>
<!-- Database Access Object가 필요 -->
<%@ page import="org.openqa.selenium.WebDriver"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>ChungBuk University Major Books!</title>
<link href="../bootstrap/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="../bootstrap/vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic"
	rel="stylesheet" type="text/css">
<link href="../bootstrap/vendor/magnific-popup/magnific-popup.css"
	rel="stylesheet" type="text/css">
<link href="../bootstrap/css/freelancer.min.css" rel="stylesheet">

<style>
h6 {
	display: block;
	font-size: 1em;
	margin-top: 0.5em;
	margin-bottom: 0.5em;
	margin-left: 0;
	margin-right: 0;
	font-weight: bold;
}

h5 {
	display: block;
	font-size: 1.4em;
	margin-top: 0.3em;
	margin-bottom: 0.3em;
	margin-left: 0;
	margin-right: 0;
	font-weight: bold;
}
</style>


<script>
	function resizeIframe(obj) {
		obj.style.height = obj.contentWindow.document.body.scrollHeight + 'px';
	}
</script>


</head>
<body id="page-top">

	<style>
body {
	background-color: #f4fff4;
}
</style>



	<%
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		int pageNumber = 1; // 기본 페이지는 1페이지
		if (request.getParameter("pageNumber") != null) {
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
	%>


	<!-- Navigation -->

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
					href="#">SEARCH BOOKS</a></li>
				<li class="nav-item mx-0 mx-lg-1"><a
					class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger"
					href="BookBuy.jsp">BUY BOOKS</a></li>


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

	<br>
	<br>
	<br>




	<script>
		function send() {
			form = document.BookSearch;
			form.target = "iframe"
			form.submit();
			alert("보내졌습니다.");
		}
	</script>



	<br>
	<form method="post" name='BookSearch' action="BookSearchAction.jsp">
		<section class="portfolio bg-third ">

		<div class="col-md-11">
			<img class="img-fluid mb-5 d-block mx-auto"
				src="../bootstrap/img/notebook.png" alt="">
			<h2 class="text-uppercase mb-0 text-center">SEARCH BOOKS</h2>
			<hr width="800px">
			<div class="row">

				<div class="col-md-2"></div>
				<div class="col-md-10">

					<div class="row">
						<div class="col-md-1">
							<h5>ID</h5>
						</div>
						<div class="col-md-5">
							<input type="text" name="id" class="form-control"
								placeholder="STUDENT ID" />
						</div>
			 		<div class="col-md-4">
							<div class="col-lg-7 col-sm-8">
								<select class="form-control" id="exampleSelect1" name="people">
									<option>2018 1학기</option>
									<option>2017 2학기</option>
									<option>6</option>
									<option>7</option>
								</select>
							</div>
						</div> 
					</div>
					<br>


					<div class="row">
						<div class="col-md-1 col-sm">
							<h5>PWD</h5>
						</div>
						<div class="col-md-5">
							<input type="password" name="pwd" class="form-control"
								placeholder="**********" />
						</div>
						<div class="col-md-4">
							<input type="button" class="btn btn-primary btn-block"
								value="send" onclick="send();" />
						</div>


						<hr>
					</div>

					<br>
					<div class="row">
						<div class="col-md-10" style='width: 100%' height="300">
							<iframe id="iframe" src="/jsp/booksImage.jsp" style='width: 100%'
								frameborder="0" scrolling="yes" onload="resizeIframe(this)"></iframe>
						</div>
					</div>
				</div>
				<div class="col-md-6"></div>
			</div>
		</div>
		</section>
	</form>



	<div class="copyright py-4 text-center text-white">
		<div class="container">
			<small>Copyright &copy; Your Website 2018</small>
		</div>
	</div>




	<script src="../bootstrap/vendor/jquery/jquery.min.js"></script>
	<script src="../bootstrap/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="../bootstrap/vendor/jquery-easing/jquery.easing.min.js"></script>
	<script
		src="../bootstrap/vendor/magnific-popup/jquery.magnific-popup.min.js"></script>
	<script src="../ootstrap/js/jqBootstrapValidation.js"></script>
	<script src="../bootstrap/js/contact_me.js"></script>
	<script src="../bootstrap/js/freelancer.min.js"></script>

</body>
</html>