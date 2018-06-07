<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <%@ page import="crawling.chromeDriver" %> --%>
<%@ page import="user.UserDAO"%>
<!-- Database Access Object가 필요 -->
<jsp:useBean id="dri" class="crawling.chromeDriver" scope="page" />
<%@ page import="org.openqa.selenium.chrome.ChromeDriver"%>
<!-- Database Access Object가 필요 -->
<%@ page import="org.openqa.selenium.WebDriver"%>
<%@ page errorPage="Error.jsp"%>
<jsp:useBean id="crawl" class="crawling.chromeDriver" scope="page" />






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



</head>
<body id="page-top">
<%
System.out.println("여기는 print");
System.out.println(crawl.getId());
%>
	<%dri.searchBook("2012030014","sjrnfl11!2!"); %>






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