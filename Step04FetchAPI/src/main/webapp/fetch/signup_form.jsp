<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/fetch/signup_form.jsp</title>
<link rel="stylesheet"  href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
</head>
<body>
	<div class = "container">
		<h1> 회원 가입 폼 </h1>
        <form action="signup.jsp" method = "post">
            <div class = "mb-2">
                <label class = "form-label" for="id">아이디</label>
                <input class = "form-control" type = "text" id = "id" name = "id"/>
                <div class = "form-text">
                	4 ~ 10 글자로 작성해 주세요.
                </div>
                <div class = "invalid-feedback">
                     사용 불가 아이디 입니다.
                </div>
            </div>
            <div class = "mb-2">
                <label class = "form-label" for = "email">이메일</label>
                <input class = "form-control" type = "text" id = "email" name = "email">
                <div class = "invalid-feedback">
                    이메일 형식에 맞게 입력해 주세요.
                </div>
            </div>
            <button class = "btn btn-primary btn-sm" type = "submit" disabled = "disabled">가입</button>
        </form>
    </div>
    <script>
        let isFormValid = false;
        let isIdValid = false;
        let isEmailValid = false;

        // 아이디 입력란에 입력을 할때마다 호출되는 콜백함수 만들기
        document.querySelector("#id").addEventListener("input" , (e) =>{
        	// 1. 입력한 아이디를 읽어온다.
            const inputId = e.target.value;
        	// 입력한 아이디가 4 글자 이상 10 글자 이하인지 확인
        	const isLengthOk = inputId.length >= 4 && inputId.length <= 10;
        	if(!isLengthOk){
        		isIdValid = false;
        		e.target.classList.add("is-invalid");
                e.target.classList.remove("is-valid");
                buttonChange();
        		return; // 함수를 여기서 종료
        	}
        	// 2. fetch() 를 이용해서 서버에 보낸다.
        	fetch("checkid.jsp?inputId="+inputId)
        	.then(res=>res.json())
        	.then((data)=>{
        		// 3. 사용 가능 여부를 알아내서 동작
        		isIdValid = data.canUse;
        		if(isIdValid){
        			e.target.classList.add("is-valid");
                    e.target.classList.remove("is-invalid");
                }else{
                    e.target.classList.add("is-invalid");
                    e.target.classList.remove("is-valid");
                }
        		buttonChange();
        	});
        });

        document.querySelector("#email").addEventListener("input" , (e)=>{
            // 1. 입력한 이메일 주소를 읽어온다.
            const inputEmail = e.target.value;
            // 2. 이메일을 검증할 정규표현식 객체 생성
            let regex = new RegExp('[a-z0-9]+@[a-z]+\.[a-z]{2,3}');
            // 3. 이메일 형식에 맞는지 확인
            isEmailValid = regex.test(inputEmail);
            // 4. 부합하는지 여부에 따라서 is-valid , is-invalid 클래스 추가 or 삭제
            if(isEmailValid){
                e.target.classList.add("is-valid");
                e.target.classList.remove("is-invalid");
            }else{
                e.target.classList.add("is-invalid");
                e.target.classList.remove("is-valid");
            }

            buttonChange();
        });

        function buttonChange(){
            // 폼 전체가 유효한지 여부
            isFormValid = isIdValid && isEmailValid;
            if(isFormValid){
                document.querySelector("button[type=submit]").removeAttribute("disabled");
            }else{
                document.querySelector("button[type=submit]").setAttribute("disabled" , "disabled");
            }
        }
        </script>
</body>
</html>