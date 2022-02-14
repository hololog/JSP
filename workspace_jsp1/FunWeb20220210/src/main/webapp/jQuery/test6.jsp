<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jQuery/test6.jsp</title>
<script type="text/javascript" src="../script/jquery-3.6.0.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		//버튼을 클릭했을때 
		$('#btn').click(function(){
// 			alert('클릭');
//           대상.val()  => value값
// 			alert($('#myid').val());
// 			alert($('#mypass').val());
			if($('#myid').val()==""){
				alert("아이디 입력하세요");
				$('#myid').focus();
				return;
			}
			// 비밀번호 비어있으면 "비밀번호 입력하세요" 포커스 함수호출한 곳으로 되돌아감
			if($('#mypass').val()==""){
				alert("비밀번호 입력하세요");
				$('#mypass').focus();
				return;
			}
			// 서버로 전송
			$('#fr').submit();
		});
	});
</script>
</head>
<body>
<form action="a.jsp" method="get" id="fr">
	아이디 : <input type="text" name="id" id="myid"><br>
	비밀번호 : <input type="password" name="pass" id="mypass"><br>
	<input type="button" value="로그인" id="btn">
</form>
</body>
</html>