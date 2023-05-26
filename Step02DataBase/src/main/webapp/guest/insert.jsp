<%@page import="test.guest.dao.GuestDao"%>
<%@page import="test.guest.dto.GuestDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String writer = request.getParameter("writer");
	String content = request.getParameter("content");
	String pwd = request.getParameter("pwd");

	GuestDto dto = new GuestDto(); 
	dto.setWriter(writer);
	dto.setContent(content);
	dto.setPwd(pwd);

	GuestDao dao = GuestDao.getInstance();
	boolean isSuccess = dao.insert(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/guest/insert.jsp</title>
</head>
<body>
	<!-- 웹 브라우저에서 출력되지만 웹 브라우저가 무시하는 주석 -->
	<%-- JSP 페이지가 무시하는 주석 , 웹 브라우저에서 출력 X --%>
	<%-- JavaScript 응답하기 --%>
	<script>
	<%if(isSuccess){%>
		alert("게시물을 성공적으로 추가했습니다.");
		location.href = "${pageContext.request.contextPath}/guest/list.jsp";
	<%}else{%>
		alert("게시물 추가 실패");
		location.href = "${pageContext.request.contextPath}/guest/insertform.jsp";
	<%}%>
	</script>
</body>
</html>