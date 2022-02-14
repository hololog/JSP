<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jQuery/test2.jsp</title>
<script type="text/javascript" src="../script/jquery-3.6.0.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		// 대상.함수()
		// 전체대상 *, 태그, 표시 id=이름 => #이름, 표시 class=이름 => .이름
		// document, this 문자표시 없음
		$('*').css('color','green');
		$('h1').css('color','blue');
		$('#ta').css('color','red');
		$('.ta2').css('color','orange');
		// 태그[속성=값]
		$('input[type=text]').css('color','pink');
		// 짝수 태그:even , 홀수 태그:odd, 첫번째 태그:first , 마지막 태그:last
		$('tr:even').css('background','yellow');
		$('tr:odd').css('background','skyblue');
		$('tr:first').css('background','orange');
	});
</script>
</head>
<body>
<table>
<tr><td>번호</td><td>제목</td></tr>
<tr><td>1</td><td>제목1</td></tr>
<tr><td>2</td><td>제목2</td></tr>
<tr><td>3</td><td>제목3</td></tr>
<tr><td>4</td><td>제목4</td></tr>
</table>
<input type="text" name="id" value="kim">
<input type="password" name="pass" value="1234">
<h1>제목1</h1>
<h1 id="ta">제목2</h1>
<h1 class="ta2">제목3</h1>
내용
</body>
</html>


