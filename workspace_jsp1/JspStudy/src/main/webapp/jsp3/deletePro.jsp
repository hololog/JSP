<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp3/deletePro.jsp</title>
</head>
<body>
<%
// request 한글처리
request.setCharacterEncoding("utf-8");
// http가 들고온 num name => 서버 request에 저장
int num=Integer.parseInt(request.getParameter("num"));
String name=request.getParameter("name");
// 1단계 JDBC Driver.class 파일 가져오기
Class.forName("com.mysql.jdbc.Driver");
// 2단계 디비연결 => 연결정보 저장
String dbUrl="jdbc:mysql://localhost:3306/jspdb1?useSSL=false";
String dbId="root";
String dbPass="1234";
Connection con=DriverManager.getConnection(dbUrl, dbId, dbPass);
// 3단계 sql구문 만들기  delete from student where num=? and name=?
String sql="delete from student where num=? and name=?";
PreparedStatement pstmt=con.prepareStatement(sql);
pstmt.setInt(1, num);
pstmt.setString(2, name);
// 4단계 sql구문 실행
pstmt.executeUpdate();
%>
학생정보 삭제성공 <%=pstmt %>
<%
//cmd
//mysql -uroot -p jspdb1
//1234
// mysql> select * from student;
%>
</body>
</html>





