<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이름_인터페이스구현_실기시험_파일_test2.html</title>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/script/jquery-3.6.0.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$('#btn').click(function(){
// 			alert("클릭");
			$.ajax({
				url:'${pageContext.request.contextPath }/board/boardjson',
				dataType:'json',
				success:function(rdata){
					$.each(rdata,function(index,item){
						date=new Date(item.date);
						d=date.getFullYear()+"."+(date.getMonth()+1)+"."+date.getDay();
$('table').append('<tr><td>'+item.num+'</td><td>'+item.subject+'</td><td>'+item.name+'</td><td>'+d+'</td><td>'+item.readcount+'</td></tr>');
					});
				}
			});
		});
	});//
</script>
</head>
<body>
<h3>3번)글조회버튼 클릭시 게시판글 가져와서 출력하세요</h3>

<h6>글조회 버튼 클릭시 게시판 글목록 보이게 하세요</h6>
<input type="button" value="글조회" id="btn">
<table border="1">
<tr><td>번호(num)</td><td>제목(subject)</td><td>작성자(name)</td>
    <td>날짜(date)</td><td>조회수(readcount)</td></tr>
</table>
</body>
</html>