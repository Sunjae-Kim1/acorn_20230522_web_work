<%@page import="test.cafe.dao.CafeDao"%>
<%@page import="test.cafe.dto.CafeDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	CafeDto dto = new CafeDto();
	
	int num = Integer.parseInt(request.getParameter("num"));
	dto.setNum(num);
	
	String title = request.getParameter("title");
	dto.setTitle(title);
	
	String content = request.getParameter("content");
	dto.setContent(content);
--%>
<jsp:useBean id = "dto" class = "test.cafe.dto.CafeDto"/>
<jsp:setProperty property = "num" name = "dto"/>
<jsp:setProperty property = "title" name = "dto"/>
<jsp:setProperty property = "content" name = "dto"/>
<%
	// 위의 JSP 액션태그로 생성된 CafeDto 객체에 담긴 글 내용을 수정 반영하고
	boolean isSuccess = CafeDao.getInstance().update(dto);
	// 응답
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/cafe/private/update.jsp</title>
<link rel="stylesheet"  href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
</head>
<body>
	<div class = "container mt-5">
		<%if(isSuccess){%>
		<p class = "alert alert-success">
			수정했습니다.
			<a class = "alert alert-link" href = "${pageContext.request.contextPath}/cafe/detail.jsp?num=<%=dto.getNum()%>">확인</a>
		</p>
	<%}else{%>
		<p class = "alert alert-danger">
			수정 실패
			<a class = "alert alert-link" href = "updateform.jsp?num=<%=dto.getNum()%>">다시 수정</a>
		</p>
	<%}%>
	</div>
</body>
</html>