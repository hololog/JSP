<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jQuery/test5.jsp</title>
<script type="text/javascript" src="../script/jquery-3.6.0.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		//이벤트 함수 대상.bind('이벤트',함수),  대상.click() , 대상.mouseover()
		$('#btn1').bind('click',function(){
			$('#div1').html("클릭내용1");
			alert('클릭1');
			//이벤트 한번만 동작하고 멈춤
			$(this).unbind();
		});
		$('#btn2').click(function(){
			$('#div1').html("클릭내용2");
			alert("클릭2");
		});
	});
</script>
</head>
<body>
<div id="div1">내용</div>
<input type="button" value="버튼1" id="btn1">
<input type="button" value="버튼2" id="btn2">
</body>
</html>



