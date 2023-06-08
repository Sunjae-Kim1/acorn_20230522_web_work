<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test/signup_form.jsp</title>
<link rel="stylesheet"  href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
</head>
<body>
	<div class = "container">
        <h1> 다양한 form 디자인 </h1>
        <form action = "signup.jsp" method = "post">
            <div class="form-floating mb-2">
                <input class = "form-control" type = "text" name = "id" id = "id" placeholder = " 아이디 입력">
                <label for = "id">아이디</label>
            </div>
            <div class="form-floating mb-2"><!-- request.getParameter("id") => name = "id" 값과 동일해야 한다. -->
                <input class = "form-control" type = "password" name = "pwd" id = "pwd" placeholder = " 비밀번호 입력">
                <label for = "pwd">비밀번호</label>
            </div>
            <select class = "form-select mb-2" id = "job" name = "job">
                <option value = "">직업 선택</option><!-- request.getParameter("job") => 아무것도 선택 X null 값 리턴 -->
                <option value = "programmer">프로그래머</option><!-- request.getParameter("job") => value 값 programmer 리턴 -->
                <option value = "doctor">의사</option>
            </select>
            <fieldset>
                <legend>성별 체크</legend>
                <div class="form-check form-check-inline">
                    <input class = "form-check-input" value = "man" type = "radio" id = "one" name = "gender" checked>
                    <label class = "form-check-label" for = "one">남자</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class = "form-check-input" value = "woman" type = "radio" id = "two" name = "gender">
                    <label class = "form-check-label" for = "two">여자</label>
                </div>
            </fieldset>
            <fieldset>
                <legend> 취미 체크 </legend><!-- request.getParameter("hobby") => 맨 위 piano 하나만 리턴 -->
                <div class = "container"><!-- request.getParameterValues() => String[] type  , 여러개 가능 -->
                    <input type = "checkbox" value = "piano" name = "hobby" class = "form-check-input" id = "piano">
                    <label class = "form-check-label" for = "piano">피아노</label>
                </div>
                <div class = "container">
                    <input type = "checkbox" value = "game" name = "hobby" class = "form-check-input" id = "game">
                    <label class = "form-check-label" for = "game">게임</label>
                </div>
                <div class = "container">
                    <input type = "checkbox" value = "etc" name = "hobby" class = "form-check-input" id = "etc">
                    <label class = "form-check-label" for = "etc">기타</label>
                </div>
            </fieldset>
            <div>
            	<label class = "form-label" for = "comment"> 하고 싶은 말 </label>
            	<textarea class = "form-control" name = "comment" id = "comment" rows = "10"></textarea>
            </div>
            <fieldset>
                <legend> 개인정보 활용 동의 </legend>
                <div class = "form-check form-switch">
                    <input class = "form-check-input" type = "checkbox" id = "allowAll">
                    <label class = "form-check-label" for = "allowAll">전체 동의</label>
                </div>
                <div class = "form-check form-switch"><!-- request.getParameter("allowEmail") 스위치 off 상태 => null 값 -->
                    <input class = "form-check-input allow" type = "checkbox" value = "email" name = "allowEmail" id = "allowEmail">
                    <label class = "form-check-label" for = "allowEmail">이메일 수신 여부</label>
                </div>
                <div class = "form-check form-switch">
                    <input class = "form-check-input allow" type = "checkbox" value = "message" name = "allowMessage" id = "allowMessage">
                    <label class = "form-check-label" for = "allowMessage">광고성 문자 수신 여부</label>
                </div>
            </fieldset>
            <button class = "btn btn-outline-primary" type = "submit">가입</button>
        </form>
        <script>
            document.querySelector("#allowAll").addEventListener("change" , (e)=>{
                // 모두 동의 체크 여부
                const isChecked = e.target.checked;
                // 클래스가 allow 인 모든 요소의 참조값을 배열로 얻기
                const allows = document.querySelectorAll(".allow");

                // 반복문
                // for(let i = 0; i < allows.length; i++){
                //     // 모든 checkbox 의 check 상태를 변경
                //     allows[i].checked=isChecked;
                // }

                // 반복문 대신 forEach() 함수 사용
                allows.forEach((item)=>{
                    item.checked=isChecked;
                })
            });
        </script>
    </div>
</body>
</html>