<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath() %>/resources/css/default.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath() %>/resources/css/subpage.css" rel="stylesheet" type="text/css">
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
 <script type="text/javascript">
 	function userCheck() {
// 		alert("중복체크");
		if(document.fr.id.value==""){
			alert("아이디 입력하세요");
			document.fr.id.focus();
			return;
		}
		//창열기
		var id=document.fr.id.value;
		window.open("userCheck.jsp?id="+id,"","width=400,height=300");
	}
 </script>
 <script type="text/javascript" src="${pageContext.request.contextPath }/resources/script/jquery-3.6.0.js"></script>
 <script type="text/javascript">
 	$(document).ready(function(){
 		$('#join').submit(function(){
//  			alert("전송");
				// 아이디 비밀번호 이름 이메일 비어있으면 제어
				if($('#id').val()==""){
					alert("아이디 입력하세요");
					$('#id').focus();
					return false;
				}
				
				if($('#pass').val()==""){
					alert("비밀번호 입력하세요");
					$('#pass').focus();
					return false;
				}
				if($('#pass').val()!=$('#pass2').val()){
					alert("비밀번호 틀림 입력하세요");
					$('#pass2').focus();
					return false;
				}
				
				if($('#name').val()==""){
					alert("이름 입력하세요");
					$('#name').focus();
					return false;
				}
				
				if($('#email').val()==""){
					alert("이메일 입력하세요");
					$('#email').focus();
					return false;
				}
				if($('#email').val()!=$('#email2').val()){
					alert("이메일 틀림 입력하세요");
					$('#email2').focus();
					return false;
				}
 		});//
 		
 		//아이디 중복체크
 		// class="dup" 버튼을 클릭했을때 
 		$('.dup').click(function(){
//  			alert("클릭");
			$.ajax({
				url:"${pageContext.request.contextPath }/member/userCheck2",
				data:{"id":$('#id').val()},
				success:function(rdata){
					if(rdata=='idok'){
						rdata="아이디 사용가능";
					}else{
						rdata="아이디 중복";
					}
					// id="divdup" 에 리턴받은 값 넣기
					$('#divdup').html(rdata);
				}
			});//

 		});//
 		
 		
 	});//
 </script>
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
<article>
<h1>Join Us</h1>
<form action="<%=request.getContextPath() %>/member/joinPro" id="join" method="post" name="fr">
<fieldset>
<legend>Basic Info</legend>

<label>User ID</label>
<input type="text" name="id" class="id" id="id">
<!-- onclick="userCheck()" -->
<input type="button" value="dup. check" class="dup" ><br>
<label></label><div id="divdup">중복체크 하세요</div>

<label>Password</label>
<input type="password" name="pass" id="pass"><br>
<label>Retype Password</label>
<input type="password" name="pass2" id="pass2"><br>
<label>Name</label>
<input type="text" name="name" id="name"><br>
<label>E-Mail</label>
<input type="email" name="email" id="email"><br>
<label>Retype E-Mail</label>
<input type="email" name="email2" id="email2"><br>
</fieldset>

<fieldset>
<legend>Optional</legend>
<label>Address</label>
<input type="text" name="address"><br>
<label>Phone Number</label>
<input type="text" name="phone"><br>
<label>Mobile Phone Number</label>
<input type="text" name="mobile"><br>
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