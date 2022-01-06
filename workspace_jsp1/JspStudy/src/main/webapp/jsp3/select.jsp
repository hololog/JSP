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
<title>jsp3/select.jsp</title>
</head>
<body>
<%
// 1단계 JDBC프로그램 가져오기
Class.forName("com.mysql.jdbc.Driver");
// 2단계 디비연결 => 연결정보 저장 Connection내장객체
String dbUrl="jdbc:mysql://localhost:3306/jspdb1?useSSL=false";
String dbId="root";
String dbPass="1234";
Connection con=DriverManager.getConnection(dbUrl, dbId, dbPass);
// 3단계 sql구문을 만들기 PreparedStatement
String sql="select * from student";
PreparedStatement pstmt=con.prepareStatement(sql);
// 4단계 sql구문을 실행 => 실행결과 저장 ResultSet => select 결과를 저장하는 내장객체
ResultSet rs=pstmt.executeQuery();
// 5단계 rs 저장된 내용을 접근해서 행 열 데이터 가져와서 출력
// rs.next() 다음행으로 접근 => 데이터 있으면 true/ 데이터 없으면 false
// out.println("첫번째 행 next() : "+rs.next());
// out.println("두번째 행 next() : "+rs.next());
// out.println("세번째 행 next() : "+rs.next());

// while(rs.next()){
// 	//true : 데이터 있으면 : 열 접근 1번열("num"열) 2번열("name"열)
// 	out.println(rs.getInt("num"));
// 	out.println(rs.getString("name"));
// 	out.println("<br>");
// }

while(rs.next()){
	%>    
	<%=rs.getInt("num") %> : <%=rs.getString("name") %><br>
	<%
}
%>

</body>
</html>
