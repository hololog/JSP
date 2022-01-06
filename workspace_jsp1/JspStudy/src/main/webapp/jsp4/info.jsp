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
<title>jsp4/info.jsp</title>
</head>
<body>
<%
// 세션값에 저장된 id 가져오기
String id=(String)session.getAttribute("id");

// 1단계 드라이버 로더
Class.forName("com.mysql.jdbc.Driver");
// 2단계 디비연결
String dbUrl="jdbc:mysql://localhost:3306/jspdb1?useSSL=false";
String dbId="root";
String dbPass="1234";
Connection con=DriverManager.getConnection(dbUrl, dbId, dbPass);
// 3단계 sql구문 만들기  select * from member where id=?
String sql="select * from member where id=?";
PreparedStatement pstmt=con.prepareStatement(sql);
pstmt.setString(1, id);
// 4단계 sql 구문 실행 => 결과 저장
ResultSet rs=pstmt.executeQuery();
// 5단계 결과 있으면(아이디 일치) - (행접근)다음행(rs.next()) - 열접근 -> 출력
if(rs.next()){
	// 첫행  데이터 있으면 true => 열접근
	%>
아이디 : <%=rs.getString("id") %><br>
비밀번호 : <%=rs.getString("pass") %><br>
이름 : <%=rs.getString("name") %><br>
가입날자 : <%=rs.getTimestamp("date") %><br>	
	<%
}
%>
<a href="main.jsp">메인 화면으로 </a>
</body>
</html>
