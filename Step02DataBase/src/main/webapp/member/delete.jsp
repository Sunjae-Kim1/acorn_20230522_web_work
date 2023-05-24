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

	/*
		[ 리다이렉트 응답 ]
		- 클라이언트에게 특정 경로로 요청을 다시 하라고 응답하는 것이다.
		- 다시 요청할 경로를 전달하면 클라이언트가 해당 경로로 요청을 다시 하게 된다.
		- 따라서 순간적으로 페이지가 이동하게 된다.
		- HttpServletResponse 객체의 기능을 활용
		- 요청을 다시 할 경로를 전달할 시 반드시 절대경로로 전달한다.
		- 새로운 경로로 요청을 다시 하라고 강요하는 것도 응답이다.
	*/
	// context 경로 얻기 ( context 경로는 추후에 수정되거나 제거될 예정이라서 메소드로 얻는다. )
	String cPath = request.getContextPath();
	// 리다이렉트 응답
	response.sendRedirect(cPath+"/member/list.jsp");
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