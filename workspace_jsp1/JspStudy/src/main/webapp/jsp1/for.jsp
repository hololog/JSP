<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp1/for.jsp</title>
</head>
<body>
<%
int a=10;
int b[]={10,20}; //b[0] b[1]

		for(int i=0;i<=1;i++){
			// 0 1
			%><%=i%> : <%=b[i]%><br><%
		}
		
String c[]={"여행","게임", "운동"}; //c[0] c[1]
		
		%>배열기억장소 개수 : <%=c.length%><br><%
		
		for(int i=0;i<c.length;i++){
			%><%=c[i]%> <%
		}
%>
</body>
</html>
