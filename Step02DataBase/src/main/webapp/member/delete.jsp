<%@page import="test.member.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// < a href = "delete.jsp?num=x"></a> 링크를 누를 시
	// get 방식 요청이 된다.
	// 따라서 get 방식 파라미터로 삭제할 회원의 번호가 전달된다.
	
	// 1. 삭제할 회원의 번호를 얻어서
	int num = Integer.parseInt(request.getParameter("num"));
	// 2. DB 삭제
	MemberDao dao = MemberDao.getInstance();
	boolean isSuccess = dao.delete(num);
	// 3. 응답
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/member/delete.jsp</title>
</head>
<body>
	<%if(isSuccess){%>
		<p>
			<strong><%=num%></strong> 번 회원의 정보가 삭제되었습니다.
			<a href = "list.jsp">목록보기</a>
		</p>
	<%}else{%>
		<p>
			삭제 실패
			<a href = "list.jsp">목록보기</a>
		</p>
	<%}%>
</body>
</html>