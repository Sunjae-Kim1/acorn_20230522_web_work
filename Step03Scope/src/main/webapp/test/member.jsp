<%@page import="test.member.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// request scope 에 "dto" 라는 키 값으로 담긴 MemberDto 객체 얻기
	MemberDto dto = (MemberDto)request.getAttribute("dto");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/test/member.jsp</title>
</head>
<body>
	<h3> 회원 정보 </h3>
	<p> 번호 : <strong><%=dto.getNum()%></strong></p>
	<p> 이름 : <strong><%=dto.getName()%></strong></p>
	<p> 주소 : <strong><%=dto.getAddr()%></strong></p>
</body>
</html>