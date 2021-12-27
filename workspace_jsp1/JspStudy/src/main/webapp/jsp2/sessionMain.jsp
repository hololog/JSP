<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp2/sessionMain.jsp</title>
</head>
<body>
<!-- 세션id값가져오기 -->
<%=session.getAttribute("id") %>님이 로그인 하셨습니다. 
<a href="sessionLogout.jsp">로그아웃</a>
</body>
</html>