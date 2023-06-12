<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/cafe/private/insertform.jsp</title>
<link rel="stylesheet"  href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
</head>
<body>
	<div class = "container">
		<h1 align = "center"> 게시글 작성 폼 </h1>
		<form action = "insert.jsp" method = "post">
			<div class = "mb-2">
				<label class = "form-label" for = "title">제목</label>
				<input class = "form-control" type = "text" name = "title" id = "title"/>
			</div>
			<div class = "mb-2">
				<label class = "form-label" for = "content">내용</label> 
				<textarea class = "form-control" name = "content" id = "content" rows = "10"></textarea>
			</div>
			<div align = "center">
				<button class = "btn btn-outline-success" type = "submit">저장</button>
			</div>
		</form>
	</div>
</body>
</html>