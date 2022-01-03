<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp3/jdbcTest.jsp</title>
</head>
<body>
<%
//사용자웹브라우저 => 웹서버(웹애플리케이션서버) => 데이터베이스서버 접속 
//JDBC - 웹서버 디비서버 연결하는 프로그램 설치
// src - main - webapp - WEB-INF - lib 폴더안에 
// mysql-connector-java-5.1.39-bin.jar 넣기

//1단계 : 설치한 프로그램 가져오기(불러오기)
// com\mysql\jdbc 폴더   Driver.class 실행(바이너리)파일
// Class 자바내장객체 java폴더 lang폴더(기본폴더 자동으로 불러옴) Class.java 파일
Class.forName("com.mysql.jdbc.Driver");

//2단계 : 가져온 프로그램을 이용해서 디비서버 연결 => 연결정보를 저장(자바내장객체)
// java폴더 sql 폴더   DriverManager 자바내장객체 파일
// import="java.sql.DriverManager" (기본폴더가 아니면 폴더지정)

// 연결정보를 저장(자바내장객체)
// java폴더 sql 폴더 Connection 자바내장객체 파일
// import="java.sql.Connection" (기본폴더가 아니면 폴더지정)

String dbUrl="jdbc:mysql://localhost:3306/jspdb1?useSSL=false";
String dbId="root";
String dbPass="1234";
Connection con=DriverManager.getConnection(dbUrl, dbId, dbPass);
%>
연결성공 <%=con %>
</body>
</html>
