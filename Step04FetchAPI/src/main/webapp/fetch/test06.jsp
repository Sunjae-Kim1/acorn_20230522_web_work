<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/fetch/test06.jsp</title>
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
			.then(res=>res.json()) // 서버에서 응답한 문자열이 JSON 형식이면 , res.json() 으로 바꾼다.
			.then((data)=>{
				// data 는 ["어쩌구" , "저쩌구" , "이렇고"] 형식의 실제 배열
				console.log(data);
				
				// 반복문
				for(let i = 0; i < data.length; i++){
					// backtick 을 이용해 li 안에 메세지를 출력
					let li = `<li>\${data[i]}</li>`;
					// ul 요소가 끝나기 직전에 HTML 로 평가해서 추가
					document.querySelector("#msgList").insertAdjacentHTML("beforeend" , li);
				}
			})
			.catch((err)=>{
				// err 에 에러 메세지가 들어있다.
				console.log(err);
			});
		});
	</script>
</body>
</html>