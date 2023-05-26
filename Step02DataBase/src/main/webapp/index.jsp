<%@page import="tes.util.DbcpBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// DB 연동 가능한지 테스트
	//new DbcpBean(); // 객체 생성했을 시 예외가 발생하지 않고 성공 메세지가 콘솔창에 출력 
	String cPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index.jsp</title>
<link rel="stylesheet"  href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
</head>
<body>
	<%--
		/include/navbar.jsp 페이지에게 이 부분만을 응답하게 한다.
		include 되는 JSP 페이지에 파라미터를 전달할 수 있다.
	--%>
	<jsp:include page = "/include/navbar.jsp">
		<jsp:param value="index" name="current"/>
	</jsp:include>
	<div class = "container">
		<h1> 인덱스 페이지입니다. </h1>
		<ul>
			<li><a href = "${pageContext.request.contextPath}/member/list.jsp">회원 목록 보기</a></li>
			<li><a href = "${pageContext.request.contextPath}/guest/list.jsp">할일 목록 보기</a></li>
		</ul>
	</div>
</body>
</html>