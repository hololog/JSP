<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp2/sessionLoginPro.jsp</title>
</head>
<body>
<%
// 폼에서 id, pass 입력한값이 http가 서버 전달
// 서버에 request내장객체 저장
// request에 저장된 id,pass파라미터값을 가져와서 변수에 저장 => 출력

String id=request.getParameter("id");
String pass=request.getParameter("pass");
%>
폼에서 가져온 아이디 : <%=id %><br>
폼에서 가져온 비밀번호 : <%=pass %><br>
<%
// 한명 디비에 저장 
String dbId="kim";
String dbPass="p123";
%>
디비에 저장된 아이디 : <%=dbId %><br>
디비에 저장된 비밀번호 : <%=dbPass %><br>
아이디비교 : <%=id.equals(dbId) %><br>
비밀번호비교 : <%=pass.equals(dbPass) %><br>
<%
// 폼입력한아이디 디비저장된아이디 동시에 폼입력한비밀번호 디비저장된비밀번호 비교
if(id.equals(dbId) && pass.equals(dbPass)){
	// 아이디 비밀번호 일치하면 => 로그인 인증 => 페이지 상관없이 값을 유지=> 세션값 만들기
	session.setAttribute("id", id);
	// 메인으로 이동
	response.sendRedirect("sessionMain.jsp");
}else{
	// 아이디 비밀번호 틀리면 => 틀림 => 뒤로이동 
	%>
	<script type="text/javascript">
		alert("입력하신정보 틀림");
		history.back();
	</script>
	<%
}
%>

</body>
</html>

