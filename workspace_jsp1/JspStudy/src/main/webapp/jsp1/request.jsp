<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp1/request.jsp</title>
</head>
<body>
<%
//request 내장객체 안에는  태그정보, 서버정보, 클라이언트정보, 세션값, 쿠키값 저장,http정보
// HTTP (html을 전송하는 통신규약)가 사용자 컴퓨터에서 요청정보를 들고 서버로 전달
// FTP (File을 전송하는 통신규약), SMTP(메일 통신규약)

%>
서버 정보 :<%=request.getServerName() %><br>
서버 포트 정보 : <%=request.getServerPort() %><br>
요청주소 URL :<%=request.getRequestURL() %><br>
요청주소 URI : <%=request.getRequestURI() %><br>
프로토콜(통신규약) : <%=request.getProtocol() %><br>
데이터전송방식 : <%=request.getMethod() %><br>
프로젝트경로 : <%=request.getContextPath() %><br>
물리적인경로 : <%=request.getRealPath("/") %><br>
클라이언트IP주소 : <%=request.getRemoteAddr() %><br>
http헤더 정보 : <%=request.getHeader("accept") %><br>
http헤더 정보(언어) : <%=request.getHeader("accept-language") %><br>
http헤더 정보(브라우저) : <%=request.getHeader("user-agent") %><br>
http헤더 정보(연결) : <%=request.getHeader("connection") %><br>
</body>
</html>










