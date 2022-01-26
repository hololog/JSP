<%@page import="board.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board/list.jsp</title>
</head>
<body>
<%
//BoardDAO 객체생성
BoardDAO bDAO=new BoardDAO();
// 한페이지에 보여줄 글 개수 설정
int pageSize=10;
// 페이지번호 없으면 1로 설정
// http://localhost:8080/JspStudy/board/list.jsp   
// 페이지번호가 있으면 받은 페이지번호로 설정
// http://localhost:8080/JspStudy/board/list.jsp?pageNum=2   
// 페이지번호 파라미터 가져오기 
String pageNum=request.getParameter("pageNum");
if(pageNum==null){
	// 페이지번호 없으면 1로 설정
	pageNum="1";
}


// 자바내장객체 API List : 배열형태로 데이터 저장
// List 리턴할형   getBoardList() 메서드 정의 
// List boardList = getBoardList() 메서드 호출
List boardList =bDAO.getBoardList();
// boardList 배열 한칸 접근 get(0) => BoardDTO 주소 => num pass name,... 접근 출력
%>
<table border="1">
<tr><td>글번호</td><td>글쓴이</td><td>글제목</td><td>조회수</td><td>글쓴날짜</td></tr>
<%
for(int i=0;i<boardList.size();i++){
	// 모든형 Object 형 저장 => BoardDTO 형변환  => 다운캐스팅
	BoardDTO bDTO=(BoardDTO)boardList.get(i);
	%>
	<tr><td><%=bDTO.getNum() %></td>
	    <td><%=bDTO.getName() %></td>
	    <td><a href="content.jsp?num=<%=bDTO.getNum()%>">
	        <%=bDTO.getSubject() %></a></td>
	    <td><%=bDTO.getReadcount() %></td>
	    <td><%=bDTO.getDate() %></td></tr>
	<%
}
%>
</table>
</body>
</html>
