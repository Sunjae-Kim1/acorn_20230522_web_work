<%@page import="test.member.dao.MemberDao"%>
<%@page import="test.member.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 전송 방식이 post 라서 한글 깨짐 방지
	request.setCharacterEncoding("utf-8");
	// 1. 폼 전송되는 수정할 회원의 정보를 얻는다.
	int num = Integer.parseInt(request.getParameter("num"));
	String name = request.getParameter("name");
	String addr = request.getParameter("addr");
	// 2. DB 에 수정 반영
	MemberDto dto = new MemberDto(num , name , addr);
	boolean isSuccess = MemberDao.getInstance().update(dto);
	// 3. 결과를 응답
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/member/update.jsp</title>
<link rel="stylesheet"  href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
</head>
<body>
	<div class = "container mt-5">
		<h1> 알림 </h1>
		<%if(isSuccess){%>
			<p class = "alert alert-success">
				<strong><%=num%></strong> 번 회원의 정보를 수정했습니다.
				<a class = "alert-link" href= "list.jsp">목록 보기</a>
			</p>
		<%}else{%>
			<p class = "alert alert-danger">
				정보 수정 실패
				<a class = "alert-link" href= "updateform.jsp?num=<%=num%>">다시 수정</a>
			</p>
		<%}%>
	</div>
</body>
</html>