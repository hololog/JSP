<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="member.MemberDTO"%>
<%@page import="java.util.List"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// json2.jsp  디비에서 데이터를 가져와서 => json 형태로 변경
// MemberDAO  객체생성
MemberDAO mDAO=new MemberDAO();
// 리턴할형을 List<MemberDTO>  getMemberList() 메서드 정의
// List<MemberDTO>  memberList = getMemberList() 메서드호출
List<MemberDTO> memberList =mDAO.getMemberList();
// 배열 데이터를 => JSON 데이터 변경
// 자바 => json변경 하는 프로그램 설치
// WEB-INF - lib -  json-simple-1.1.1.jar
// List =>  JSONArray
// MemberDTO  => JSONObject
JSONArray jsonArray=new JSONArray();
for(int i=0;i<memberList.size();i++){
	MemberDTO mDTO=memberList.get(i);
	//한사람의 데이터 JSONObject저장
	JSONObject jsonObject=new JSONObject();
	jsonObject.put("id", mDTO.getId());
	jsonObject.put("name", mDTO.getName());
	//JSONArray 배열한칸에 저장
	jsonArray.add(jsonObject);
}
%>
<%=jsonArray %>
