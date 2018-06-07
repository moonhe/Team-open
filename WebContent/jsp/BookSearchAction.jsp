<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO"%>
<!-- Database Access Object가 필요 -->
<!-- Database Access Object가 필요 -->
<jsp:useBean id="crawler" class="crawling.chromeDriver" scope="page" />
<%@ page import="org.openqa.selenium.chrome.ChromeDriver"%>
<!-- Database Access Object가 필요 -->
<%@ page import="org.openqa.selenium.WebDriver"%>
<%@ page errorPage="Error.jsp"%>

<jsp:useBean id="crawl" class="crawling.chromeDriver" scope="page" />
<jsp:setProperty name="crawl" property="id" />
<jsp:setProperty name="crawl" property="pwd" />
<!-- 자바스크립트 사용하기 위해 필요 -->

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

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


</head>
<body>
	<style>
body {
}
</style>
	<%
	String id= crawl.getId();
	String pwd= crawl.getPwd();
	%>

	<%crawler.searchBook(id,pwd); %>

	<table class="table table-bordered" width="100%">
		<thead>
			<tr>
				<th scope="col" width="20%"><h6>SEMESTER</h6></th>
				<th scope="col" width="20%"><h5><center>LECTURE</center></h5></th>
				<th scope="col" width="60%"><h5><center>BOOKS</center></h5></th>
			</tr>
		</thead>
		<tbody>
		<% for(int i = 0 ; i < crawler.courseList.size() ; i ++){
		%>
			<tr>
				<th scope="row"><%=crawler.Semester%></th>
				<td>s</td>
				<td>@mdo</td>
			</tr>
			
			<%}
		%>
		</tbody>
	</table>
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