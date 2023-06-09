<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 1. 파일을 저장할 서버에서의 실제 경로 구성
	String realPath = application.getRealPath("/upload");
	
	MultipartRequest mr = new MultipartRequest(request ,		// 내부적으로 필요한 HttpServletRequest 객체 전달
			realPath ,													// 업로드된 파일을 저장할 경로
			1024*1024*50 ,											// 최대 업로드 사이즈 제한
			"utf-8" ,													// 한글 깨짐 방지
			new DefaultFileRenamePolicy());						// 동일한 파일이 존재하면 자동으로 파일을 rename 해서 저장한다.
	
	// 3. MultipartRequest 객체의 메소드를 이용해서 폼 전송된 내용을 추출한다.
	String saveFileName = mr.getFilesystemName("image");
	
	// DB 에 저장할 이미지 경로 구성
	String imagePath = "/upload/" + saveFileName;
%>
{"imagePath":"<%=imagePath%>"}