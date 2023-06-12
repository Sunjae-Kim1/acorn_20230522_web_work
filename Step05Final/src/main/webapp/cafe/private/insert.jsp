<%@page import="test.cafe.dao.CafeDao"%>
<%@page import="test.cafe.dto.CafeDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String writer = (String)session.getAttribute("id");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	CafeDto dto = new CafeDto();
	dto.setWriter(writer);
	dto.setTitle(title);
	dto.setContent(content);
	
	boolean isSuccess = CafeDao.getInstance().insert(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/cafe/private/insert.jsp</title>
</head>
<body>
	<%if(isSuccess){%>
		<p>
			<%=writer%> 님이 업로드한 <%=title%> 파일을 저장했습니다.
			<a href = "${pageContext.request.contextPath}/cafe/list.jsp">목록 보기</a>
		</p>
	<%}else{%>
		<p>
			저장 실패
			<a href = "insertform.jsp">다시 시도</a>
		</p>
	<%}%>
</body>
</html>