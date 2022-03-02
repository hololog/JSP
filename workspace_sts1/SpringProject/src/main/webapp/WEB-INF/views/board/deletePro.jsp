<%@page import="board.BoardDTO"%>
<%@page import="board.BoardDAO"%>
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
<title>board/deletePro.jsp</title>
</head>
<body>
<%
// request  num pass 
int num=Integer.parseInt(request.getParameter("num"));
String pass=request.getParameter("pass");

//BoardDAO 객체생성
BoardDAO bDAO=new BoardDAO();
//BoardDTO bDTO =  numCheck(num, pass) 메서드 호출
BoardDTO bDTO=bDAO.numCheck(num, pass);
if(bDTO!=null){
	// true 데이터 있으면 
	// 리턴할형없음  deleteBoard(int num) 메서드 정의
	// 	sql="delete from board where num=?";
	//  deleteBoard(num) 메서드 호출
	bDAO.deleteBoard(num);
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



