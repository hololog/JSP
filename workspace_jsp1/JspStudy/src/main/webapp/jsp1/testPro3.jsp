<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp1/testPro3.jsp</title>
</head>
<body>
<%
//request 한글처리
request.setCharacterEncoding("utf-8");
// request저장된 값을 변수에 저장
String id=request.getParameter("id");
String pass=request.getParameter("pass");
String ta=request.getParameter("ta");
String ra=request.getParameter("ra");
// String ch=request.getParameter("ch");
// 체크박스는 ch=여행,ch=게임 이름하나에 값을 여러개 들고옴 => 배열변수 저장
String ch[]=request.getParameterValues("ch");
String sel=request.getParameter("sel");

%>
텍스트 상자 : <%=id %><br>
비밀번호 상자 : <%=pass %><br>
긴텍스트 상자 : <%=ta %><br>
라디오박스: <%=ra %><br>
체크박스: 
<%
for(int i=0;i<ch.length;i++){
	%><%=ch[i]%> <%
}
%>
<br>
목록상자 : <%=sel %><br>   
</body>
</html>


