<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp5/writePro.jsp</title>
</head>
<body>
<%
// request 한글처리
request.setCharacterEncoding("utf-8");
// request에 저장된 요청정보 name pass subject content 가져오기
String name=request.getParameter("name");
String pass=request.getParameter("pass");
String subject=request.getParameter("subject");
String content=request.getParameter("content");
// readcount =0 , date 시스템의 날짜시간
int readcount=0;
Timestamp date=new Timestamp(System.currentTimeMillis());


// 1단계 드라이버 로더
Class.forName("com.mysql.jdbc.Driver");
// 2단계 디비연결
String dbUrl="jdbc:mysql://localhost:3306/jspdb1?useSSL=false";
String dbId="root";
String dbPass="1234";
Connection con=DriverManager.getConnection(dbUrl, dbId, dbPass);
// num 구하기 => num중에 가장 큰 번호 구해서  1증가
// 최대값 구하는 함수 max(num) +1
// 3단계 sql구문 만들기
String sql="select max(num) from board";
PreparedStatement pstmt=con.prepareStatement(sql);
// 4단계 실행
ResultSet rs = pstmt.executeQuery();
// 5단계 다음행 이동
int num=0;
if(rs.next()){
	num=rs.getInt("max(num)")+1;
}

// 3단계 sql 구문만들기 
//insert into board(num, name, pass, subject, content, readcount, date) values(?,?,?,?,?,?,?)
// sql="insert into board(num, name, pass, subject, content, readcount, date) values(?,?,?,?,?,?,now())";
sql="insert into board(num, name, pass, subject, content, readcount, date) values(?,?,?,?,?,?,?)";
pstmt=con.prepareStatement(sql);
pstmt.setInt(1, num);
pstmt.setString(2, name);
pstmt.setString(3, pass);
pstmt.setString(4, subject);
pstmt.setString(5, content);
pstmt.setInt(6, readcount);
pstmt.setTimestamp(7, date);

// 4단계 sql 구문실행
pstmt.executeUpdate();

// list.jsp 게시판 목록 이동
response.sendRedirect("list.jsp");
%>
</body>
</html>