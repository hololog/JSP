<%@page import="board.BoardDTO"%>
<%@page import="board.BoardDAO"%>
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
<title>board/writePro.jsp</title>
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


// 패키지 board 파일이름 BoardDAO 만들기
// BoardDAO 객체생성
BoardDAO bDAO=new BoardDAO();
// 리턴할형 int  getMaxNum()메서드 정의

// 게시판글 담은 바구니 준비  
// 패키지 board 파일이름 BoardDTO 만들기
// 멤버변수 정의  set get 정의
// BoardDTO 객체생성
BoardDTO bDTO=new BoardDTO();
// set메서드 호출 파라미터값 저장
// setNum(getMaxNum()메서드호출+1)
bDTO.setNum(bDAO.getMaxNum()+1);
bDTO.setPass(pass);
bDTO.setName(name);
bDTO.setSubject(subject);
bDTO.setContent(content);
bDTO.setReadcount(readcount);
bDTO.setDate(date);
// System.out.println("번호 : "+bDTO.getNum());

// 리턴할형없음 insertBoard(BoardDTO 주소받을변수) 메서드 정의
// insertBoard(BoardDTO 주소)메서드 호출
bDAO.insertBoard(bDTO);

// list.jsp 게시판 목록 이동
response.sendRedirect("list.jsp");
%>
</body>
</html>