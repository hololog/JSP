<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>      
<header>
<%
// 로그인 여부확인 => 세션값 있는지 없는지 확인
//세션값 가져오기
// String id=(String)session.getAttribute("id");
// 로그인 하지 않은 경우  세션값없음 login join
// 로그인 한 경우        세션값있음       ..님   logout  update
// if(id==null){
	//세션값 없음, 로그인 하지 않음 login join
	%>
<%-- <div id="login"><a href="<%=request.getContextPath() %>/member/login">login</a> |  --%>
<%--                 <a href="<%=request.getContextPath() %>/member/insert">join</a></div>	 --%>
	<%
// }else{
	//세션값 있음, 로그인 함  ..님   logout  update
	%>
<%-- <div id="login"> ${sessionScope.id }님 |  --%>
<%--                 <a href="<%=request.getContextPath() %>/member/logout">logout</a> |  --%>
<%--                 <a href="<%=request.getContextPath() %>/member/update">update</a></div>	 --%>
	<%
// }
%>

<%-- <c:if test="${ empty sessionScope.id }"> --%>
<%-- <div id="login"><a href="${pageContext.request.contextPath }/member/login">login</a> |  --%>
<%--                 <a href="${pageContext.request.contextPath }/member/insert">join</a></div> --%>
<%-- </c:if> --%>

<%-- <c:if test="${ ! empty sessionScope.id }"> --%>
<%-- <div id="login"> ${sessionScope.id }님 |  --%>
<%--                 <a href="${pageContext.request.contextPath }/member/logout">logout</a> |  --%>
<%--                 <a href="${pageContext.request.contextPath }/member/update">update</a></div>	 --%>
<%-- </c:if> --%>


<c:choose>
	<c:when test="${ empty sessionScope.id }">
	<div id="login"><a href="${pageContext.request.contextPath }/member/login">login</a> | 
                <a href="${pageContext.request.contextPath }/member/insert">join</a></div>
	</c:when>
	<c:otherwise>
	<div id="login"> ${sessionScope.id }님 | 
                <a href="${pageContext.request.contextPath }/member/logout">logout</a> | 
                <a href="${pageContext.request.contextPath }/member/update">update</a> | 
                <a href="${pageContext.request.contextPath }/member/delete">delete</a>
                <c:if test="${sessionScope.id  eq 'admin' }">
                	 | <a href="${pageContext.request.contextPath }/member/list">list</a>
                </c:if>
     </div>
	</c:otherwise>
</c:choose>


<div class="clear"></div>
<!-- 로고들어가는 곳 -->
<div id="logo"><img src="${pageContext.request.contextPath }/resources/images/logo.gif" width="265" height="62" alt="Fun Web"></div>
<!-- 로고들어가는 곳 -->
<nav id="top_menu">
<ul>
	<li><a href="${pageContext.request.contextPath }/main/main">HOME</a></li>
	<li><a href="${pageContext.request.contextPath }/company/welcome">COMPANY</a></li>
	<li><a href="#">SOLUTIONS</a></li>
	<li><a href="${pageContext.request.contextPath }/board/list">게시판</a></li>
	<li><a href="#">CONTACT US</a></li>
</ul>
</nav>
</header>