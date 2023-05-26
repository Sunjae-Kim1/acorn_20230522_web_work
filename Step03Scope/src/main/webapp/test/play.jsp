<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// session scope 에 "nick" 이라는 키 값으로 저장된 문자열이 있는지 읽는다.
	String nick = (String)session.getAttribute("nick");
	
	// 만일 저장된 값이 없으면 ( 로그인 X )
	if(nick == null){
		// 로그인 페이지로 리다이렉트 한다. ( 여기서는 index.jsp 로 이동 )
		String cPath = request.getContextPath();
		response.sendRedirect(cPath + "/index.jsp");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>test/play.jsp</title>
</head>
<body>
	<p> <strong><%=nick%></strong> 님 놀러가기 </p>
	<a href = "${pageContext.request.contextPath}/">인덱스로 이동</a>
</body>
</html>