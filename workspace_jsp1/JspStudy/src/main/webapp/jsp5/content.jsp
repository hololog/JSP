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
<title>jsp5/content.jsp</title>
</head>
<body>
<%
//  http://localhost:8080/JspStudy/jsp5/content.jsp?num=1
//  http://localhost:8080/JspStudy/jsp5/content.jsp?num=2
// 서버 request에 저장
int num=Integer.parseInt(request.getParameter("num"));

// 1단계 드라이버로더
Class.forName("com.mysql.jdbc.Driver");
// 2단계 디비연결
String dbUrl="jdbc:mysql://localhost:3306/jspdb1?useSSL=false";
String dbId="root";
String dbPass="1234";
Connection con=DriverManager.getConnection(dbUrl, dbId, dbPass);
// 3단계 sql구문 만들기
String sql="select * from board where num=?";
PreparedStatement pstmt=con.prepareStatement(sql);
pstmt.setInt(1, num);
// 4단계 sql구문 실행 => 결과 저장
ResultSet rs=pstmt.executeQuery();
// 5단계 if 다음행으로 이동 => 열접근 => 출력
if(rs.next()){
	%>
<table border="">
<tr><td>글번호</td><td><%=rs.getInt("num") %></td>
     <td>글쓴날짜</td><td><%=rs.getTimestamp("date") %></td></tr>
<tr><td>글쓴이</td><td><%=rs.getString("name") %></td>
    <td>조회수</td><td><%=rs.getInt("readcount") %></td></tr>
<tr><td>글제목</td><td colspan="3"><%=rs.getString("subject") %></td></tr>
<tr><td>글내용</td><td colspan="3"><%=rs.getString("content") %></td></tr>
<tr><td colspan="4">
<input type="button" value="글수정" onclick="location.href='updateForm.jsp?num=<%=rs.getInt("num") %>'">
<input type="button" value="글삭제" onclick="location.href='deleteForm.jsp?num=<%=rs.getInt("num") %>'">
<input type="button" value="글목록" onclick="location.href='list.jsp'"></td></tr>
</table>	
	<%
}
%>

</body>
</html>

