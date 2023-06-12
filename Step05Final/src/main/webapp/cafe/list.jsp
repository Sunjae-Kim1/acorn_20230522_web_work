<%@page import="test.cafe.dto.CafeDto"%>
<%@page import="java.util.List"%>
<%@page import="test.cafe.dao.CafeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	String id = (String)session.getAttribute("id");
	
	final int pageRowCount = 5;
	final int pageDisplayCount = 5;
	
	int pageNum = 1;
	
	String strPageNum = request.getParameter("pageNum");
	
	if(strPageNum != null){
		pageNum = Integer.parseInt(strPageNum);
	}
	
	int startRowNum = (pageNum - 1) * pageRowCount + 1;
	int endRowNum = pageNum * pageRowCount;
	
	// 하단 시작 페이지 번호
	int startPageNum = 1 + ((pageNum-1)/pageDisplayCount)*pageDisplayCount;
	// 하단 끝 페이지 번호
	int endPageNum = startPageNum + pageDisplayCount - 1;
	// 전체 글의 갯수
	int totalRow = CafeDao.getInstance().getCount();
	// 전체 페이지의 갯수
	int totalPageCount = (int)Math.ceil(totalRow/(double)pageRowCount);
	// 끝 페이지 번호가 이미 전체 페이지 갯수보다 크게 계산되면 잘못된 값
	if(endPageNum > totalPageCount){
		endPageNum = totalPageCount; // 수정
	}
	
	CafeDto dto = new CafeDto();
	dto.setStartRowNum(startRowNum);
	dto.setEndRowNum(endRowNum);
		
	List<CafeDto> list = CafeDao.getInstance().getList(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/cafe/list.jsp</title>
<link rel="stylesheet"  href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
</head>
<body>
	<div class = "container">
		<h1 align = "center"> 게시글 목록 입니다. </h1>
		<a href = "private/insertform.jsp">게시글 작성</a>
		<table class = "table table-dark table-stripped">
			<thead>
				<tr align = "center">
					<th>글 번호</th>
					<th>작성자</th>
					<th>제목</th>
					<th>조회수</th>
					<th>등록일</th>
				</tr>
			</thead>
			<tbody>
				<%for(CafeDto tmp : list){%>
					<tr align = "center">
						<td><%=tmp.getNum()%></td>
						<td><%=tmp.getWriter()%></td>
						<td>
							<a href = "detail.jsp?num=<%=tmp.getNum()%>"><%=tmp.getTitle()%></a>
						</td>
						<td><%=tmp.getViewCount()%></td>
						<td><%=tmp.getRegdate()%></td>	
					</tr>
				<%}%>
			</tbody>
		</table>
		<nav>
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
		</nav>
	</div>
</body>
</html>