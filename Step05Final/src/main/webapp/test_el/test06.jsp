<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 클라이언트에게 쿠키를 응답하기 위해서 Cookie 객체를 생성
	// new Cookie(key , value)
	Cookie cook = new Cookie("saveId" , "kimgura");
	// 쿠키 유지 시간 ( 6초 )
	cook.setMaxAge(60);
	// HttpServletResponse 객체에 addCookie() 메소드를 호출하면서 Cookie 객체를 전달하면
	// 클라이언트에게 응답할 때 자동으로 쿠키도 응답한다. 
	response.addCookie(cook);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test_el/test06.jsp</title>
</head>
<body>
	<h1> 쿠키에 저장된 내용도 EL 로 추출 가능 </h1>
	<p> saveId 라는 키값으로 6초 동안 유지되는 쿠키를 응답했습니다. </p>
	<a href = "test07.jsp">쿠키 값 확인하기</a>
</body>
</html>