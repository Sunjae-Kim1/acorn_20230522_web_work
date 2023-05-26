<%@page import="java.util.List"%>
<%@page import="test.guest.dto.GuestDto"%>
<%@page import="test.guest.dao.GuestDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	GuestDto dto = GuestDao.getInstance().getData(num);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/guest/updateform.jsp</title>
<link rel="stylesheet"  href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
</head>
<body>
	<div class = "container mt-5" >
		<h1 align="center" > 회원 정보 수정 양식 </h1>
		<form action = "${pageContext.request.contextPath}/guest/update.jsp" method = "post">
			<div class = "mb-1">
				<label class = "form-label" for = "num">번호</label>
				<input class = "form-control" type = "text" id = "num" name = "num" value = "<%=dto.getNum()%>" readonly/>
			</div>
			<div class = "mb-1">
				<label class = "form-label" for = "writer">작성자</label>
				<input class = "form-control" type = "text" id = "writer" name = "writer" value = "<%=dto.getWriter()%>"/>
			</div>
			<div class = "mb-1">
				<label class = "form-label" for = "content">내용</label>
				<textarea class = "form-control" id = "content" name = "content" rows = "5"><%=dto.getContent()%></textarea>
			</div>
			<div class = "mb-1">
				<label class = "form-label" for = "pwd">비밀번호</label>
				<input class = "form-control" type = "password" id = "pwd" name = "pwd"/>
			</div>
			<div align="center">
				<button class = "btn btn-outline-primary" type = "submit">수정확인</button>
				<button class = "btn btn-outline-warning" type = "reset">취소</button>
			</div>
		</form>
	</div>
</body>
</html>