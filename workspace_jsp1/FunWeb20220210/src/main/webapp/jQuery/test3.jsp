<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jQuery/test3.jsp</title>
<script type="text/javascript" src="../script/jquery-3.6.0.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
// 		대상.함수() ,  스타일시트 대상.css() , 태그 속성 대상.attr()
// 		$('img').attr('width','100');
// 		$('img').attr('height','100');
// 		$('img').attr('src','2.jpg');
		$('img').attr({
			width:200,
			height:200,
			src:'3.jpg'
		});
	});
</script>
</head>
<body>
<img src="1.jpg" width="400" height="300">
</body>
</html>
