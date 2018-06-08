<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="bbs.BbsDAO"%>
<%@ page import="bbs.Bbs"%>
<%@ page import="user.UserDAO"%>
<jsp:useBean id="dri2" class="crawling.chromeDriver2" scope="page" />
<%@ page import="org.openqa.selenium.chrome.ChromeDriver"%>
<!-- Database Access Object가 필요 -->
<%@ page import="org.openqa.selenium.WebDriver"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<% request.setCharacterEncoding("UTF-8"); %>
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
<link href="../bootstrap/css/freelancer.css" rel="stylesheet">
<link href="../bootstrap/css/api.css" rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>





<script>
	var totalPages; //전체 페이지수 저장용 전역변수
	var currentPageNum; //현재 페이지 번호 저장용 전역변수

	$(document).ready(
			function() {
				//Ajax 요청 및 응답 처리
				//Ajax -> 타 사이트 요청 불가
				$(".btnSearch").click(
						function() {
							ajax($("#keyword").val(), $(".maxResults:checked")
									.val(), "1");
							currentPageNum = "1";
							currentPage(currentPageNum);
						});

				//이전, 다음 버튼 -> 페이지 이동
				$("#previous").click(
						function() {
							var previousNum = parseInt(currentPageNum) - 1;
							ajax($("#keyword").val(), $(".maxResults:checked")
									.val(), previousNum);
							currentPage(previousNum);
						});
				$("#next").click(
						function() {
							var nextNum = parseInt(currentPageNum) + 1;
							ajax($("#keyword").val(), $(".maxResults:checked")
									.val(), nextNum);
							currentPage(nextNum);
						});
			});

	function currentPage(idx) {
		$(".currentPage").text(idx);
		currentPageNum = idx;

		//문제) 이전, 다음 버튼에 대한 활성, 비활성 처리
		//이전 버튼은 현재 페이지가 1인 경우 비활성 처리
		//다음 버튼은 현재 페이지가 전체 페이지수와 일치하는 경우 비활성 처리
		//그외 나머지 경우는 이전, 다음 버튼 활성 처리
	}

	function ajax(keyword, maxResults, start) {
		//$.get("BookAPIAjax.jsp?keyword="+keyword+"&maxResults="+maxResults, function(data) {
		$
				.post(
						"BookAPIAjax.jsp",
						{
							keyword : keyword,
							maxResults : maxResults,
							start : start
						},
						function(data) {
							//XML 응답 확인
							console.log(data);
							var txt = "";

							//XML 객체의 특정 엘리먼트 탐색
							var totalResults = $(data).find(
									"bookAPI > totalResults").text();
							var bookInfoList = $(data).find(
									"bookAPI > bookInfo");
							var bookInfoCount = bookInfoList.length;

							for (var a = 0; a < bookInfoCount; ++a) {
								var bookInfo = $(data).find(
										"bookAPI > bookInfo:eq(" + a + ")");
								var coverSmallUrl = $(bookInfo).find(
										"coverSmallUrl").text();
								var title = $(bookInfo).find("title").text();
								var publisher = $(bookInfo).find("publisher")
										.text();
								var author = $(bookInfo).find("author").text();
								var priceStandard = $(bookInfo).find(
										"priceStandard").text();
								var isbn = $(bookInfo).find("isbn").text();
								var link = $(bookInfo).find("link").text();

								txt += "<tr>";
								txt += "<td>" + (a + 1) + "</td>";
								txt += "<td><img src=\"" + coverSmallUrl + "\"></td>";
								txt += "<td>title:<label>" + title
										+ "</label><br>";
								txt += "publisher" + publisher + "<br>";
								txt += "author:" + author + "<br>";
								txt += "price" + priceStandard + "<br>";
								txt += "<td><a href=\"" + link + "\" target=\"_blank\" class=\"btn btn-default btn-xs\" role=\"button\">인터파크 상세보기</a></td>";
								txt += "</tr>";
							}

							if (totalResults == "0") {
								txt = "<tr><td colspan=\"4\"><h3>검색 결과가 없습니다.</h3></td></tr>";
							}

							$(".bookAPI > tbody").html(txt);
							$(".totalResults").text(totalResults);

							//전체 페이지수 출력
							//전체 페이지수 계산 -> 올림(전체 로우/maxResults)
							//9.1 => 10
							//9.9 => 10
							totalPages = Math.ceil(totalResults
									/ $(".maxResults:checked").val());
							$(".totalPages").text(totalPages);
						});
	}
