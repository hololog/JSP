<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp3/insertPro.jsp</title>
</head>
<body>
<%
//한글처리
request.setCharacterEncoding("utf-8");
// request 내장객체  http 요청 정보를 저장
// request 에 저장된 num name 파라미터 가져와서 변수에 저장
int num=Integer.parseInt(request.getParameter("num"));
String name=request.getParameter("name");

//사용자웹브라우저 => 웹서버(웹애플리케이션서버) => 데이터베이스서버 접속 
//JDBC - 웹서버 디비서버 연결하는 프로그램 설치
// src - main - webapp - WEB-INF - lib 폴더안에 
// mysql-connector-java-5.1.39-bin.jar 넣기
//1단계 : 설치한 프로그램 가져오기
Class.forName("com.mysql.jdbc.Driver");
//2단계 : 가져온 프로그램을 이용해서 디비서버 연결 => 연결정보를 저장(자바내장객체)
String dbUrl="jdbc:mysql://localhost:3306/jspdb1?useSSL=false";
String dbId="root";
String dbPass="1234";
Connection con=DriverManager.getConnection(dbUrl, dbId, dbPass);
//3단계 : 연결정보를 이용해서 sql구문을 만들고 실행할 준비(자바내장객체)
// con연결정보를 이용해서 메서드prepareStatement() 호출해서 문자열을 sql구문으로 변경하는 작업
// => sql구문을 실행할수 내장객체 저장
// java폴더 sql폴더 PreparedStatement 내장객체 
// insert into 테이블이름(열이름,열이름) 
// values(값,'값');
// String sql="insert into student(num,name) values(값,'값')";
// String sql="insert into student(num,name) values(1,'홍길동')";
//                                             "+num+"   "+name+" 
// String sql="insert into student(num,name) values("+num+",'"+name+"')";
String sql="insert into student(num,name) values(?,?)";
PreparedStatement pstmt =con.prepareStatement(sql);
//첫번째 ?값 setInt 넣기
pstmt.setInt(1, num);
//두번째 ?값 setString 
pstmt.setString(2, name);		

//4단계 : executeUpdate()호출 sql구문을 실행  insert,update,delete=> OK
pstmt.executeUpdate();
%>
학생정보 등록성공 <%=pstmt %>
<%
//디비 확인
// cmd
// mysql -uroot -p jspdb1
// select * from student;
%>
</body>
</html>