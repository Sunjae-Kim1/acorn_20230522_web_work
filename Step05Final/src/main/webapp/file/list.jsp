<%@page import="test.file.dto.FileDto"%>
<%@page import="java.util.List"%>
<%@page import="test.file.dao.FileDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	final int page_row = 5;

	int pageNum = 1;
	
	String	strPageNum = request.getParameter("pageNum");
	
	if(strPageNum != null){
		pageNum = Integer.parseInt(strPageNum);
	}
	
	int startRowNum = (pageNum - 1) * page_row + 1;
	int endRowNum = pageNum * page_row;
	
	FileDto dto = new FileDto();
	dto.setStartRowNum(startRowNum);
	dto.setEndRowNum(endRowNum);

	List<FileDto> list = FileDao.getInstance().getList(dto);
	
	// 로그인된 아이디 ( 없으면 null )
	String id = (String)session.getAttribute("id");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/file/list.jsp</title>
<link rel="stylesheet"  href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
</head>
<body>
	<div class = "container">
		<a href = "${pageContext.request.contextPath}/file/private/upload_form.jsp">업로드 하기</a>
		<br>
		<a href = "${pageContext.request.contextPath}/file/private/upload_form2.jsp">ajax 업로드 하기</a>
		<h1 align = "center"> 자료실 목록입니다. </h1>
		<table class = "table table-dark table-stripped">
			<thead>
				<tr align = "center">
					<th>번호</th>
					<th>작성자</th>
					<th>제목</th>
					<th>파일명</th>
					<th>등록일</th>
					<th>삭제</th>
				</tr>
			</thead>
			<tbody>
				<%for(FileDto tmp:list){%>
					<tr align = "center">
						<td><%=tmp.getNum()%></td>
						<td><%=tmp.getWriter()%></td>
						<td><%=tmp.getTitle()%></td>
						<td>
							<a href = "download.jsp?num=<%=tmp.getNum()%>"><%=tmp.getOrgFileName()%></a>
						</td>
						<td><%=tmp.getRegdate()%></td>
						
						<td>
							<!-- 글 작성자와 로그인된 아이디가 같을때만 삭제 링크 출력 -->
							<%if(tmp.getWriter().equals(id)) {%>
								<a href = "delete.jsp?num=<%=tmp.getNum()%>">삭제</a>
							<%}%>
						</td>
						
					</tr>
				<%}%>
			</tbody>
		</table>
		
		<ul class = "pagination justify-content-center">
			<%for(int i = 1; i <= 10; i ++){%>
				<li class="page-item" >
					<a class="page-link" href = "list.jsp?pageNum=<%=i%>"><%=i%></a>
				</li>
			<%}%>
		</ul>
		
	</div>
</body>
</html>