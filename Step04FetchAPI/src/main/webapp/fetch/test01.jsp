<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/fetch/test01.jsp</title>
</head>
<body>
	<h1> fetch 함수 테스트 </h1>
	<button id = "myBtn">누르기</button>
	<a href = "${pageContext.request.contextPath}/index.jsp">누르기</a>
	<script>
		document.querySelector("#myBtn").addEventListener("click" , ()=>{
			
			const msg = prompt("메세지 입력"); // 1.
			
			console.log("입력완료"); // 2.
			
			console.log("-----------"); // 3.
			
			// fetch 함수가 무엇을 의미하는지 알아보기
			// 위의 링크를 눌렀을 때와 차이점
			fetch("${pageContext.request.contextPath}/index.jsp") // 5.
			.then(function(response){
				return response.text();
			})
			.then(function(data){
				console.log(data);
			});
			console.log("요청완료"); // 4.
		});
	</script>
</body>
</html>