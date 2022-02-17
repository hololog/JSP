<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/insertPro.jsp</title>
</head>
<body>
<%
// request 한글처리
request.setCharacterEncoding("utf-8");
// request에 저장 id pass name 폼에서 입력한 값 가져오기
String id=request.getParameter("id");
String pass=request.getParameter("pass");
String name=request.getParameter("name");
// 시스템에 있는 날짜와 시간 가져오기 => Timestamp내장객체 생성
Timestamp date=new Timestamp(System.currentTimeMillis());

// 저장 할 여러개 데이터를 하나의 바구니 저장 => 디비작업할때 바구니 하나 전달
// 바구니를 자바파일로 정의 
// 폴더(패키지)member   자바파일 만들기 MemberDTO.java

// 바구니 만들기 - MemberDTO 자바파일 객체생성(기억장소)
MemberDTO mDTO=new MemberDTO();
// 바구니에 값 저장 
mDTO.setId(id);
mDTO.setPass(pass);
mDTO.setName(name);
mDTO.setDate(date);

//                 폴더(패키지)  자바파일 만들기
// src/main/java   member      MemberDAO.java
// 자바파일에 메서드(멤버함수) 만들기

//자바파일 객체생성=> 기억장소 할당
MemberDAO mDAO=new MemberDAO();

// 자바파일 안에 메서드 호출
// mDAO.insertMember(id, pass, name, date);
// mDAO.insertMember(바구니주소);
mDAO.insertMember(mDTO);

// 로그인 페이지 이동
response.sendRedirect("loginForm.jsp");

%>
</body>
</html>
