<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp1/session.jsp</title>
</head>
<body>
<%
//session 내장객체 : 연결정보를 저장하는 내장객체(기억장소)
//               : 연결이 되어지면 sid부여 됨
//               : session내장객체만 있으면 연결유지 
//session내장객체 삭제 : 1. 사용자 브라우저 모두 닫았을때(세션ID 삭제)
//                     2. 30분동안 작업을 하지 않았을때
//                     3. 로그아웃 명령 수행
// 로그인할때 session내장객체 사용(session내장객체 안에 값을 저장)
%>
세션아이디 : <%=session.getId() %><br>
세션생성시간 : <%=session.getCreationTime() %><br>
세션마지막접근시간 :  <%=session.getLastAccessedTime() %><br>
세션유지시간 : <%=session.getMaxInactiveInterval() %> 초 (30분 기본설정)<br>
세션유지시간변경 : 
<%
// 1초 설정
session.setMaxInactiveInterval(1800);
%><br>
세션유지시간 : <%=session.getMaxInactiveInterval() %> 초<br>
로그아웃(세션내장객체 기억장소 전체삭제)
<%
// session.invalidate();
%> 
<%
//세션내장객체 안에 하나의 값을 저장
session.setAttribute("sname", "svalue");
%><br>
세션내장객체 안에 하나의 저장된 값 가져오기: <%=session.getAttribute("sname")%><br>
세션내장객체 안에 하나의 값 삭제 :
<%
session.removeAttribute("sname");
%><br>
세션내장객체 안에 하나의 저장된 값 가져오기: <%=session.getAttribute("sname")%><br>
</body>
</html>



