<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>promise/test01.jsp</title>
</head>
<body>
	<h3> 콜백 지옥??? </h3>
	<script>
		// 가상의 주어진 작업을 처리하는 함수 ( 주어진 작업을 처리하는데 random 한 시간이 걸린다고 가정 )
		function work(job , callback){
			// 0 ~ 5000 사이 랜덤 숫자 얻기
			let ranTime = Math.random()*5000;
			
			setTimeout(()=>{
				console.log(job + " 을 ( 를 ) 처리했습니다.");
				callback(); // 전달받은 함수를 호출한다.
			} , ranTime);
		}
		// 냉장고 문을 여는 작업을 하고 해당 작업이 끝나면 내가 전달할 함수를 호출
		work("냉장고 문 열기" , function(){
			work("코끼리를 냉장고에 넣기" , function(){
				work("냉장고 문 닫기" , function(){
					// 순서를 정하려면 계속 추가 -> 많으면 많을수록 콜백 지옥
				});
			});
		});
		
		let p1 = new Promise(function(resolve){
			/*
				함수의 인자로 전달되는 resolve 는 함수이다.
				resolve 는 작업을 완료했을때 호출해야 하는 함수
				resolve 함숙 호출되면 ,then() 안에 있는 함수가 자동 호출
			*/
			resolve();
		});
		p1.then(function(){
			console.log("then 안에 있는 함수 호출");
		});
	</script>
</body>
</html>