<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp2/application.jsp</title>
</head>
<body>
<%
//application내장객체 : 웹서버,웹애플리케이션서버 정보를 저장
//                   : 서버가 start 되면 기억장소 만들어짐
//                   : 서버가 stop 되면 기억장소 없어짐
//                   : 페이지 상관없이, 유저 상관없이 값이 유지 
%>
서버정보 : <%=application.getServerInfo() %><br>
서버물리적인경로 : <%=application.getRealPath("/") %><br>
<%
// pageContext 내장객체 : 현페이지 정보를 저장하는 내장객체

// out내장객체 : 출력정보를 저장하는 내장객체
out.println("출력");
//출력 마감
out.close();
out.println("마감 후 출력");
%>
</body>
</html>