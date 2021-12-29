<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp2/cookieSet.jsp</title>
</head>
<body>
<%
// 쿠키값 생성(자바내장객체 객체생성- 서버)
Cookie cookie =new Cookie("cook","cookievalue");
// 쿠키값 유지시간 설정  초단위
cookie.setMaxAge(1800);
// 서버에서 생성된 쿠키값을 사용자컴퓨터에 전달 저장
response.addCookie(cookie);
%>
만들어진 쿠키의 유지시간 : <%=cookie.getMaxAge() %><br>
만들어진 쿠키의 참조변수에 담긴 주소 :<%=cookie %> <br>
만들어진 쿠키의 이름 : <%=cookie.getName() %><br>
만들어진 쿠키의 이름에 해당하는 값 : <%=cookie.getValue() %><br>

<script type="text/javascript">
	alert("쿠키값 생성");
	location.href="cookieTest.jsp";
</script>
</body>
</html>

