<%@page import="board.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="board.BoardDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/front.css" rel="stylesheet" type="text/css">

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
<script type="text/javascript" src="../script/jquery-3.6.0.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		// class="brown" 클릭했을때
		$('.brown').click(function(){
// 			alert("클릭");  
//          mainjson.jsp  getBoardList()호출 최근글 5개를 가져와서 => json형태로 변경
//  ajax json데이터를 가져와서 each반복해서 추가 <tr><td class="contxt"></td><td></td></tr>
			$.ajax({
				url:"mainjson.jsp",
				dataType:"json",
				success:function(rdata){
					$.each(rdata,function(index,item){
$('table').append('<tr><td class="contxt"><a href="../center/content.jsp?num='+item.num+'">'+item.subject+'</a></td><td>'+item.date+'</td></tr>');
					});
				}
			});
		});
	});
</script>
</head>
<body>
<div id="wrap">
<!-- 헤더파일들어가는 곳 -->
<jsp:include page="../inc/top.jsp"></jsp:include>
<!-- 헤더파일들어가는 곳 -->
<!-- 메인이미지 들어가는곳 -->
<div class="clear"></div>
<div id="main_img"><img src="../images/main_img.jpg"
 width="971" height="282"></div>
<!-- 메인이미지 들어가는곳 -->
<!-- 메인 콘텐츠 들어가는 곳 -->
<article id="front">
<div id="solution">
<div id="hosting">
<h3>Web Hosting Solution</h3>
<p>Lorem impsun Lorem impsunLorem impsunLorem
 impsunLorem impsunLorem impsunLorem impsunLorem
  impsunLorem impsunLorem impsun....</p>
</div>
<div id="security">
<h3>Web Security Solution</h3>
<p>Lorem impsun Lorem impsunLorem impsunLorem
 impsunLorem impsunLorem impsunLorem impsunLorem
  impsunLorem impsunLorem impsun....</p>
</div>
<div id="payment">
<h3>Web Payment Solution</h3>
<p>Lorem impsun Lorem impsunLorem impsunLorem
 impsunLorem impsunLorem impsunLorem impsunLorem
  impsunLorem impsunLorem impsun....</p>
</div>
</div>
<div class="clear"></div>
<div id="sec_news">
<h3><span class="orange">Security</span> News</h3>
<dl>
<dt>Vivamus id ligula....</dt>
<dd>Proin quis ante Proin quis anteProin 
quis anteProin quis anteProin quis anteProin 
quis ante......</dd>
</dl>
<dl>
<dt>Vivamus id ligula....</dt>
<dd>Proin quis ante Proin quis anteProin 
quis anteProin quis anteProin quis anteProin 
quis ante......</dd>
</dl>
</div>
<div id="news_notice">
<h3 class="brown">News &amp; Notice</h3>
<table>
<%
// // 최근글 5개 출력
// int pageSize=5;
// int startRow =1;
// // BoardDAO 객체생성
// BoardDAO bDAO=new BoardDAO();
// //List<BoardDTO> boardList = getBoardList(startRow, pageSize) 메서드 호출
// List<BoardDTO> boardList =bDAO.getBoardList(startRow, pageSize);

// // 날짜 => 모양변경 => String 문자열 변경
// SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy.MM.dd");
// for(int i=0;i<boardList.size();i++){
// 	BoardDTO bDTO=boardList.get(i);
	%>
<!-- 	<tr><td class="contxt"> -->
<%-- 	<a href="../center/content.jsp?num=<%=bDTO.getNum()%>"> --%>
<%-- 	<%=bDTO.getSubject() %></a> --%>
<!-- 	</td> -->
<%--   		<td><%=dateFormat.format(bDTO.getDate()) %></td></tr>		 --%>
	<%
// }
%>
</table>
</div>
</article>
<!-- 메인 콘텐츠 들어가는 곳 -->
<div class="clear"></div>
<!-- 푸터 들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp"></jsp:include>
<!-- 푸터 들어가는 곳 -->
</div>
</body>
</html>