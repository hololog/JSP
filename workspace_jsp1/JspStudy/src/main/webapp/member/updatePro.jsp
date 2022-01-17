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
<title>jsp4/updatePro.jsp</title>
</head>
<body>
<%
// request 한글처리
request.setCharacterEncoding("utf-8");
// request 저장된 id, pass, name 파라미터 가져와서 변수에 저장
String id=request.getParameter("id");
String pass=request.getParameter("pass");
String name=request.getParameter("name");
//MemberDAO 객체생성
MemberDAO mDAO=new MemberDAO(); 
// 리턴받을 변수 MemberDTO mDTO  =  userCheck(id,pass) 호출
MemberDTO mDTO=mDAO.userCheck(id, pass);
if(mDTO!=null){
	// 아이디 비밀번호 일치
	// MemberDTO updateDTO 객체생성
	MemberDTO updateDTO=new MemberDTO();
	// set메서드호출 id,pass,name 값 저장
	updateDTO.setId(id);
	updateDTO.setPass(pass);
	updateDTO.setName(name);
	// 리턴할형없음  메서드이름(전달할 값의 변수) updateMember(MemberDTO updateDTO) 메서드 정의
	
	// updateMember(updateDTO) 메서드호출
	mDAO.updateMember(updateDTO);
	
	response.sendRedirect("main.jsp");
}else{
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