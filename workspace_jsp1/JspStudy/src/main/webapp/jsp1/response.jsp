<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp1/response.jsp</title>
</head>
<body>
<h1>jsp1/response.jsp</h1>
<%
// response 내장객체 : 서블릿이 처리한 결과 파일 java(html출력)을 저장  
//                 : 처리결과를 웹서버에 전달=> http전달 => 사용자컴퓨터에 전달
//                 : 서버가 클라이언트에게 설정정보 전달
// response.addCookie("쿠키값") => 서버에서 클라이언트에게 값을 저장
// response.setContentType("text/html; charset=UTF-8") => 서버가 클라이언트에게 내용타입 설정
// response.setHeader("헤더이름", "값");  ("accept-language", "ko-KR")
// => 서버가 클라이언트에게 한글 설정 변경 
// response.sendRedirect("이동할페이지")=> 서버 응답결과 보여주고 클라이언트에게 다시 이동해라 설정
response.sendRedirect("request.jsp");
%>
</body>
</html>