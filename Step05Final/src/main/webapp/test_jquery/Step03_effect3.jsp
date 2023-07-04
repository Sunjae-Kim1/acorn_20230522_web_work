<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test_jquery/Step03_effect3.jsp</title>
<style>
	.box{
		width: 100px;
		height: 100px;
		background-color: yellow;
		border: 1px solid red;
	}
	
	.box2{
		width: 100px;
		height: 100px;
		background-color: yellow;
		border: 1px solid red;
		/*
			transition 효과를 줄 수 있는 모든 ( all ) css 속성에 대해서 
			1초 ( 1s ) 동안 일정한 비율 ( linear ) 로 적용
		*/
		transition: all is linear;
	}
</style>
<script src = "https://cdn.jsdelivr.net/npm/jquery@3.7.0/dist/jquery.min.js"></script>
</head>
<body>
	<button id = "hideBtn">숨기기</button>
	<button id = "showBtn">보이기</button>
	
	<!-- 숨기고 보이게 하는 버튼 -->
	<button id = "toggleBtn">토글</button>
	
	<!-- 1초 동안 오른쪽으로 100 px 만큼 움직이게 하는 버튼 -->
	<button id = "moveBtn">움직이기1</button>
	
	<button id = "moveBtn2">움직이기2</button>
	<button id = "moveBtn3">움직이기3</button>
	<div class = "box"></div>
	<div class = "box2"></div>
	<script>
		$("#hideBtn").on("click" , function(){
			$(".box").fadeOut(1000 , function(){
				alert("뿅!");
			});
		});
		$("#showBtn").on("click" , function(){
			$(".box").fadeIn({
				duration: 2000 ,
				complete: function(){
					alert("짠!");
				}
			});
		});
		$("#toggleBtn").on("click" , function(){
			$(".box").fadeToggle();
		});
		$("#moveBtn").on("click" , function(){
			let mLeft = 0;
			let seq = setInterval(function(){
				mLeft += 1;
				
				/*
				if(mLeft >= 101){
					return;
				}
				*/
				
				$(".box").css("margin-left" , mLeft + "px");
				if(mLeft == 100){
					// Interval 의 순서값 ( sequence ) 값을 이용해서 취소한다.
					clearInterval(seq)
				}
			} , 10);
		});
		
		$("#moveBtn2").on("click" , function(){
			$(".box").animate({
				"margin-left": "+=100px"
			} , 1000);
		});
		
		$("#moveBtn3").on("click" , function(){
			// $(".box2").css("margin-left" , "100px");
			document.querySelector(".box2").style.marginLeft = "100px";
		});
	</script>
</body>
</html>