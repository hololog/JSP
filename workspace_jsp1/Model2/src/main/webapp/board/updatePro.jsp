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
<title>board/updatePro.jsp</title>
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

// BoardDAO 객체생성
BoardDAO bDAO=new BoardDAO();
// BoardDTO  리턴할형  numCheck(int num,String pass) 메서드 정의
// sql구문 만들기 select * from board where num=? and pass=?
// BoardDTO bDTO =  numCheck(num, pass) 메서드 호출
BoardDTO bDTO=bDAO.numCheck(num, pass);
if(bDTO!=null){
	//true 데이터 있음  num pass 일치
	// 수정할 정보를 BoardDTP담기
	// BoardDTO updateDTO 객체생성
	BoardDTO updateDTO=new BoardDTO();
	//set메서드 호출해서 파라미터값 저장
	updateDTO.setNum(num);
	updateDTO.setName(name);
	updateDTO.setPass(pass);
	updateDTO.setSubject(subject);
	updateDTO.setContent(content);
	
	// 리턴할형없음  updateBoard(BoardDTO updateDTO) 메서드 정의
	// 	sql="update board set subject=?,content=? where num=?";
	//  updateBoard(updateDTO) 메서드 호출
	bDAO.updateBoard(updateDTO);
	
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
