<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String fortune = (String)request.getAttribute("fortuneToday");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/test/fortune.jsp</title>
</head>
<body>
	<div class = "container">
		<p>오늘의 운세 : <strong><%=fortune%></strong></p>
	</div>
</body>
</html>