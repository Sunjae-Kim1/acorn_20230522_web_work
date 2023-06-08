<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 아이디
	String id = request.getParameter("id");
	// 비밀번호
	String pwd = request.getParameter("pwd");
	// 직업
	String job = request.getParameter("job");
	// 성별
	String gender = request.getParameter("gender");
	// 취미
	String[] hobby = request.getParameterValues("hobby");
	
	String hobbyResult = "";
	
	// 취미 ( 아무것도 체크하지 않으면 null )
	if(hobby != null){
		// 반복문
		for(int i = 0; i < hobby.length; i++){
			// i 번째 방에 있는 선택된 취미
			String tmp = hobby[i];
			hobbyResult += tmp;
			if(i != hobby.length-1){
				hobbyResult += "/";
			}
		}
		
		// 문자열에서 특정 문자 ("/") 로 구분해서 String[] 을 얻기
		String[] result = hobbyResult.split("/");
		
		// 문자열에 특정 문자가 포함되어 있는지 여부
		boolean isContain = hobbyResult.contains("xxx");
	}
	
	// null 이면 체크를 안한 것이다.
	String allowEmail = request.getParameter("allowEmail");
	String allowMessage = request.getParameter("allowMessage");
	
	// textarea 에 입력한 문자열은 개행 , tab , 공백기호가 모두 포함
	// 해당 문자열을 DB 에 저장한 후 다시 불러와 textarea 에 출력할 시
	// textarea 의 innerText 에 출력한다.
	String comment = request.getParameter("comment");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test/signup.jsp</title>
<link rel="stylesheet"  href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
</head>
<body>
	<div class = "container">
		<h1> 회원 가입 결과 </h1>
		<p> 회원님의 정보를 성공적으로 저장했습니다. </p>
		<form action = "signup.jsp" method = "post">
            <div class="form-floating mb-2">
                <input class = "form-control" type = "text" name = "id" id = "id"
                 placeholder = " 아이디 입력" value = "<%=id%>">
                <label for = "id">아이디</label>
            </div>
            <div class="form-floating mb-2"><!-- request.getParameter("id") => name = "id" 값과 동일해야 한다. -->
                <input class = "form-control" type = "password" name = "pwd" id = "pwd"
                 placeholder = " 비밀번호 입력" value = "<%=pwd%>">
                <label for = "pwd">비밀번호</label>
            </div>
            <select class = "form-select mb-2" id = "job" name = "job">
                <option value = "">직업 선택</option><!-- request.getParameter("job") => 아무것도 선택 X null 값 리턴 -->
                <option value = "programmer" <%=job.equals("programmer") ? "selected":""%>>프로그래머</option><!-- request.getParameter("job") => value 값 programmer 리턴 -->
                <option value = "doctor" <%=job.equals("doctor") ? "selected":""%>>의사</option>
            </select>
            <fieldset>
                <legend>성별 체크</legend>
                <div class="form-check form-check-inline">
                    <input class = "form-check-input" value = "man" type = "radio" id = "one"
                     name = "gender" <%=gender.equals("man") ? "checked":""%>>
                    <label class = "form-check-label" for = "one">남자</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class = "form-check-input" value = "woman" type = "radio" id = "two"
                     name = "gender" <%=gender.equals("woman") ? "checked":""%>>
                    <label class = "form-check-label" for = "two">여자</label>
                </div>
            </fieldset>
            <fieldset>
                <legend> 취미 체크 </legend><!-- request.getParameter("hobby") => 맨 위 piano 하나만 리턴 -->
                <div class = "container"><!-- request.getParameterValues() => String[] type  , 여러개 가능 -->
                    <input type = "checkbox" value = "piano" name = "hobby" class = "form-check-input"
                     id = "piano" <%=hobbyResult.contains("piano") ? "checked":""%>>
                    <label class = "form-check-label" for = "piano">피아노</label>
                </div>
                <div class = "container">
                    <input type = "checkbox" value = "game" name = "hobby" class = "form-check-input"
                     id = "game" <%=hobbyResult.contains("game") ? "checked":""%>>
                    <label class = "form-check-label" for = "game">게임</label>
                </div>
                <div class = "container">
                    <input type = "checkbox" value = "etc" name = "hobby" class = "form-check-input"
                     id = "etc" <%=hobbyResult.contains("etc") ? "checked":""%>>
                    <label class = "form-check-label" for = "etc">기타</label>
                </div>
            </fieldset>
            <div>
            	<label class = "form-label" for = "comment"> 하고 싶은 말 </label>
            	<textarea class = "form-control" name = "comment" id = "comment" rows = "10"><%=comment%></textarea>
            </div>
            <fieldset>
                <legend> 개인정보 활용 동의 </legend>
                <div class = "form-check form-switch">
                    <input class = "form-check-input" type = "checkbox" id = "allowAll">
                    <label class = "form-check-label" for = "allowAll">전체 동의</label>
                </div>
                <div class = "form-check form-switch"><!-- request.getParameter("allowEmail") 스위치 off 상태 => null 값 -->
                    <input class = "form-check-input allow" type = "checkbox" value = "email"
                     name = "allowEmail" id = "allowEmail" <%=allowEmail != null ? "checked" : ""%>>
                    <label class = "form-check-label" for = "allowEmail">이메일 수신 여부</label>
                </div>
                <div class = "form-check form-switch">
                    <input class = "form-check-input allow" type = "checkbox" value = "message"
                     name = "allowMessage" id = "allowMessage" <%=allowMessage != null ? "checked" : ""%>>
                    <label class = "form-check-label" for = "allowMessage">광고성 문자 수신 여부</label>
                </div>
            </fieldset>
            <button class = "btn btn-outline-primary" type = "submit">가입</button>
        </form>
	</div>
</body>
</html>