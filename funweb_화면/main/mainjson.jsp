<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="board.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// main/mainjson.jsp
// 최근글 5개 출력
int pageSize=5;
int startRow =1;
// BoardDAO 객체생성
BoardDAO bDAO=new BoardDAO();
//List<BoardDTO> boardList = getBoardList(startRow, pageSize) 메서드 호출
List<BoardDTO> boardList =bDAO.getBoardList(startRow, pageSize);

JSONArray jsonArray=new JSONArray();
SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy.MM.dd");
for(int i=0;i<boardList.size();i++){
	BoardDTO boardDTO=boardList.get(i);
	
	JSONObject jsonObject=new JSONObject();
	jsonObject.put("num", boardDTO.getNum());
	jsonObject.put("subject", boardDTO.getSubject());
	jsonObject.put("date", dateFormat.format(boardDTO.getDate()));
	
	jsonArray.add(jsonObject);
}
%>
<%=jsonArray %>