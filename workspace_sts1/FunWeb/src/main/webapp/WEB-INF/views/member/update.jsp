<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath }/resources/css/default.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/resources/css/subpage.css" rel="stylesheet" type="text/css">
<!--[if lt IE 9]>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js" type="text/javascript"></script>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/ie7-squish.js" type="text/javascript"></script>
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js" type="text/javascript"></script>
<![endif]-->
<!--[if IE 6]>
 <script src="../script/DD_belatedPNG_0.0.8a.js"></script>
 <script>
   /* EXAMPLE */
   DD_belatedPNG.fix('#wrap');
   DD_belatedPNG.fix('#main_img');   

 </script>
 <![endif]-->
</head>
<body>
<div id="wrap">
<!-- 헤더들어가는 곳 -->
<jsp:include page="../inc/top.jsp"></jsp:include>
<!-- 헤더들어가는 곳 -->

<!-- 본문들어가는 곳 -->
<!-- 본문메인이미지 -->
<div id="sub_img_member"></div>
<!-- 본문메인이미지 -->
<!-- 왼쪽메뉴 -->
<nav id="sub_menu">
<ul>
<li><a href="#">Join us</a></li>
<li><a href="#">Privacy policy</a></li>
</ul>
</nav>
<!-- 왼쪽메뉴 -->
<!-- 본문내용 -->
<%
// //세션값 가져오기 
// String id = (String)session.getAttribute("id");
// // MemberDAO 객체생성
// MemberDAO mDAO=new MemberDAO();
// // MemberDTO 리턴할형 getMember(String id) 메서드 정의
// // 리턴값을 저장할 변수 MemberDTO mDTO = getMember(id) 메서드 호출
// MemberDTO mDTO=mDAO.getMember(id);

// model.addAttribute("memberDTO", memberDTO);
// JSP파일에 자바형식의 출력 코드 <%= 를 사용하면 불편한 점을 
// 해결할 수 있는 EL (Expression Language) ${ } ▼ 연산자 empty, ▼ 내장객체 ${sessionScope.id } 과

//             JSTL (Jsp Standard Tag Library)를 이용해 코드를 간결하게 사용하는 방법
// 		<dependency>
// 			<groupId>javax.servlet</groupId>
// 			<artifactId>jstl</artifactId>
// 			<version>1.2</version>
// 		</dependency>
//              if  choose  each 반복문
// 태그형태로 출력


%>
<article>
<h1>Update Us</h1>
<form action="${pageContext.request.contextPath }/member/updatePro" id="join" method="post">
<fieldset>
<legend>Basic Info</legend>
<label>User ID</label>
<input type="text" name="id" class="id" value="${memberDTO.id}" readonly><br>
<label>Password</label>
<input type="password" name="pass"><br>
<label>Name</label>
<input type="text" name="name" value="${memberDTO.name}"><br>
<label>E-Mail</label>
<input type="email" name="email" value=""><br>
</fieldset>

<fieldset>
<legend>Optional</legend>
<label>Address</label>
<input type="text" name="address" value=""><br>
<label>Phone Number</label>
<input type="text" name="phone" value=""><br>
<label>Mobile Phone Number</label>
<input type="text" name="mobile" value=""><br>
</fieldset>
<div class="clear"></div>
<div id="buttons">
<input type="submit" value="Submit" class="submit">
<input type="reset" value="Cancel" class="cancel">
</div>
</form>
</article>
<!-- 본문내용 -->
<!-- 본문들어가는 곳 -->

<div class="clear"></div>
<!-- 푸터들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp"></jsp:include>
<!-- 푸터들어가는 곳 -->
</div>
</body>
</html>