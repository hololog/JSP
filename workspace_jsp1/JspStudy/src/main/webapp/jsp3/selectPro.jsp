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
<title>jsp3/selectPro.jsp</title>
</head>
<body>
<%
// http가 들고간 num 정보를 => 서버 request에 저장
int num=Integer.parseInt(request.getParameter("num"));
// 1단계 JDBC 프로그램 가져오기
Class.forName("com.mysql.jdbc.Driver");
// 2단계 디비연결 
String dbUrl="jdbc:mysql://localhost:3306/jspdb1?useSSL=false";
String dbId="root";
String dbPass="1234";
Connection con=DriverManager.getConnection(dbUrl, dbId, dbPass);
// 3단계 sql 구문 만들기 select * from student where num=1;
String sql="select * from student where num=?";
PreparedStatement pstmt=con.prepareStatement(sql);
pstmt.setInt(1, num);
// 4단계 sql구문 실행해서 => 결과저장
ResultSet rs=pstmt.executeQuery();
// 5단계 행접근 => 열접근해서 출력
while(rs.next()){
	// true 행 있음 => 열접근
	%>
	<%=rs.getInt("num")%>, <%=rs.getString("name") %><br>
	<%		
}
%>
</body>
</html>


