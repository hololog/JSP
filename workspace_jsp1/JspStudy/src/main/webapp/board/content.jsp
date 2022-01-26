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
<title>board/content.jsp</title>
</head>
<body>
<%
//  http://localhost:8080/JspStudy/jsp5/content.jsp?num=1
//  http://localhost:8080/JspStudy/jsp5/content.jsp?num=2
// 서버 request에 저장
int num=Integer.parseInt(request.getParameter("num"));
// BoardDAO 객체생성
BoardDAO bDAO=new BoardDAO();
//조회수 1증가  update board set readcount=readcount+1 where num=?
// 리턴할값없음 updateReadcount(int num) 메서드 정의
// updateReadcount(num)메서드 호출
bDAO.updateReadcount(num);

// BoardDTO 리턴할형 getBoard(int num)메서드 정의
// BoardDTO bDTO=  getBoard(num) 메서드 호출
BoardDTO bDTO=bDAO.getBoard(num);
	%>
<table border="1">
<tr><td>글번호</td><td><%=bDTO.getNum() %></td>
     <td>글쓴날짜</td><td><%=bDTO.getDate() %></td></tr>
<tr><td>글쓴이</td><td><%=bDTO.getName() %></td>
    <td>조회수</td><td><%=bDTO.getReadcount() %></td></tr>
<tr><td>글제목</td><td colspan="3"><%=bDTO.getSubject() %></td></tr>
<tr><td>글내용</td><td colspan="3"><%=bDTO.getContent() %></td></tr>
<tr><td colspan="4">
<input type="button" value="글수정" onclick="location.href='updateForm.jsp?num=<%=bDTO.getNum() %>'">
<input type="button" value="글삭제" onclick="location.href='deleteForm.jsp?num=<%=bDTO.getNum() %>'">
<input type="button" value="글목록" onclick="location.href='list.jsp'"></td></tr>
</table>	
	<%
// }
%>

</body>
</html>

