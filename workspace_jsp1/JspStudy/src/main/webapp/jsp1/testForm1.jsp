<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp1/testForm1.jsp</title>
</head>
<body>
<!-- html주석 -->
<%-- jsp주석 --%>
<%
// 자바, jsp 명령 : 한줄 주석 ctrl shift c
/* 
자바
여러줄
주석  ctrl shift /
*/
int a=10;
int b=20;
//콘솔창에 출력
System.out.println(a+b);
%>
<%=a+b %><br>
<%
// http://localhost:8080/JspStudy/jsp1/testForm1.jsp
%>
<form action="testPro1.jsp" method="get">
이름 : <input type="text" name="name"><br>
좋아하는 숫자 : <input type="text" name="num"><br>
<input type="submit" value="전송">
</form>

</body>
</html>
