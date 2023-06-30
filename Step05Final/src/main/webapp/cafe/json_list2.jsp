<%@page import="org.json.JSONObject"%>
<%@page import="test.cafe.dto.JsonCafeDto"%>
<%@page import="org.json.JSONWriter"%>
<%@page import="test.cafe.dao.CafeDao"%>
<%@page import="java.util.List"%>
<%@page import="test.cafe.dto.CafeDto"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

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
	
	// JSONObject 객체를 생성해서
	JSONObject obj = new JSONObject();
	
	// 특정 키 값으로 지정할 값을 담는다.
	obj.put("list", list);
	obj.put("pageNum", pageNum);
	obj.put("startPageNum", startPageNum);
	obj.put("endPageNum", endPageNum);
	obj.put("totalPageCount", totalPageCount);
	
	// JSONWriter 클래스의 static 메소드를 에용해서 List<CafeDto> 를 JSON 문자열로 변환해서
	String json = JSONWriter.valueToString(obj);
	//클라이언트에게 json 문자열 응답 ( fetch 요청에 응답 )
	
%>
<%=json%>