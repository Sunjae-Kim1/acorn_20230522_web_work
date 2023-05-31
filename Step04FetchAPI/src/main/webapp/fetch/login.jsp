<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	// 아이디 , 비밀번호 유효성 검사
	boolean isValid = false;
	// 아이디 gura 비밀번호 1234 
	if(id.equals("gura") && pwd.equals("1234")){
		isValid = true;
	}
%>
{"isSuccess":<%=isValid%>}