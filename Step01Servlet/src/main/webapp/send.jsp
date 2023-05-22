<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 요청 인코딩 설정 (한글 깨짐 방지)
	request.setCharacterEncoding("utf-8");
	// 요청 파라미터 추출
	String msg = request.getParameter("msg");
	// System.out.println("msg: " + msg);
	// 이클립스 버그로 인해 jsp 페이지에서는 콘솔창에서 출력 불가
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>send.jsp</title>
</head>
<body>
	<p>메세지 확인 - 클라이언트</p>
	<p>전달 받은 메세지 <strong><%=msg%></strong> </p>
</body>
</html>