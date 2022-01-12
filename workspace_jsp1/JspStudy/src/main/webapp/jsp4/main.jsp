<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp4/main.jsp</title>
</head>
<body>
<%
String id=(String)session.getAttribute("id");
//세션값이 비어있으면 (null 이면 ) => loginForm.jsp 이동
if(id==null){
	response.sendRedirect("loginForm.jsp");
}
%>
<%=id %>님 로그인 하셨습니다.
<input type="button" value="로그아웃" onclick="location.href='logout.jsp'"><br>
<a href="info.jsp">회원정보조회</a><br>
<a href="updateForm.jsp">회원정보수정</a><br>
<a href="deleteForm.jsp">회원정보삭제</a><br>
<%
//로그인 한 회원(세션 있음)
// 로그인 중에 admin 회원만 조회
if(id!=null){
	if(id.equals("admin")){
		%>
		<a href="list.jsp">회원목록</a>
		<%
	}
}
%>

</body>
</html>



