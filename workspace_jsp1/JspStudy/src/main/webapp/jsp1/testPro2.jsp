<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp1/testPro2.jsp</title>
</head>
<body>
<%
//데이터 전송 방식이 post 방식일 경우에 request내장객체 한글처리 필요
// request.getParameter 하기전에 설정
request.setCharacterEncoding("utf-8");

//폼에서 입력한 정보를 http가 서버에 전달
//서버에서 기억장소 request를 만들어서 http가 들고온 요청정보를 request 저장

// request에서 nikname, age을 가져와서 변수에 저장 => 출력
String snikname= request.getParameter("nikname");
String sage= request.getParameter("age"); 
%>
별명 : <%=snikname %><br>
나이 : <%=sage %><br>
<%
// 나이가 20보다 작으면 "미성년", 20보다 크거나 같으면 "성인"
// sage 문자열을 정수형으로 변경
// int age=Integer.parseInt(sage);
int age=Integer.parseInt(request.getParameter("age"));

if(age < 20){
	%> <%=age %>세 미성년<% //조건 참 실행문
}else{
	%> <%=age %>세 성인<% //조건 거짓 실행문
}
%>
</body>
</html>




