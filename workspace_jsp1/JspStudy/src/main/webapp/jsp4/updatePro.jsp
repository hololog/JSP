<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp4/updatePro.jsp</title>
</head>
<body>
<%
// request 한글처리
request.setCharacterEncoding("utf-8");
// request 저장된 id, pass, name 파라미터 가져와서 변수에 저장
String id=request.getParameter("id");
String pass=request.getParameter("pass");
String name=request.getParameter("name");
// 1단계 드라이버 불러오기
Class.forName("com.mysql.jdbc.Driver");
// 2단계 디비연결
String dbUrl="jdbc:mysql://localhost:3306/jspdb1?useSSL=false";
String dbId="root";
String dbPass="1234";
Connection con=DriverManager.getConnection(dbUrl, dbId, dbPass);
// 3단계 sql구문 만들기  select * from member where id=? and pass=?
String sql="select * from member where id=? and pass=?";
PreparedStatement pstmt=con.prepareStatement(sql);
pstmt.setString(1, id);
pstmt.setString(2, pass);
// 4단계 sql구문 실행 => 결과 저장
ResultSet rs=pstmt.executeQuery();
// 5단계 결과 다음행으로 이동 => 데이터 있으면 (true) => 아이디 비밀번호 일치
//        => 수정작업 3단계 update구문만들기 update member set name=? where id=?  
//                  4단계 sql구문 실행 		
//                  main.jsp 이동 		
//                                없으면 (false) => 아이디 비밀번호 틀림
//        =? "입력하신 정보가 틀림"  뒤로이동
if(rs.next()){
	//3단계 update구문만들기 update member set name=? where id=? 
	sql="update member set name=? where id=?";	
	pstmt=con.prepareStatement(sql);
	pstmt.setString(1, name);
	pstmt.setString(2, id);
	//4단계 sql구문 실행 	
	pstmt.executeUpdate();
	response.sendRedirect("main.jsp");
}else{
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