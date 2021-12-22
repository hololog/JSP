<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp1/testPro1.jsp</title>
</head>
<body>
<h1>jsp1/testPro1.jsp</h1>
<%
// 사용자 웹브라우저 주소 입력 (서버에 요청)
// http://localhost:8080/JspStudy/jsp1/testPro1.jsp?name=kim&num=1
// => http가 요청정보(testPro1.jsp?name=kim&num=1) localhost:8080 서버를 찾아감 
// => 웹 서버에 도착 => testPro1.jsp 찾음 => 처리작업 필요(jsp -> html 변경)

// => 처리서버 : 웹 애플리케이션 서버가 전달받아서 처리 
// 1. 요청정보를 서버에 저장 => 서버에 저장공간 만들기 
//    => request 내장객체 객체생성(사용자 요청정보 저장공간 만들기) 
//       response 내장객체 객체생성(서버 처리결과정보 저장공간 만들기) 
// 2. web.xml 참조(처리 담당자 지정:서블릿 자동으로 지정) 
// => 처리당담자가 request정보를 이용하여 처리하고 html변경해서 response에 저장
// => 처리당담자가 response정보를 웹 서버에 전달

// => 웹 서버가 찾은 파일을 http전달 
// => http는 사용자 컴퓨터 전달

// request객체 (멤버변수,멤버함수) 정의
// request안에  name=kim&num=1  저장
// request에서 출력하기 위해서 가지고 옴

// request에 저장된 값을 문자열로 저장되어있음
%>
이름 : <%=request.getParameter("name") %><br>
좋아하는 숫자 : <%=request.getParameter("num") %><br>
<%
String sname=request.getParameter("name");
String snum=request.getParameter("num");
%>
변수에 저장한 이름 : <%=sname %><br>
변수에 저장한 좋아하는 숫자 : <%=snum %><br>
변수에 저장한 좋아하는 숫자 + 100 : <%=snum+100 %> => 문자열 연결<br>
<%
// 문자열 1 (참조형)을 정수형(기본형)으로 변경
int num=Integer.parseInt(snum);
%>
변수에 저장한 좋아하는 숫자를 정수형 변경 + 100 : <%=num+100 %> => 숫자 더하기<br>
</body>
</html>


