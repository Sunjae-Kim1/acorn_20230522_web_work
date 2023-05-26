<%@page import="test.guest.dao.GuestDao"%>
<%@page import="test.guest.dto.GuestDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	int num = Integer.parseInt(request.getParameter("num"));
	String writer = request.getParameter("writer");
	String content = request.getParameter("content");
	String pwd = request.getParameter("pwd");
	
	GuestDto dto = new GuestDto(num , writer , content , pwd , null);
	boolean isSuccess = GuestDao.getInstance().update(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/guest/update.jsp</title>
<link rel="stylesheet"  href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
</head>
<body>
	<div class = "mt-1">
		<h1 align="center"> 알림 </h1>
		<%if(isSuccess){%>
			<p class = "alert alert-success">
				<strong><%=num%></strong> 번 <strong><%=writer%></strong> 님의 정보를 수정했습니다.
				<a class = "alert-link" href= "list.jsp">목록 보기</a>
			</p>
		<%}else{%>
			<p class = "alert alert-danger">
				게시물 수정 실패 <%=num%> <%=writer%> <%=content%> <%=pwd%>
				<a class = "alert-link" href= "updateform.jsp?num=<%=num%>">다시 수정</a>
			</p>
		<%}%>
		</div>
</body>
</html>