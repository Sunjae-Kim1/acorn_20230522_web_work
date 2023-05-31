<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 1. 폼 전송되는 id , pwd 을 읽어와서
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	
	// 2. UsersDto 에 담아서
	UsersDto dto = new UsersDto();
	dto.setId(id);
	dto.setPwd(pwd);
	
	// 3. UsersDao 에 전달해 유효한 정보인지 확인
	boolean isValid = UsersDao.getInstance().isValid(dto);
	
	// 4. 유효하면 로그인 처리를 하고 응답 , 유효하지 않으면 아이디 혹은 비밀번호가 틀려요 라고 응답한다.
	// 로그인 처리 -> session scope 에 "id" 라는 키값으로 로그인된 아이디를 저장한다.
	// 					여기서 session scope 란 HttpSession 객체의 setAttribute() 메소드를 이용해서
	//					값을 저장하는 영역이다.
	
	if(isValid){
		// session scope 에 id 라는 키값으로 로그인된 아이디 담기
		session.setAttribute("id" , id);
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/login.jsp</title>
<link rel="stylesheet"  href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
</head>
<body>
	<div class = "container">
		<%if(isValid){%>
			<p class = "alert alert-success">
				<strong><%=dto.getId()%></strong> 님 로그인되었습니다.
				<a href = "${pageContext.request.contextPath}/index.jsp">확인</a>
			</p>
		<%}else{%>
			<p class = "alert alert-danger">
				아이디 혹은 비밀번호가 틀려요
				<a href = "${pageContext.request.contextPath}/users/loginform.jsp">다시 시도</a>
			</p>
		<%}%>
	</div>
</body>
</html>