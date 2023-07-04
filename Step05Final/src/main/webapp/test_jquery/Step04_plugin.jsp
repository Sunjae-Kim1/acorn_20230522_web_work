<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test_jquery/Step04_plugin.jsp</title>
</head>
<body>
<p>p1</p>
<p id = "one">p2</p>
<p id = "two">p3</p>

<script src = "https://cdn.jsdelivr.net/npm/jquery@3.7.0/dist/jquery.min.js"></script>
<!-- JQuery plugin js 로딩 -->
<script src = "js/jquery.gura.js"></script>
<script>
	
	$("#one").gura();
	$("#two").gura({
		msg: "오잉?" ,
		color: "#ff0000"
	});
</script>

</body>
</html>