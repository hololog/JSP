<%@page import="com.itwillbs.domain.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board/updateForm.jsp</title>
</head>
<body>
<%
// //http://localhost:8080/JspStudy/jsp5/updateForm.jsp?num=1
// //서버 request에 저장 num 가져오기
// int num=Integer.parseInt(request.getParameter("num"));
// //BoardDAO 객체생성
// BoardDAO bDAO=new BoardDAO();
// // BoardDTO bDTO=  getBoard(num) 메서드 호출
// BoardDTO bDTO=bDAO.getBoard(num);
BoardDTO bDTO=(BoardDTO)request.getAttribute("bDTO");
	%>
<form action="updatePro" method="post">
<input type="hidden" name="num" value="<%=bDTO.getNum()%>">
<table border="1">
<tr><td>이름</td><td><input type="text" name="name" value="<%=bDTO.getName() %>"></td></tr>
<tr><td>비밀번호</td><td><input type="password" name="pass"></td></tr>
<tr><td>제목</td><td><input type="text" name="subject" value="<%=bDTO.getSubject()%>"></td></tr>
<tr><td>내용</td><td><textarea name="content" rows="10" cols="20"><%=bDTO.getContent()%></textarea></td></tr>
<tr><td colspan="2"><input type="submit" value="글수정"></td></tr>
</table>
</form>	
</body>
</html>