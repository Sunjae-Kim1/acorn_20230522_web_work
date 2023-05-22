<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// num , amount 갯수를 HttpServletRequest 객체를 이용해 얻고
	// 아래의 html 요소에 출력
	// Get 방식은 한글이 깨지지 않기에 아래 한 줄은 필요 X
	request.setCharacterEncoding("utf-8");
	/*
		전달되는 파라미터가 숫자인 경우에는 실제 숫자로 바꾸는 경우가 있다.
		그럴때 Integer 클래스 혹은 Double 클래스의
		parseInt() , parseDounble() , static 메소드를 활용
	*/
	int num = Integer.parseInt(request.getParameter("num"));
	int amount = Integer.parseInt(request.getParameter("amount"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/shop/buy.jsp</title>
</head>
<body>
	<p>메세지 확인 - 클라이언트</p>
	<p><strong><%=num%></strong> 번 상품 <strong><%=amount%></strong> 갯수를 주문 </p>
</body>
</html>