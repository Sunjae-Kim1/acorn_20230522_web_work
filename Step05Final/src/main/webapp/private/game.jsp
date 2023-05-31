<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 로그인된 아이디가 있는지 확인
	String id = (String)session.getAttribute("id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/private/game.jsp</title>
</head>
<body>
	<h1> 게임 페이지 입니다. </h1>
	<p><%=id%> 님은 게임 중 입니다.</p>
</body>
</html>