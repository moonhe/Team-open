<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="bbs.Bbs" %>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="java.io.PrintWriter" %>

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
<link href="../bootstrap/css/freelancer.min.css" rel="stylesheet">
<link href="../bootstrap/css/api.css" rel="stylesheet">

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
		if (userID == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요');");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");				
		}
		int bbsID = 0;
		if(request.getParameter("bbsID") != null){
			bbsID = Integer.parseInt(request.getParameter("bbsID"));
		}
		if(bbsID == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다.');");
			script.println("location.href = 'bbs.jsp'");
			script.println("</script>");			
		}
		Bbs bbs= new BbsDAO().getBbs(bbsID);
		if(!userID.equals(bbs.getUserID())){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다.');");
			script.println("location.href = 'bbs.jsp'");
			script.println("</script>");
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
    
    <br>
    
    

  
  <style>
.table {text-align:center; border: 1px solid #ddd} 
.table th{background-color: #eee; text-align: center;}
.table textarea{height: 350px;}
</style>		
	
	<div class="container">
		<div class="row">
		<div class="col-md-12">
			<form method="post" action="updateAction.jsp?bbsID=<%= bbsID %>">
				<table class="table table-striped">
					<thead>
						<tr>
							<th colspan="2">UPDATE</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="text" class="form-control" placeholder="글 제목" name="bbsTitle" maxlength="50" value="<%= bbs.getBbsTitle() %>" /></td>
						</tr>
						<tr>
							<td><textarea class="form-control" placeholder="글 내용" name="bbsContent" maxlength="2048"><%= bbs.getBbsContent() %></textarea></td>
						</tr>
					</tbody>
				</table>
				<input type="submit" class="btn btn-primary btn-block pull-right" value="Update" />
			</form>
		</div>
		</div>
	</div>	
	<br><br><br><br><br><br><br>
	
	<div class="copyright py-4 text-center text-white">
		<div class="container">
			<small>Copyright &copy; CBNU MAJOR BOOKS 2018</small>
		</div>
	</div>
	
</body>
</html>


