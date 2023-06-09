<%@page import="test.member.dto.MemberDto"%>
<%@page import="test.member.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 1. 수정할 회원의 번호 추출
	int num = Integer.parseInt(request.getParameter("num"));
	// 2. 번호를 이용해 DB 에 저장된 수정할 회원의 정보를 얻기
	MemberDto dto = MemberDao.getInstance().getData(num);
	// 3. 수정할 양식을 클라이언트에게 응답
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/member/updateform.jsp</title>
<link rel="stylesheet"  href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
</head>
<body>
	<div class = "container">
		<h1> 회원 정보 수정 양식 </h1>
		<form action = "update.jsp" method = "post">
			<div class = "mb-1">
				<label class = "form-label" for = "num">번호</label>
				<input class = "form-control" type = "text" id = "num" name = "num" value = "<%=dto.getNum()%>" readonly/>
			</div>
			<div class = "mb-1">
				<label class = "form-label" for = "name">이름</label>
				<input class = "form-control" type = "text" id = "name" name = "name" value = "<%=dto.getName()%>"/>
			</div>
			<div class = "mb-1">
				<label class = "form-label" for = "addr">주소</label>
				<input class = "form-control" type = "text" id = "addr" name = "addr" value = "<%=dto.getAddr()%>"/>
			</div>
			<button class = "btn btn-outline-primary" type = "submit">수정확인</button>
			<button class = "btn btn-outline-warning" type = "reset">취소</button>
		</form>
	</div>
</body>
</html>