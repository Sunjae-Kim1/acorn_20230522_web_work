<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// Get 방식 파라미터로 전달되는 아이디 읽어내기
	String inputId = request.getParameter("inputId");
	// DB 에 이미 존재하는 아이디 인지 알아내서 사용 가능 여부를 판정
	boolean canUse = true;
	if(inputId.equals("gura") || inputId.equals("monkey")){
		canUse = false;
	}
	// JSON 으로 사용 가능 여부를 전달
%>
{"canUse":<%=canUse%>}