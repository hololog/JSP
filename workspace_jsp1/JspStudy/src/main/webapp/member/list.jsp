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
<title>member/list.jsp</title>
</head>
<body>
<%

//회원목록
// 1단계 드라이버 로더
Class.forName("com.mysql.jdbc.Driver");
// 2단계 디비연결
String dbUrl="jdbc:mysql://localhost:3306/jspdb1?useSSL=false";
String dbId="root";
String dbPass="1234";
Connection con=DriverManager.getConnection(dbUrl, dbId, dbPass);
// 3단계 sql 구문만들기 
String sql="select * from member";
PreparedStatement pstmt=con.prepareStatement(sql);
// 4단계 sql구문실행 -> 결과 저장
ResultSet rs=pstmt.executeQuery();
// 5단계 while 다음행 -> 열접근 id pass name date 출력
// while(rs.next()){
// 	out.println(rs.getString("id"));
// 	out.println(rs.getString("pass"));
// 	out.println(rs.getString("name"));
// 	out.println(rs.getTimestamp("date"));
// 	out.println("<br>");
// }
%>
<table border="1">
<tr><td>아이디</td><td>비밀번호</td><td>이름</td><td>날짜</td></tr>
<%
while(rs.next()){
	%>
	<tr><td><%=rs.getString("id") %></td>
	    <td><%=rs.getString("pass") %></td>
	    <td><%=rs.getString("name") %></td>
	    <td><%=rs.getTimestamp("date") %></td></tr>
	<%
}
%>
</table>
</body>
</html>

