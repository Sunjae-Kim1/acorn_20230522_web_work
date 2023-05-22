<%@page import="java.util.ArrayList"%>
<%@page import="test.dto.MemberDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/member/list.jsp</title>
<style type="text/css">
	table{
		border-collapse: collapse;
		margin-left: 500px;
		margin-top: 300px;
		width:500px;
		height:300px;
		text-align: center;
	}
</style>
</head>
<body>
	<table border = "1">
		<thead>
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>주소</th>
			</tr>
		</thead>
		<tbody>
			<%
			List<MemberDto> list = new ArrayList<>();
			list.add(new MemberDto(1 , "김구라" , "노량진"));
			list.add(new MemberDto(2 , "해골" , "행신동"));
			list.add(new MemberDto(3 , "원숭이" , "상도동"));
			
			for(MemberDto tmp:list){
			%>
			<tr>
				<td><%=tmp.getNum()%></td>
				<td><%=tmp.getName()%></td>
				<td><%=tmp.getAddr()%></td>
			</tr>
			<%}%>
		</tbody>
	</table>
</body>
</html>