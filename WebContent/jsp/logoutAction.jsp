<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP 게시판  웹사이트</title>
</head>
<body>
	<%
		session.invalidate(); // 세션 해지함
	%>
	<script>
		location.href = "../index.jsp";
	</script>
</body>
</html>

