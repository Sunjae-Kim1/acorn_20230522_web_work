<%@page import="test.member.dto.MemberDto"%>
<%@page import="test.member.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/*
		1. post 방식으로 전송되는 회원의 이름 , 주소를 추출
		2. DB 에 전달
		3. 응답
	*/
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("name");
	String addr = request.getParameter("addr");
	// 
	MemberDto dto = new MemberDto(); 
	dto.setName(name);
	dto.setAddr(addr);
	// DB 저장
	MemberDao dao = MemberDao.getInstance();
	boolean isSuccess = dao.insert(dto); // 작업의 성공 여부
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/member/insert.jsp</title>
<link rel="stylesheet"  href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
</head>
<body>
	<div class = "container mt-5">
		<h1> 알림 </h1>
		<%if(isSuccess){%>
			<p class = "alert alert-success">
				<strong><%=name%></strong> 님의 정보가 저장되었습니다.
				<a class = "alert-link" href = "list.jsp">확인</a>
			</p>
		<%}else{%>
			<p class = "alert alert-warning">
				정보 저장 실패
				<a class = "alert-link" href = "insertform.jsp">다시 작성</a>
			</p>
		<%}%>
	</div>
</body>
</html>