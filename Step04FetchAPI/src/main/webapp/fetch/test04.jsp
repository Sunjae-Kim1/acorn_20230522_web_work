<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/fetch/test04.jsp</title>
</head>
<body>
	<button id = "moreBtn">더보기</button>
	<ul id = "msgList">
		<li>하나</li>
		<li>두울</li>
		<li>세엣</li>
	</ul>
	
	<script>
		// 문자열을 입력하고 전송 버튼을 눌렀을 떄 입력한 문자열을 읽어와서 send.jsp 페이지로 전송
		document.querySelector("#moreBtn").addEventListener("click" , ()=>{
			fetch("get_msg2.jsp")
			.then(res=>res.text())
			.then((data)=>{
				// data 는 ["어쩌구" , "저쩌구" , "이렇고"] 형식의 JSON 문자열
				console.log(data);
				// 실제 배열(Object) 로 바꾸기 (JSON 형식에 어긋나면 에러 발생)
				const list = JSON.parse(data);
				console.log(list);
				// 반복문
				for(let i = 0; i < list.length; i++){
					// li 요소 만들기
					let li = document.createElement("li");
					// innerText 에 메세지를 출력
					li.innerText = list[i];
					// ul 에 append
					document.querySelector("#msgList").append(li);
				}
			});
		});
	</script>
</body>
</html>