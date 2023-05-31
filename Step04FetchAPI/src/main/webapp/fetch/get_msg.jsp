<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// DB 에서 읽은 더보기 메세지 목록이라 가정
	List<String> list = new ArrayList<>();
	list.add("어쩌구");
	list.add("저쩌구");
	list.add("이렇고");
%>
<%for(String tmp:list){%>
<li><%=tmp%></li>
<%}%>