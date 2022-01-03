<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp2/cookieMain.jsp</title>
</head>
<body>
<%
//http가 들고온값을 서버 request에 저장 => 쿠키값을 가져오기 
Cookie cookies[]=request.getCookies();
// if 쿠키값이 있으면
// for 쿠키값 배열 한칸 접근
// if 쿠키값이름 비교 "clang"
// 찾은 쿠키값 출력
String language="";
if(cookies!=null){
	for(int i=0;i<cookies.length;i++){
		if(cookies[i].getName().equals("clang")){
			out.println("찾은 쿠키이름 : "+cookies[i].getName());
			out.println(" 찾은 쿠키값 : "+cookies[i].getValue());
			//찾은 쿠키값을 language 변수에 저장
			language=cookies[i].getValue();
		}
	}
}
// 찾은 쿠키값이 korea이면 안녕하세요, english 이면 Hello 출력
if(language.equals("korea")){
	%><h1>안녕하세요 </h1><%
}else{
	%><h1>Hello</h1><%
}
%>




<form action="cookieMain2.jsp" method="get" >
언어설정 : <input type="radio" name="lang" value="korea" 
         <% if(language.equals("korea")){%>checked<%} %> > 한국어
         
         <input type="radio" name="lang" value="english"
         <% if(language.equals("english")) {%>checked<%}%>>영어
         
    <input type="submit" value="언어설정">     
</form>

</body>
</html>

