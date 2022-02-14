<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jQuery/test4.jsp</title>
<script type="text/javascript" src="../script/jquery-3.6.0.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		// 대상.함수(),   대상에 내용을 내용변경 대상.html(), 대상에 뒤부분에 내용추가  대상.append()
		$('#aa').html('내용변경');
		$('table').append('<tr><td>1</td><td>제목1</td></tr>');
	});
</script>
</head>
<body>
<div id="aa">내용</div>
<table border="1">
<tr><td>번호</td><td>제목</td></tr>
</table>
</body>
</html>




