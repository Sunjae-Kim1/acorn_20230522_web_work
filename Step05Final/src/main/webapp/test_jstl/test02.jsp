<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%
	// sample 데이터를 Request Scope 에 담기
	List<String> names = new ArrayList<String>();
	names.add("김구라");
	names.add("해골");
	names.add("원숭이");
	// "list" 라는 키값으로 Request Scope 에 ArrayList 객체 담기
	request.setAttribute("list", names);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test_jstl/test02.jsp</title>
</head>
<body>
	<%
		// request 영역에 "list" 라는 키값으로 저장된 값을 읽어와서 원래 type 으로 casting
		List<String> list = (List<String>)request.getAttribute("list");
	%>
	<h1> 친구 목록1 </h1>
	<ul>
		<%for(String tmp : list){%>
			<li><%=tmp%></li>
		<%}%>
	</ul>
	
	<h1> 친구 목록2 </h1>
	<ul>
		<c:forEach var = "tmp" items = "${requestScope.list}">
			<li>${tmp}</li>
		</c:forEach>
	</ul>
	
	<h1> 친구 목록3 인덱스 표시 </h1>
	<ul>
		<c:forEach var = "tmp" items = "${requestScope.list}" varStatus = "status">
			<li>${tmp} <strong>${status.index}</strong></li>
		</c:forEach>
	</ul>
	
	<h1> 친구 목록4 순서 표시 </h1>
	<ul>
		<c:forEach var = "tmp" items = "${requestScope.list}" varStatus = "status">
			<li>${tmp} <strong>${status.count}</strong></li>
		</c:forEach>
	</ul>
	
	<h1> 친구 목록5 첫번째 순서인지 여부 </h1>
	<ul>
		<c:forEach var = "tmp" items = "${requestScope.list}" varStatus = "status">
			<li>${tmp} <strong>첫번째 : ${status.first}</strong></li>
		</c:forEach>
	</ul>
	
	<h1> 친구 목록6 마지막 순서인지 여부 </h1>
	<ul>
		<c:forEach var = "tmp" items = "${requestScope.list}" varStatus = "status">
			<li>${tmp} <strong>마지막 : ${status.last}</strong></li>
		</c:forEach>
	</ul>
</body>
</html>