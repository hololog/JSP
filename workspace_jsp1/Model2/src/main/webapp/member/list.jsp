<%@page import="member.MemberDTO"%>
<%@page import="java.util.List"%>
<%@page import="member.MemberDAO"%>
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
<title>member/list.jsp</title>
</head>
<body>
<%
//MemberDAO 객체생성
MemberDAO mDAO=new MemberDAO();

// 자바내장객체 API List : 배열형태로 데이터 저장
// List 리턴할형   getMemberList() 메서드 정의 
// List memberList = getMemberList() 메서드 호출
List memberList=mDAO.getMemberList();
// memberList 배열 한칸 접근 get(0) => MemberDTO 주소 => id pass name,... 접근 출력

%>
<table border="1">
<tr><td>아이디</td><td>비밀번호</td><td>이름</td><td>날짜</td></tr>
<%
for(int i=0;i<memberList.size();i++){
	MemberDTO mDTO=(MemberDTO)memberList.get(i);
	%>
	<tr><td><%=mDTO.getId() %></td>
	    <td><%=mDTO.getPass() %></td>
	    <td><%=mDTO.getName() %></td>
	    <td><%=mDTO.getDate() %></td></tr>
	<%
}
%>
</table>
</body>
</html>

