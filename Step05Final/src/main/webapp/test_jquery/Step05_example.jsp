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
</style>
</head>
<body>
	<div class = "container">
		<div id = "dropZone">
			<p> 파일을 여기에 넣으세요. </p>
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
		});
	</script>
</body>
</html>