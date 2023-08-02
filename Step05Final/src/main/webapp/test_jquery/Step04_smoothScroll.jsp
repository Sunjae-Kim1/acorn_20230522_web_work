<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test_jquery/Step04_smoothScroll.jsp</title>
   <style>
      /* 컨텐츠가  .nav 에 가려 지지 않도록 padding 부여 */
      body{
         margin-top: 0;
         padding-top: 50px;
      }
      .spacer{
         height: 500px;
         background-color: #999;
      }
      /* .nav 를 좌상단 고정된 위치에 배치 */
      .nav{
         position: fixed;
         top: 0;
         left: 0;
         background-color: #0f0;
         width: 100%;
         height: 50px;
         opacity: 0.7;
      }
      /* ul 의 기본 스타일 제거 */
      .nav ul{
         list-style-type: none;
         padding: 0;
         margin: 0;
      }
      /* li 를 가로 배치 하고 좌우 padding 부여*/
      .nav ul li{
         float: left;
         padding: 0 20px;
      }

      .nav a{
         text-decoration: none;
         color: blue;
      }

      .nav a.active{
         text-decoration: underline;
         font-weight: bold;
         color: red;
      }
   </style>
</head>
<body>
	<div class="nav">
		<ul>
			<li><a class="active" href="#one">one</a></li>
			<li><a href="#two">two</a></li>
			<li><a href="#three">three</a></li>
		</ul>
	</div>
	<div class="spacer"></div>
	<p id="one"><strong>one</strong> Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dolorem ipsum quo doloremque tempore et laboriosam officiis, deserunt ipsam reprehenderit blanditiis, repellendus cupiditate consequatur quae. Eligendi explicabo suscipit ut tenetur velit.</p>
	<div class="spacer"></div>
	<p id="two"><strong>two</strong> Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dolorem ipsum quo doloremque tempore et laboriosam officiis, deserunt ipsam reprehenderit blanditiis, repellendus cupiditate consequatur quae. Eligendi explicabo suscipit ut tenetur velit.</p>
	<div class="spacer"></div>
	<p id="three"><strong>three</strong> Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dolorem ipsum quo doloremque tempore et laboriosam officiis, deserunt ipsam reprehenderit blanditiis, repellendus cupiditate consequatur quae. Eligendi explicabo suscipit ut tenetur velit.</p>
	<div class="spacer"></div>
	
	<script src = "https://cdn.jsdelivr.net/npm/jquery@3.7.0/dist/jquery.min.js"></script>
	<script src = "js/jquery.smooth-scroll.js"></script>
	<script>
			$(".nav a").smoothScroll({
				offset: -50 ,
				afterScroll: function(){
					// 모든 a 요소의 active 클래스 제거
					$(".nav a").removeClass("active");
					// 클릭한 a 요소에 active 클래스 추가
					$(this).addClass("active");
				}
			});
	</script>
</body>
</html>