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
<title>jsp5/updatePro.jsp</title>
</head>
<body>
<%
// request 한글처리
request.setCharacterEncoding("utf-8");

// request에 저장된 요청정보 num name pass subject content 가져오기
int num=Integer.parseInt(request.getParameter("num"));
String name=request.getParameter("name");
String pass=request.getParameter("pass");
String subject=request.getParameter("subject");
String content=request.getParameter("content");

// 1단계 드라이버로더
Class.forName("com.mysql.jdbc.Driver");

// 2단계 디비연결
String dbUrl="jdbc:mysql://localhost:3306/jspdb1?useSSL=false";
String dbId="root";
String dbPass="1234";
Connection con=DriverManager.getConnection(dbUrl, dbId, dbPass);

// 3단계 sql구문 만들기 select * from board where num=? and pass=?
String sql="select * from board where num=? and pass=?";
PreparedStatement pstmt=con.prepareStatement(sql);
pstmt.setInt(1, num);
pstmt.setString(2, pass);

// 4단계 sql구문 실행 => 결과 저장
ResultSet rs=pstmt.executeQuery();

// 5단계 if 다음행으로 갔을때 데이터 있으면 
//                  3단계 sql update board set subject=?,content=? where num=?
//                  4단계 실행
//                  list.jsp 이동		
//         데이터 없으면   "입력하신 정보 틀림"  뒤로이동
if(rs.next()){
	// true 데이터 있으면 
	sql="update board set subject=?,content=? where num=?";
	pstmt=con.prepareStatement(sql);
	pstmt.setString(1, subject);
	pstmt.setString(2, content);
	pstmt.setInt(3, num);
	
	pstmt.executeUpdate();
	
	response.sendRedirect("list.jsp");
}else{
	//false 데이터 없음
	%>
	<script type="text/javascript">
		alert("입력하신 정보 틀림");
		history.back();
	</script>
	<%
}
%>
</body>
</html>
