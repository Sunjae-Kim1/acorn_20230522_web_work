<%@page import="test.cafe.dto.CafeDto"%>
<%@page import="test.cafe.dao.CafeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int num = Integer.parseInt(request.getParameter("num"));

	CafeDto dto = CafeDao.getInstance().getData(num);
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/cafe/private/updateform.jsp</title>
<link rel="stylesheet"  href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
</head>
<body>
	<div class = "container">
		<h1> 수정 , 삭제 폼 </h1>
		<form action = "update.jsp" method = "post">
			<div class = "mb-2">
				<label class = "form-label" for = "num" >글번호</label>
				<input class = "form-control" name = "num" id = "num" value = "<%=dto.getNum()%>" readonly/>
			</div>
			<div class = "mb-2">
				<label class = "form-label" for = "title" >글 제목</label>
				<input class = "form-control" name = "title" id = "title" value = "<%=dto.getTitle()%>" />
			</div>
			<div class = "mb-2">
				<label class = "form-label" for = "content" >글 내용</label>
				<textarea class = "form-control" name = "content" id = "content" rows = "10"><%=dto.getContent()%></textarea>
			</div>
			<div align = "center">
				<button class = "btn btn-outline-primary" type = "submit">수정 확인</button>
				<button class = "btn btn-outline-primary" type = "reset">수정 취소</button>
			</div>
		</form>
	</div>
</body>
</html>