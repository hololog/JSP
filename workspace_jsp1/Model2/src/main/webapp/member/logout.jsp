<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/logout.jsp</title>
</head>
<body>
<%
// 세션내장객체 삭제
// 1. 브라우저 모두 닫기
// 2. 30분이상 작업이 없을때 
// 3. 세션내장객체 전체삭제 명령(로그아웃)
session.invalidate();
%>
<script type="text/javascript">
	alert("로그아웃");
	location.href="main.jsp";
</script>
</body>
</html>

