<%@page import="java.text.SimpleDateFormat"%>
<%@page import="board.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
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
<!-- 메인이미지 -->
<div id="sub_img_center"></div>
<!-- 메인이미지 -->

<!-- 왼쪽메뉴 -->
<nav id="sub_menu">
<ul>
<li><a href="../center/notice.jsp">Notice</a></li>
<li><a href="../fcenter/fnotice.jsp">자료실</a></li>
<li><a href="../gcenter/gnotice.jsp">갤러리</a></li>
</ul>
</nav>
<!-- 왼쪽메뉴 -->

<!-- 게시판 -->
<%
//한글처리
request.setCharacterEncoding("utf-8");
// search 파라미터 가져오기
String search=request.getParameter("search");

// 폴더 board 파일이름 BoardDAO
// BoardDAO 객체생성
BoardDAO bDAO=new BoardDAO();

// pageSize 한화면에 보여줄 글개수 설정
int pageSize=15;
// pageNum 페이지번호 가져오기
String pageNum=request.getParameter("pageNum");
// pageNum없으면 1페이지 설정 
if(pageNum==null){
	pageNum="1";
}
// startRow 시작하는 행번호 구하기
// pageNum  pageSize  => startRow 
//     1        5     =>   (1-1)*5+1=>0*5+1=>0+1=>1 ~5
//     2        5     =>   (2-1)*5+1=>1*5+1=>5+1=>6 ~10
//     3        5     =>   (3-1)*5+1=>2*5+1=>10+1=>11 ~15
int currentPage=Integer.parseInt(pageNum);
int startRow = (currentPage-1)*pageSize+1;
// endRow 끝나는 행번호 구하기
int endRow=startRow+pageSize-1;

// 리턴할형 List  getBoardList(int startRow, int pageSize) 메서드 정의
// List boardList = getBoardList(startRow, pageSize) 메서드 호출

// List boardList=bDAO.getBoardList(startRow, pageSize, search);
List<BoardDTO> boardList=bDAO.getBoardList(startRow, pageSize, search);

// 날짜 => 모양변경 => String 문자열 변경
SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy.MM.dd");
%>
<article>
<h1>Notice Search</h1>
<table id="notice">
<tr><th class="tno">No.</th>
    <th class="ttitle">Title</th>
    <th class="twrite">Writer</th>
    <th class="tdate">Date</th>
    <th class="tread">Read</th></tr>
    <%
    for(int i=0; i<boardList.size();i++){
//     	BoardDTO bDTO=(BoardDTO)boardList.get(i);
		BoardDTO bDTO=boardList.get(i);
    	%>
<tr onclick="location.href='content.jsp?num=<%=bDTO.getNum()%>'">
    <td><%=bDTO.getNum() %></td>
    <td class="left"><%=bDTO.getSubject() %></td>
    <td><%=bDTO.getName() %></td>
    <td><%=dateFormat.format(bDTO.getDate())%></td>
    <td><%=bDTO.getReadcount() %></td>
</tr>    	
    	<%
    }
    %>
 
</table>
<div id="table_search">
<%
//세션값 가져오기
String id=(String)session.getAttribute("id");
// 세션값이 있으면 글쓰기 버튼 보이기
if(id!=null){
	%>
<input type="button" value="글쓰기" class="btn" onclick="location.href='write.jsp'">	
	<%
}
%>
</div>

<div id="table_search">
<form action="noticeSearch.jsp" method="get">
<input type="text" name="search" class="input_box">
<input type="submit" value="search" class="btn">
</form>
</div>

<div class="clear"></div>
<div id="page_control">
<%
// 한화면에 보여줄 페이지 개수 
int pageBlock=10;
// 시작하는 페이지번호 
// 00~09  /10    =>0 ,  10~19 /10 =>1 , 20~29/10 => 2   , 정수형/정수형 => 정수형
// currentPage         pageBlock => startPage
//    1~10 (00~09)       10     => (페이지-1)/10*10+1 =>0*10+1=> 0+1=>1
//    11~20(10~19)       10     => (페이지-1)/10*10+1 =>1*10+1=>10+1=>11
//    21~30(20~29)       10     => (페이지-1)/10*10+1 =>2*10+1=>20+1=>21
int startPage=(currentPage-1)/pageBlock*pageBlock+1;
//끝나는 페이지번호
// startPage   pageBlock  => endPage
//    1            10     =>   10
//    11           10     =>   20
//    21           10     =>   30
int endPage=startPage+pageBlock-1;

//전체 글개수 구하기 => 디비에서 가져오기
//int  리턴할형  getBoardCount() 메서드 정의
//select count(*) from board where subject like '%search%'
int count=bDAO.getBoardCount(search);

//전체 페이지수 구하기 
//게시판글 50개  한화면에 보여줄 글개수 10개 => 전체페이지수 5
//50/10 => 5   + 나머지 없으면 0페이지 추가
//57/10 => 5   + 나머지글은  1페이지 추가
int pageCount=count / pageSize +  (count % pageSize == 0 ?0:1);

if(endPage > pageCount){
	endPage = pageCount;
}
//이전
if(startPage > pageBlock){
	%><a href="noticeSearch.jsp?pageNum=<%=startPage-pageBlock%>&search=<%=search%>">Prev</a><%
}

// 1~10
for(int i=startPage;i<=endPage;i++){
	%><a href="noticeSearch.jsp?pageNum=<%=i%>&search=<%=search%>"><%=i %> </a><%
}

//다음
if(endPage < pageCount){
	%><a href="noticeSearch.jsp?pageNum=<%=startPage+pageBlock%>&search=<%=search%>">Next</a><%	
}
%>
</div>
</article>
<!-- 게시판 -->
<!-- 본문들어가는 곳 -->
<div class="clear"></div>
<!-- 푸터들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp"></jsp:include>
<!-- 푸터들어가는 곳 -->
</div>
</body>
</html>