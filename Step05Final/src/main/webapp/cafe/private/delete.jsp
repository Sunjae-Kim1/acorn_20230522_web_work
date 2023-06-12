<%@page import="test.cafe.dao.CafeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 1. Get 방식 파라미터로 전달되는 삭제할 파일의 글 번호 가져오기
	int num = Integer.parseInt(request.getParameter("num"));

	// 2. DB 에서 삭제
	boolean isSuccess = CafeDao.getInstance().delete(num);
	
	String cPath = request.getContextPath();
	response.sendRedirect(cPath+"/cafe/list.jsp");
%>
