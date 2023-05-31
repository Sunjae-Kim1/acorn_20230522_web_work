<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/promise/test04.jsp</title>
</head>
<body>
	<h1> Promise 테스트 </h1>
	<script>
		new Promise(function(resolve){
			resolve();
		}).then(function(result){
			console.log("then() 안에 있는 함수 호출");
			// 여기서 다시 Promise 객체를 리턴하면 다시 .then() 을 호출 가능
			return new Promise(function(resolve){
				resolve();
			});
		}).then(function(){
				console.log("2 번쨰 then() 안에 있는 함수 호출");
		});
	</script>
</body>
</html>