</script>


<style>
h2 {
	display: block;
	font-size: 2.2em;
	margin-left: 0;
	margin-right: 0;
	font-weight: bold;
}

h6 {
	display: block;
	font-size: 1.0 em;
	margin-top: 0.3em;
	margin-bottom: 0.3em;
	margin-left: 0;
	margin-right: 0;
	font-weight: bold;
}
</style>









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
					href="/jsp/BookSearch.jsp">SEARCH BOOKS</a></li>
				<li class="nav-item mx-0 mx-lg-1"><a
					class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger"
					href="#">PURCHASE BOOKS</a></li>


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
	<br>	<br>
	<br>	<br>
	<br>	<br>

	<div class="col-md-12">
		<img class="img-fluid mb-5 d-block mx-auto"
			src="../bootstrap/img/cart-2.png" alt="">
		<h2 class="text-uppercase mb-0 text-center">PURCHASE BOOKS</h2>
		<hr width="800px">
		<div class="row"></div>
	</div>


	<br>
	<br>
	<div class="container">
		<div class="panel-group">
			<div class="panel panel-default">
				<div class="panel-heading">
					<label>검색</label>
				</div>
				<div class="panel-body">
					<form class="form-inline" role="form" method="post" id="myForm">
						<input type="hidden" id="start" name="start" value="1"> <label
							for="keyword">키워드:</label> <input type="text"
							class="form-control" id="keyword" name="keyword"
							required="required">
						<button type="button" class="btn btn-default btnSearch">
							<span class="glyphicon glyphicon-search"></span> Search
						</button>
						<label class="radio-inline"><input type="radio"
							class="maxResults" name="maxResults" value="10" checked="checked"><br>
							<br>10개씩 보기</label> <label class="radio-inline"><input
							type="radio" class="maxResults" name="maxResults" value="20"><br>
							<br>20개씩 보기</label> <label class="radio-inline"><input
							type="radio" class="maxResults" name="maxResults" value="30"><br>
							<br>30개씩 보기</label>
					</form>
				</div>
			</div>
			<div class="panel panel-default">
				<div class="panel-heading">
					<label>검색 결과 출력</label>
					<button type="button" class="btn btn-default">
						TotalResults <span class="badge totalResults">0</span>
					</button>
					<button type="button" class="btn btn-default">
						TotalPages <span class="badge totalPages">0</span>
					</button>
					<button type="button" class="btn btn-default">
						CurrentPage <span class="badge currentPage">0</span>
					</button>
				</div>
				<div class="panel-body">
					<table class="table bookAPI">
						<thead>
							<tr>
								<th></th>
								<th></th>
								<th></th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>1</td>
								<td><img src="../bootstrap/img/interpark_logo.png"></td>
								<td>title&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label>책제목</label>
									<br>publisher&nbsp;&nbsp;출판사 <br>author&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;저자
									<br>price&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;정가
								</td>
								<td><a
									href="http://book.interpark.com/bookPark/html/book.html"
									target="_blank" class="btn btn-default btn-xs" role="button">인터파크
										상세보기</a></td>
							</tr>
						</tbody>
					</table>

					<ul class="pager">
						<li><button type="button" class="btn btn-default"
								id="previous" value="1">Previous</button></li>
						<li><button type="button" class="btn btn-default" id="next"
								value="2">Next</button></li>
					</ul>
				</div>
			</div>

		</div>
	</div>



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