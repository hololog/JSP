<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp5/updateForm.jsp</title>
</head>
<body>
<%
//http://localhost:8080/JspStudy/jsp5/updateForm.jsp?num=1
//서버 request에 저장 num 가져오기
int num=Integer.parseInt(request.getParameter("num"));

// 1단계 드라이버로더
Class.forName("com.mysql.jdbc.Driver");

// 2단계 디비연결
String dbUrl="jdbc:mysql://localhost:3306/jspdb1?useSSL=false";
String dbId="root";
String dbPass="1234";
Connection con=DriverManager.getConnection(dbUrl, dbId, dbPass);

// 3단계 sql구문 만들기
String sql="select * from board where num=?";
PreparedStatement pstmt=con.prepareStatement(sql);
pstmt.setInt(1, num);

// 4단계 sql구문 실행 => 결과 저장
ResultSet rs=pstmt.executeQuery();

// 5단계 if 다음행으로 이동 => 열접근 => 출력
if(rs.next()){
	%>
<form action="updatePro.jsp" method="post">
<input type="hidden" name="num" value="<%=rs.getInt("num")%>">
<table border="1">
<tr><td>이름</td><td><input type="text" name="name" value="<%=rs.getString("name") %>"></td></tr>
<tr><td>비밀번호</td><td><input type="password" name="pass"></td></tr>
<tr><td>제목</td><td><input type="text" name="subject" value="<%=rs.getString("subject")%>"></td></tr>
<tr><td>내용</td><td><textarea name="content" rows="10" cols="20"><%=rs.getString("content")%></textarea></td></tr>
<tr><td colspan="2"><input type="submit" value="글수정"></td></tr>
</table>
</form>	
	<%
}
%>
</body>
</html>