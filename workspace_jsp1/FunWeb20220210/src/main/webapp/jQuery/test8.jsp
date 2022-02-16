<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jQuery/test8.jsp</title>
<script type="text/javascript" src="../script/jquery-3.6.0.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		// xml(extensible markup language) : 확장된 태그를 이용해서 데이터 표현
// 		<member>
// 			<person><id>kim</id><name>김길동</name></person>
// 			<person><id>lee</id><name>이길동</name></person>
// 			<person><id>park</id><name>박길동</name></person>
// 		</member>
//       JSON ( 제이슨 , JavaScript Object Notation ) :
// 	      속성-값 쌍 또는 "키-값 쌍"으로 이루어진 데이터 오브젝트를 전달하기 위해 인간이 읽을 수 있는 
// 	      텍스트를 사용하는 개방형 표준 포맷
//         자바스크립 배열 형태 데이터 표현
// 		[
// 			{"id":"kim","name":"김길동"},
// 			{"id":"lee","name":"이길동"},
// 			{"id":"park","name":"박길동"}
// 		]
		//자바스크립트 배열
		var array=[
			{"id":"kim","name":"김길동"},
			{"id":"lee","name":"이길동"},
			{"id":"park","name":"박길동"}
		];
		// 반복문    $.each(대상변수,함수)
		$.each(array,function(index,item){
// 			alert(index);
// 			alert(item.id);
// 			alert(item.name);
// 			$('body').append(item.id+","+item.name+"<br>");
			$('table').append("<tr><td>"+item.id+"</td><td>"+item.name+"</td></tr>");
		});
		
	});//
	
</script>
</head>
<body>
<table border="1">
<tr><td>아이디</td><td>이름</td></tr>
</table>
</body>
</html>