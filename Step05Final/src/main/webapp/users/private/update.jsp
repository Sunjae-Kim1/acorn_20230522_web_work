<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 1. 수정할 회원의 정보를 읽어서
	String id = (String)session.getAttribute("id");
	String email = request.getParameter("email");
	
	// 프로필 이미지의 경로 읽기
	String profile = request.getParameter("profile");
	
	UsersDto dto = new UsersDto();
	dto.setId(id);
	dto.setEmail(email);
	
	// 만일 profile 이미지를 등록했다면 ( profile 이미지가 empty 가 아니면 )
	if(!profile.equals("empty")){
		// dto 에 전송된 프로필 이미지 경로를 담는다.
		dto.setProfile(profile);
	}
	
	// 2. DB 에 수정 반영 후
	boolean isSuccess = UsersDao.getInstance().update(dto);
	
	// 3. 응답
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/private/update.jsp</title>
</head>
<body>
	<script>
		<%if(isSuccess){%>
			alert("수정 완료");
			location.href = "info.jsp";
		<%}else{%>
			alert("수정 실패");
			location.href = "updateform.jsp";
		<%}%>
	</script>
</body>
</html>