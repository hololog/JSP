<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String id=request.getParameter("id");
    // MemberDAO 객체생성
    MemberDAO mDAO=new MemberDAO();
    // MemberDTO mDTO = getMember(id) 메서드 호출
    MemberDTO mDTO=mDAO.getMember(id);
    if(mDTO!=null){
    	// 아이디 있음
    	%>아이디 중복<%
    }else{
    	// 아이디 없음
    	%>아이디 사용가능<%
    }
    %>
