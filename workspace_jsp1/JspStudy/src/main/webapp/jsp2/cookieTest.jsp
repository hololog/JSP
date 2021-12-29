<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp2/cookieTest.jsp</title>
</head>
<body>
<%
// 세션 : 연결정보를 저장, 공통점 - 페이지 상관없이 값을 유지 
//     : 차이점 - 서버에 저장(메모리) , 보안상에 중요한 데이터 저장, 로그인 인증 
//     : jsp 내장객체 : 자바내장객체 서버 객체를 생성 

// 쿠키 :               공통점 - 페이지, 사용자, 서버 상관없이 값을 유지
//     : 차이점 - 클라이언트(사용자컴퓨터) 저장(하드디스크에 파일) 
//             - 서버에 부하를 줄이고자 할때 사용, 보안상 중요하지 않은 데이터 저장
//              , 아이디 저장 체크
//     : 자바 내장객체  

//쿠키값 가져오기
// 사용자가 브라우저에 주소 http://localhost:8080/JspStudy/jsp2/cookieTest.jsp 요청
// 서버에 요청하러 갈때 태그정보,서버정보,클라이언트정보,세션, 쿠키값 을 http들고 서버로 감
// 웹서버에서 http가 들고온 정보를 받아서 처리를 하기위해서
// 웹 애플리케이션 서버에 전달 => 
// 1. request(http가 들고온 모든 정보), response 내장객체 생성
// 2. 처리담당자(서블릿)지정 처리
//  처리결과 response에 저장=>웹서버=>http전달 => 사용자 컴퓨터에 전달 

//쿠키값 가져오기
Cookie cookies[]=request.getCookies();
%>
<input type="button" value="쿠키값 생성" onclick="location.href='cookieSet.jsp'">
<input type="button" value="쿠키값 삭제" onclick="location.href='cookieDel.jsp'">
</body>
</html>



