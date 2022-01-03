<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp3/updatePro.jsp</title>
</head>
<body>
<%
//한글처리
request.setCharacterEncoding("utf-8");
//사용자 폼에서 http를 통해서  서버 request내장객체 요청정보 전달
// request에 저장된 num name 파라미터 가져와서 변수에 저장
int num=Integer.parseInt(request.getParameter("num"));
String name=request.getParameter("name");

//1단계 : 설치한 프로그램 가져오기
Class.forName("com.mysql.jdbc.Driver");
//2단계 : 가져온 프로그램을 이용해서 디비서버 연결 => 연결정보를 저장(자바내장객체)
String dbUrl="jdbc:mysql://localhost:3306/jspdb1?useSSL=false";
String dbId="root";
String dbPass="1234";
Connection con=DriverManager.getConnection(dbUrl, dbId, dbPass);
//3단계 : 연결정보를 이용해서 sql구문을 만들고 실행할 준비(자바내장객체)
// update 테이블이름 set 수정할열=수정할값, 수정할열=수정할값
// where 기준열=값;
// 2번학생의 이름을 이길동으로 수정
String sql="update student set name=? where num=?";
PreparedStatement pstmt=con.prepareStatement(sql);
pstmt.setString(1, name);
pstmt.setInt(2, num);
//4단계 : executeUpdate()호출 sql구문을 실행  insert,update,delete=> OK
pstmt.executeUpdate();
%>
학생정보 수정성공 <%=pstmt %>
</body>
</html>