<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test_jquery/Step03_effect2.jsp</title>
<style>
	.box{
		width: 100px;
		height: 100px;
		background-color: yellow;
		border: 1px solid red;
	}
</style>
<script src = "https://cdn.jsdelivr.net/npm/jquery@3.7.0/dist/jquery.min.js"></script>
</head>
<body>
	<button id = "hideBtn">숨기기</button>
	<button id = "showBtn">보이기</button>
	
	<!-- 숨기고 보이게 하는 버튼 -->
	<button id = "toggleBtn">토글</button>
	<div class = "box"></div>
	<script>
		$("#hideBtn").on("click" , function(){
			// $(".box").css("display" , "none");
			// $(".box").hide(1000);
			/*
			$(".box").hide(1000 , function(){
				alert("뿅!");
			});
			*/
			$(".box").hide({
				duration: 1000 ,
				complete: function(){
					alert("뿅!");
				}
			});
		});
		$("#showBtn").on("click" , function(){
			// $(".box").css("display" , "");
			$(".box").show();
		});
		$("#toggleBtn").on("click" , function(){
			$(".box").toggle();
		});
	</script>
</body>
</html>