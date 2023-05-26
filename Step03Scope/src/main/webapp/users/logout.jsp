<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/users/logout.jsp</title>
</head>
<body>
	<%
		// 세션 영역에  "nick" 이라는 키 값으로 저장된 값 삭제
		session.removeAttribute("nick");
	%>
	<p>로그아웃 됐습니다.</p>
	<a href = "${pageContext.request.contextPath}/">인덱스로 이동</a>
</body>
</html>