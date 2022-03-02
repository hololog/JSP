<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/info.jsp</title>
</head>
<body>
<%
// 세션값에 저장된 id 가져오기
// String id=(String)session.getAttribute("id");

//MemberDAO 객체생성 
// MemberDAO mDAO=new MemberDAO();

// 리턴할형 MemberDTO  메서드이름(전달할 값의 변수) getMember(String id) 메서드 정의

// 리턴받을 변수 MemberDTO mDTO  =  getMember(id) 호출
// MemberDTO mDTO = mDAO.getMember(id);
// MemberDTO mDTO=(MemberDTO)request.getAttribute("memberDTO");

// if(mDTO!=null){
	// 아이디 일치
	%>
아이디 : <%//=mDTO.getId() %><br>
비밀번호 : <%//=mDTO.getPass() %><br>
이름 : <%//=mDTO.getName() %><br>
가입날자 : <%//=mDTO.getDate() %><br>	
	<%
// }
%>
<a href="<%=request.getContextPath() %>/member/main">메인 화면으로 </a>
</body>
</html>
