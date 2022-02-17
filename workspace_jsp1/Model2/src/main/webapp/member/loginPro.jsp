<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
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
<title>member/loginPro.jsp</title>
</head>
<body>
<%
// 폼 입력한 id, pass => 서버 request내장객체 저장
String id=request.getParameter("id");
String pass=request.getParameter("pass");

// MemberDAO 객체생성 
MemberDAO mDAO=new MemberDAO();
// 리턴할형 MemberDTO  메서드이름(전달할 값의 변수) userCheck(String id,String pass) 메서드 정의

// 리턴받을 변수 MemberDTO mDTO  =  userCheck(id,pass) 호출
MemberDTO mDTO=mDAO.userCheck(id, pass);

if(mDTO!=null){
	//true 일치  => 로그인인증 => 세션값 생성(중복되지 않는값) => 페이지 상관없이 값유지 => main.jsp 이동
	out.println("일치");
	session.setAttribute("id", id);
	response.sendRedirect("main.jsp");
}else{
	//false 틀림 => "입력하신 정보 틀림"  뒤로이동
	out.println("틀림"); 
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

