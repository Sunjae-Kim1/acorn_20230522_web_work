<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test_jquery/hello.jsp</title>
<script src = "https://cdn.jsdelivr.net/npm/jquery@3.7.0/dist/jquery.min.js"></script>
</head>
<body>
	<div class = "container">
		<input type = "text" id = "inputMsg" placeholder = "문자열 입력"/>
		<button id = "sendBtn">전송</button>
		<p id = "result"></p>
	</div>
	
	<div>div1</div>
	<div class = "my-class">div2</div>
	<div class = "my-class">div3</div>
	<div id = "one">div4</div>
	
	<script>
		// 위의 input 요소에 문자열을 입력하고 전송버튼을 누르면 입력한 문자열이 p 요소의 innerText 에 출력
		
		/*
		document.querySelector("#sendBtn").addEventListener("click" , () => {
			const msg = document.querySelector("#inputMsg").value;
			document.querySelector("#result").innerText = msg;
		});
		
		$("div").first().text("hi") ==> "div" Jquery 배열의 1 번째 text 를 "hi" 로 덮어쓴다.
		
		$("#inputMsg").val("morning").css("color" , "red").css("background-color" , "yellow")
		
		let a = $("#one").text() ==> 'hi' String
		
		let b = $("#one").text("hi") ==> ce.fn.init [div#one] 배열
		
		$("#one").attr("style" , "color:red;"); ==> <div id="one" style="color:red;">div4</div>
		
		위의 것을 간편하게 ==> $("#one").css("color" , "red") 뒤에 .css 추가 가능
		*/
		
		$("sendBtn").on("click" , () => {
			const msg = $("#inputMsg").val();
			$("#result").text(msg);
		});
	</script>
</body>
</html>