<%@page import="test.file.dto.FileDto"%>
<%@page import="java.util.List"%>
<%@page import="test.file.dao.FileDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%
	// 한 페이지에 표시할 게시물 수
	final int page_row_count = 5;
	// 하단에 페이지 버튼을 몇 개씩 표시하는가
	final int page_display_count = 5;

	// 초기 페이지 번호
	int pageNum = 1;
	
	String	strPageNum = request.getParameter("pageNum");
	
	if(strPageNum != null){
		pageNum = Integer.parseInt(strPageNum);
	}
	
	int startRowNum = (pageNum - 1) * page_row_count + 1;
	int endRowNum = pageNum * page_row_count;
	
	// 하단 시작 페이지 번호
	int startPageNum = 1 + ((pageNum-1)/page_display_count)*page_display_count;
	// 하단 끝 페이지 번호
	int endPageNum = startPageNum + page_display_count - 1;
	// 전체 글의 갯수
	int totalRow = FileDao.getInstance().getCount();
	// 전체 페이지의 갯수
	int totalPageCount = (int)Math.ceil(totalRow/(double)page_row_count);
	// 끝 페이지 번호가 이미 전체 페이지 갯수보다 크게 계산되면 잘못된 값
	if(endPageNum > totalPageCount){
		endPageNum = totalPageCount; // 수정
	}
	
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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<jsp:include page = "/include/navbar.jsp">
		<jsp:param value = "file" name = "current" />
	</jsp:include>
	<div class = "container">
		<h1 align = "center"> 자료실 목록입니다. </h1>
		<a href = "${pageContext.request.contextPath}/file/private/upload_form.jsp">업로드 하기</a>
		<br>
		<a href = "${pageContext.request.contextPath}/file/private/upload_form2.jsp">ajax 업로드 하기</a>
		<table class = "table table-dark table-stripped">
			<thead>
				<tr align = "center">
					<th>번호</th>
					<th>작성자</th>
					<th>제목</th>
					<th>파일명</th>
					<th>파일크기</th>
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
						<td><%=tmp.getFileSize()%> byte</td>
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
			<!-- startPageNum 이 1 이 아닌 경우에만 Prev 링크 제공 -->
			<%if(startPageNum != 1){ %>
				<li class = "page-item">
					<a class="page-link" href = "list.jsp?pageNum=<%=startPageNum-1%>">Prev</a>
				</li>
			<%}%>
			<%for(int i = startPageNum; i <= endPageNum; i ++){%>
				<li class="page-item <%= i == pageNum ? "active" : ""%>" >
					<a class="page-link" href = "list.jsp?pageNum=<%=i%>"><%=i%></a>
				</li>
			<%}%>
			<!-- 마지막 페이지 번호가 전체 페이지의 갯수보다 적으면 Next 링크 제공 -->
			<%if(endPageNum < totalPageCount){ %>
				<li class = "page-item">
					<a class="page-link" href = "list.jsp?pageNum=<%=endPageNum+1%>">Next</a>
				</li>
			<%}%>
		</ul>
		
	</div>
</body>
</html>