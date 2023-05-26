<%@page import="test.guest.dto.GuestDto"%>
<%@page import="test.guest.dao.GuestDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	String pwd = request.getParameter("pwd");
	
	GuestDto dto = new GuestDto();
	dto.setNum(num);
	dto.setPwd(pwd);
	
	boolean isSuccess = GuestDao.getInstance().delete(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/guest/delete.jsp</title>
</head>
<body>
	<%if(isSuccess){%>
		<%
			String cPath = request.getContextPath();
			response.sendRedirect(cPath+"/guest/list.jsp");
		%>
	<%}else{%>
		<script>
			alert("게시물 삭제 실패");
			location.href = "${pageContext.request.contextPath}/guest/list.jsp";
		</script>
	<%}%>
</body>
</html>