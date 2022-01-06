<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp4/insertPro.jsp</title>
</head>
<body>
<%
// request 한글처리
request.setCharacterEncoding("utf-8");
// request에 저장 id pass name 폼에서 입력한 값 가져오기
String id=request.getParameter("id");
String pass=request.getParameter("pass");
String name=request.getParameter("name");
// 시스템에 있는 날짜와 시간 가져오기 => Timestamp내장객체 생성
Timestamp date=new Timestamp(System.currentTimeMillis());

// 1단계 드라이버 불러오기
Class.forName("com.mysql.jdbc.Driver");
// 2단계 디비연결
String dbUrl="jdbc:mysql://localhost:3306/jspdb1?useSSL=false";
String dbId="root";
String dbPass="1234";
Connection con=DriverManager.getConnection(dbUrl, dbId, dbPass);
// 3단계 sql 구문 만들기 insert
String sql="insert into member(id,pass,name,date) values(?,?,?,?)";
PreparedStatement pstmt=con.prepareStatement(sql);
pstmt.setString(1, id);
pstmt.setString(2, pass);
pstmt.setString(3, name);
pstmt.setTimestamp(4, date);
// 4단계 실행
pstmt.executeUpdate();
// 로그인 페이지 이동
response.sendRedirect("loginForm.jsp");
%>
</body>
</html>