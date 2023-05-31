<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// DB 에서 읽은 더보기 메세지 목록이라 가정
	List<String> list = new ArrayList<>();
	list.add("어쩌구");
	list.add("저쩌구");
	list.add("이렇고");
%>
[
<%for(int i = 0; i < list.size(); i++){%>
"<%=list.get(i)%>"<%=(i==list.size()-1) ? "" : ","%>
<%}%>
]