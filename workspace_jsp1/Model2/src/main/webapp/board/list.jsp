<%@page import="com.itwillbs.domain.BoardDTO"%>
<%@page import="com.itwillbs.domain.PageDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board/list.jsp</title>
</head>
<body>
<a href="writeForm.jsp">글쓰기</a>
<%
// //BoardDAO 객체생성
// BoardDAO bDAO=new BoardDAO();
// // 한페이지에 보여줄 글 개수 설정
// int pageSize=3;
// // 페이지번호 없으면 1로 설정
// // http://localhost:8080/JspStudy/board/list.jsp   
// // 페이지번호가 있으면 받은 페이지번호로 설정
// // http://localhost:8080/JspStudy/board/list.jsp?pageNum=2   
// // 페이지번호 파라미터 가져오기 
// String pageNum=request.getParameter("pageNum");
// if(pageNum==null){
// 	// 페이지번호 없으면 1로 설정
// 	pageNum="1";
// }
// // 시작하는 행번호 구하기
// // pageNum    pageSize   => startRow
// //    1          10      =>   (1-1)*10+1=>0*10+1=>0+1=>   1  ~ 10
// //    2          10      =>   (2-1)*10+1=>1*10+1=>10+1=> 11 ~ 20
// //    3          10      =>   (3-1)*10+1=>2*10+1=>20+1=> 21 ~ 30
// int currentPage=Integer.parseInt(pageNum);
// int startRow=(currentPage-1)*pageSize+1;
// // System.out.println("시작하는 행번호 : "+startRow);
// // 끝나는 행번호 구하기
// // startRow  pageSize => endRow
// //     1        10       =>   1+10-1=>10
// //     11       10       =>  11+10-1=>20
// //     21       10       =>  21+10-1=>30
// int endRow = startRow+pageSize-1;
// // System.out.println("끝나는 행번호 : "+endRow);

// // 자바내장객체 API List : 배열형태로 데이터 저장
// // List 리턴할형   getBoardList() 메서드 정의 
// // String sql="select * from board order by num desc limit 시작하는행번호-1,몇개";
// // String sql="select * from board order by num desc limit startRow-1,pageSize";
// // List boardList = getBoardList() 메서드 호출
// List boardList =bDAO.getBoardList(startRow, pageSize);
// // boardList 배열 한칸 접근 get(0) => BoardDTO 주소 => num pass name,... 접근 출력

			List boardList=(List)request.getAttribute("boardList");
			PageDTO pageDTO=(PageDTO)request.getAttribute("pageDTO");
			
%>
<table border="1">
<tr><td>글번호</td><td>글쓴이</td><td>글제목</td><td>조회수</td><td>글쓴날짜</td></tr>
<%
for(int i=0;i<boardList.size();i++){
	// 모든형 Object 형 저장 => BoardDTO 형변환  => 다운캐스팅
	BoardDTO bDTO=(BoardDTO)boardList.get(i);
	%>
	<tr><td><%=bDTO.getNum() %></td>
	    <td><%=bDTO.getName() %></td>
	    <td><a href="content.jsp?num=<%=bDTO.getNum()%>">
	        <%=bDTO.getSubject() %></a></td>
	    <td><%=bDTO.getReadcount() %></td>
	    <td><%=bDTO.getDate() %></td></tr>
	<%
}
%>
</table>
<%

// // 한화면에 보여줄 페이지개수 설정
// int pageBlock=3;
// // 시작하는 페이지번호 구하기
// // 00~09  /10    =>0 ,  10~19 /10 =>1 , 20~29/10 => 2   , 정수형/정수형 => 정수형
// // currentPage  pageBlock => startPage
// //    1~10 (00~09)       10     => (페이지-1)/10*10+1 =>0*10+1=> 0+1=>1
// //    11~20(10~19)       10     => (페이지-1)/10*10+1 =>1*10+1=>10+1=>11
// //    21~30(20~29)       10     => (페이지-1)/10*10+1 =>2*10+1=>20+1=>21
// int startPage=(currentPage-1)/pageBlock*pageBlock+1;
// // 끝나는 페이지번호 구하기 
// // startPage   pageBlock  => endPage
// //    1            10     =>   10
// //    11           10     =>   20
// //    21           10     =>   30
// int endPage=startPage+pageBlock-1;
// // startPage 1  endPage 10  전체페이지 수 2
// //전체 글개수 구하기 => 디비에서 가져오기
// // int  리턴할형  getBoardCount() 메서드 정의
// // select count(*) from board
// int count=bDAO.getBoardCount();
// // 전체 페이지수 구하기 
// // 게시판글 50개  한화면에 보여줄 글개수 10개 => 전체페이지수 5
// //  50/10 => 5   + 나머지 없으면 0페이지 추가
// //  57/10 => 5   + 나머지글은  1페이지 추가
// int pageCount=count / pageSize +  (count % pageSize == 0 ?0:1);

// if(endPage > pageCount){
// 	endPage = pageCount;
// }

//이전
if(pageDTO.getStartPage() > pageDTO.getPageBlock()){
	%><a href="list?pageNum=<%=pageDTO.getStartPage()-pageDTO.getPageBlock()%>">[이전]</a><%
}

//1~10
for(int i=pageDTO.getStartPage();i<=pageDTO.getEndPage();i++){
	%><a href="list?pageNum=<%=i%>"><%=i %></a> <%
}

//다음
if(pageDTO.getEndPage() < pageDTO.getPageCount()){
	%><a href="list?pageNum=<%=pageDTO.getStartPage()+pageDTO.getPageBlock()%>">[다음]</a><%
}
%>

</body>
</html>


