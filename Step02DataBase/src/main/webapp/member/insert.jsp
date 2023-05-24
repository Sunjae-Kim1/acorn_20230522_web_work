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
</head>
<body>
	<div class = "container">
		<h1> 알림 </h1>
		<%if(isSuccess){%>
			<p>
				<strong><%=name%></strong> 님의 정보가 저장되었습니다.
				<a href = "insertform.jsp">확인</a>
			</p>
		<%}else{%>
			<p> 정보 저장 실패 <a href = "insertform.jsp">다시 작성</a> </p>
		<%}%>
	</div>
</body>
</html>