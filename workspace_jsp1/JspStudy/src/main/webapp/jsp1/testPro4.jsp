<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp1/testPro4.jsp</title>
</head>
<body>
<%
//한글처리
request.setCharacterEncoding("utf-8");
//request에 저장된 파라미터값 가져와서 변수에 저장
String id=request.getParameter("id");
String pass=request.getParameter("pass");
String name=request.getParameter("name");
String snum1=request.getParameter("snum1");
String snum2=request.getParameter("snum2");
String gender=request.getParameter("gender");
String hobby[]=request.getParameterValues("hobby");
String select=request.getParameter("select");
String textarea=request.getParameter("textarea");
%>
아이디 : <%=id %><br>
비밀번호 : <%=pass %><br>
이름 : <%=name %><br>
주민번호 : <%=snum1 %> - <%=snum2 %><br>
성별 : <%=gender %><br>
취미 : 
<%
//hobby null이 아니면
if(hobby != null){
	for(int i=0;i<hobby.length;i++){
		%><%=hobby[i]%> <%
	}
}
%>
<br>
좋아하는 과목 : <%=select %><br>
한마디 : <%=textarea %><br>
</body>
</html>

