<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test_jquery/Step05_example.jsp</title>
<style>
	 #dropZone{
      width: 400px;
      height: 400px;
      border: 2px dashed red;
      border-radius: 20px;
      display: flex;
      justify-content: center;
        align-items: center;
   }
   #preview{
   	display: none;
   	object-fit: cover;
   	width: 100%;
   	height: 100%;
   	border-radius: 20px;
   }
</style>
</head>
<body>
	<div class = "container">
		<div id = "dropZone">
			<p> 파일을 여기에 넣으세요. </p>
			<img src = "" id = "preview">
		</div>
		<ul id = "infoList">
		
		</ul>
	</div>
	<script src = "https://cdn.jsdelivr.net/npm/jquery@3.7.0/dist/jquery.min.js"></script>
	<script>
		$("#dropZone").on("dragover" , (e) => {
			e.preventDefault();
		}).on("drop" , (e) => {
			e.preventDefault();
			console.log(e);
			// drop 된 파일에 대한 정보 얻어오기
			const file = e.originalEvent.dataTransfer.files[0];
			// drop 된 파일 명
			const fileName = file.name;
			// drop 된 파일의 mime Type
			const mimeType = file.type;
			// drop 된 파일의 정보를 설명할 문자열을 만들기
			const info=`파일명:\${fileName} 파일의 type:\${mimeType}`;

			// li 요소를 만들어서 정보를 출력하고 #infoList 요소의 1 번째 자식요소로 추가하기
			$("<li>").text(info).prependTo("#infoList");
			
			// mimeType 이 image 로 시작하는 문자열인지 확인할 정규표현식
			const reg = /^image/;
			// 만일 image 라는 문자열로 시작하지 않는다면
			if(!reg.test(mimeType)){
				alert("이미지 파일을 넣으세요.");
				return;
			}
			// 파일 리더 객체를 생성해서
			const reader = new FileReader();
			// 읽어드리고
			reader.readAsDataURL(file);
			// 다 읽으면 실행할 함수 등록
			reader.onload = (event) => {
				const data = event.target.result;
				$("#preview").attr("src" , data).show();
				$("#dropZone p").hide();
			};
		});
	</script>
</body>
</html>