<%@page import="java.io.File"%>
<%@page import="test.file.dao.FileDao"%>
<%@page import="test.file.dto.FileDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 1. 삭제할 파일 번호
	int num = Integer.parseInt(request.getParameter("num"));

	// 2. 삭제할 파일 번호를 이용해 파일정보를 얻는다.
	FileDto dto = FileDao.getInstance().getData(num);
	
	// 로그인된 아이디와 글의 작성자가 일치하는지 확인
	String id = (String)session.getAttribute("id");
	if(!dto.getWriter().equals(id)){
		// 에러 응답
		response.sendError(HttpServletResponse.SC_FORBIDDEN, "타인의 파일 삭제는 금지입니다.");
		return;
	}
	
	// 3. 파일 시스템에서 삭제
	String path = application.getRealPath("/upload")+File.separator+dto.getSaveFileName();
	File f = new File(path);
	f.delete();
	
	// 4. DB 에서 삭제
	FileDao.getInstance().delete(num);
	
	// 5. 응답
	String cPath = request.getContextPath();
	response.sendRedirect(cPath+"/file/list.jsp");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/file/delete.jsp</title>
</head>
<body>
	<script>
			location.href = "${pageContext.request.contextPath}/file/list.jsp";
	</script>
</body>
</html>