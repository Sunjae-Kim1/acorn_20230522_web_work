<%@page import="test.cafe.dao.CafeDao"%>
<%@page import="test.cafe.dto.CafeDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int num = Integer.parseInt(request.getParameter("num"));

	//조회수 증가
	CafeDao.getInstance().addViewCount(num);

	// 정보 읽기
	CafeDto dto = CafeDao.getInstance().getData(num);
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/cafe/detail.jsp</title>
<link rel="stylesheet"  href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
</head>
<body>
	<div class = "container">
		<h1 align = "center"> 자세히 보기 폼 </h1>
		<table class = "table table-bordered" >
			<tr>
				<th>글번호</th>
				<td><%=num%></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><%=dto.getWriter()%></td>
			</tr>
			<tr>
				<th>글 제목</th>
				<td><%=dto.getTitle()%></td>
			</tr>
			<tr>
				<th>조회수</th>
				<td><%=dto.getViewCount()%></td>
			</tr>
			<tr>
				<th>작성일</th>
				<td><%=dto.getRegdate()%></td>
			</tr>
			<tr>
				<td colspan = "2">
					<textarea class = "form-control" rows = "10" readonly><%=dto.getContent()%>
				</textarea></td>
			</tr>
		</table>
		<%
			// 로그인된 아이디가 있으면 읽는다. ( null 가능 )
			String id = (String)session.getAttribute("id");
		%>
		<%-- 만일 글 작성자가 로그인된 아이디와 같으면 수정 , 삭제 가능 --%>
		<%if(dto.getWriter().equals(id)){%>
			<a href = "private/updateform.jsp?num=<%=dto.getNum()%>">수정 페이지로 이동</a>
			<a href = "javascript:" onclick = "deleteConfirm()">바로 삭제</a>
			<script>
				function deleteConfirm(){
					const isDelete = confirm("이 글을 삭제합니까?");
					if(isDelete){
						// javascript 를 이용해 페이지 이동
						locatin.href = "private/delete.jsp?num=<%=dto.getNum()%>";
					}
				}
			</script>
		<%}%>
	</div>
</body>
</html>