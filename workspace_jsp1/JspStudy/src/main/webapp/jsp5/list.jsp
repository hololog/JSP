<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp5/list.jsp</title>
</head>
<body>
<%
// 1단계 드라이버 불러오기
Class.forName("com.mysql.jdbc.Driver");
// 2단계 디비연결 
String dbUrl="jdbc:mysql://localhost:3306/jspdb1?useSSL=false";
String dbId="root";
String dbPass="1234";
Connection con=DriverManager.getConnection(dbUrl, dbId, dbPass);
// 3단계 sql 구문 만들기 select * from board
String sql="select * from board";
PreparedStatement pstmt=con.prepareStatement(sql);
// 4단계 sql 구문 실행 => 결과 저장
ResultSet rs=pstmt.executeQuery();
// 5단계 다음행으로 접근 => 열접근 num name subject readcount date 출력 
%>
<table border="1">
<tr><td>글번호</td><td>글쓴이</td><td>글제목</td><td>조회수</td><td>글쓴날짜</td></tr>
<%
while(rs.next()){
	%>
	<tr><td><%=rs.getInt("num") %></td>
	    <td><%=rs.getString("name") %></td>
	    <td><a href="content.jsp?num=<%=rs.getInt("num")%>"><%=rs.getString("subject") %></a></td>
	    <td><%=rs.getInt("readcount") %></td>
	    <td><%=rs.getTimestamp("date") %></td></tr>
	<%
}
%>
</table>
</body>
</html>
