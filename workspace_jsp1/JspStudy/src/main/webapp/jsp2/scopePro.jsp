<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp2/scopePro.jsp</title>
</head>
<body>
<h1>jsp2/scopePro.jsp</h1>
<%
//폼에서 들고간 정보 서버 request에 저장
String id=request.getParameter("id");
String pass=request.getParameter("pass");

//페이지 정보 저장 => 페이지 바뀌면 기존정보는 사라지고 새로운페이지 정보가 저장
pageContext.setAttribute("page", "pageContext value");
//요청정보를 저장 => 페이지 바뀌면 요청정보를 들고 가면 유지, 요청정보를 안들고 가면 사라짐
request.setAttribute("req", "request value");
// 연결정보를 저장 => 연결만 되어있으면 페이지 상관없이 값유지
session.setAttribute("ses", "session value");
// 서버가 start가 되어있으면 페이지, 유저(연결) 상관없이 값유지 
application.setAttribute("app", "application value");

// http://localhost:8080/JspStudy/jsp2/scopeProPro.jsp?id=kim&pass=p123
%>
아이디 : <%=id %><br>
비밀번호 : <%=pass %><br>
pageContext 값 : <%=pageContext.getAttribute("page") %><br>
request 값 : <%=request.getAttribute("req") %><br>
session 값 : <%=session.getAttribute("ses") %><br>
application 값 : <%=application.getAttribute("app") %><br>

<a href="scopeProPro.jsp?id=<%=id %>&pass=<%=pass%>">scopeProPro.jsp로 이동</a>

<script type="text/javascript">
// 	alert("scopeProPro.jsp이동");
<%-- 	location.href="scopeProPro.jsp?id=<%=id %>&pass=<%=pass%>"; --%>
</script>

<%
// response.sendRedirect("scopeProPro.jsp?id="+id+"&pass="+pass);

// jsp 이동  forward 이동방식 Pro.jsp 페이지에 있는 request값을 전부들고  ProPro.jsp 이동
//                         주소줄 변경 안됨 , 화면내용만 변경
// jsp 액션태그 : jsp 태그처럼 사용하도록 만든 문법
%>
<jsp:forward page="scopeProPro.jsp" />
</body>
</html>


