<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/guest/insertform.jsp</title>
<link rel="stylesheet"  href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container  mt-5">
		<h1 align="center"> 게시물 추가 폼 </h1>
		<form action = "${pageContext.request.contextPath}/guest/insert.jsp" method = "post">
			<div>
				<label class = "form-label" for = "writer">작성자</label>
				<input class = "form-control" type = "text" id = "writer" name = "writer"/>
			</div>
			<div>
				<label class = "form-label" for = "pwd">비밀번호</label>
				<input class = "form-control" type = "password" id = "pwd" name = "pwd"/>
			</div>
			<div>
				<label class = "form-label" for = "content">내용</label>
				<textarea class = "form-control" id = "content" name = "content"></textarea>
			</div>
			<div align="center">
				<button class = "btn btn-outline-primary" type = "submit">추가</button>
			</div>
		</form>
	</div>
</body>
</html>