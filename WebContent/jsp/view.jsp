<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="bbs.Bbs"%>
<%@ page import="bbs.BbsDAO"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>ChungBuk University Major Books!</title>
<link href="../bootstrap/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="../bootstrap/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css">
<link href="../bootstrap/vendor/magnific-popup/magnific-popup.css" rel="stylesheet" type="text/css">
<link href="../bootstrap/css/freelancer.min.css" rel="stylesheet">
<link href="../bootstrap/css/api.css" rel="stylesheet">
</head>
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
					href="BookBuy.jsp">PURCHASE BOOKS</a></li>



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
	<%
		userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		int bbsID = 0;
		if (request.getParameter("bbsID") != null) {
			bbsID = Integer.parseInt(request.getParameter("bbsID"));
		}
		if (bbsID == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다.');");
			script.println("location.href = 'bbs.jsp'");
			script.println("</script>");
		}
		Bbs bbs = new BbsDAO().getBbs(bbsID);
	%>


	<style>
z
.table {
	text-align: center;
	border: 1px solid #ddd
}

.table th {
	background-color: #eee;
	text-align: center;
}

.table textarea {
	height: 350px;
}

123
.bbs_content {
	min-height: 200px;
	text-align: center;
}
</style>




	<style>
.table {
	text-align: center;
	border: 1px solid #ddd
}

.table th {
	background-color: #eee;
	text-align: center;
}

a, a:hover {
	color: #000;
	text-decoration: none;
}
</style>

  <style>
.table {text-align:center; border: 1px solid #ddd} 
.table th{background-color: #eee; text-align: center;}
.table textarea{height: 350px;}
</style>	
	<div class="container">
		<div class="row">
			<table class="table table-striped ">
				<thead>
					<tr>
						<th colspan="3">INFO</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>Title</td>
						<td colspan="2"><%=bbs.getBbsTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt").replaceAll(">", "&gt")
					.replaceAll("\n", "<br>")%></td>
					</tr>
					<tr>
						<td>Author</td>
						<td colspan="2"><%=bbs.getUserID()%></td>
					</tr>
					<tr>
						<td>Date</td>
						<td colspan="2"><%=bbs.getBbsDate().substring(0, 11) + bbs.getBbsDate().substring(11, 13) + ":"
					+ bbs.getBbsDate().substring(14, 16)%></td>
					</tr>
					<tr>
						<td>Content</td>
						<td colspan="2" class="bbs_content"><%=bbs.getBbsContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt").replaceAll(">", "&gt")
					.replaceAll("\n", "<br>")%></td>
					</tr>
				</tbody>
			</table>


		</div>

		<%
				System.out.println(userID);
				System.out.println(bbs.getUserID());
				if (userID != null && userID.equals(bbs.getUserID())) {
			%>

		<div class="row">
			<div class="col-lg-1"></div>

			<div class="col-lg-3">
				<a href="contactDev.jsp"
					class="btn btn-primary  btn-block btn-arrow-right">list</a>
			</div>
			<div class="col-lg-3">
				<a href="update.jsp?bbsID=<%=bbsID%>"
					class="btn btn-primary btn-block btn-arrow-right">update</a>
			</div>
			<div class="col-lg-3">
				<a onclick="return confirm('정말로 삭제하시겠습니까?')"
					href="deleteAction.jsp?bbsID=<%=bbsID%>"
					class="btn btn-primary  btn-block btn-arrow-right">delete</a>
			</div>

			<div class="col-lg-1"></div>
		</div>

		<%
				}
			%>

	</div>






	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>


	<div class="copyright py-4 text-center text-white">
		<div class="container">
			<small>Copyright &copy; CBNU MAJOR BOOKS 2018</small>
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
