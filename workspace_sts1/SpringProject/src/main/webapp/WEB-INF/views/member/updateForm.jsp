<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/updateForm.jsp</title>
</head>
<body>
<%
//세션값에 저장된 id 가져오기
String id=(String)session.getAttribute("id");
// //MemberDAO 객체생성 
// MemberDAO mDAO=new MemberDAO();
// // 리턴받을 변수 MemberDTO mDTO  =  getMember(id) 호출
// MemberDTO mDTO=mDAO.getMember(id);
// MemberDTO mDTO=(MemberDTO)request.getAttribute("memberDTO");
// if(mDTO!=null){
	%>
<form action="<%=request.getContextPath() %>/member/updatePro" method="post">
아이디 : <input type="text" name="id" value="<%//=id %>" readonly><br>
비밀번호 : <input type="password" name="pass"><br>
이름 : <input type="text" name="name" value="<%//=mDTO.getName()%>"><br>
<input type="submit" value="회원정보수정">
</form>
	<%
// }
%>
<a href="<%=request.getContextPath() %>/member/main">메인 화면으로 </a>
</body>
</html>

