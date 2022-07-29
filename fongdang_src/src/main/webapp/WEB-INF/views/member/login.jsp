<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/reset.css">
<link rel="shortcut icon" type="image/x-icon" href="<%=request.getContextPath()%>/resources/images/investor.ico">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/font.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/login.css">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
<script src="https://code.jquery.com/jquery-3.6.0.js" ></script>
</head>
<body>
<script>
	var msg = "${msg}";
	
	if(msg != '') {
		alert(msg);
	}	
</script>
	<header>
    	<div id="header_container">
    		<div id="header_content">
      			<div id="logo_inclusion">
		        	<a href="<%=request.getContextPath()%>/">
    		      	<img src="<%= request.getContextPath()%>/resources/images/logo.png" alt="logo" id="logo">
        			</a>
      			</div>
      			<div id="right_content">
			    	<ul id="right_bar">
          				<li><a href="<%=request.getContextPath()%>/member/login">로그인</a></li>
          				<li><a href="<%=request.getContextPath()%>/member/register">회원가입</a></li>
        			</ul>
      			</div>
    		</div>
    	</div>
 	</header>
 	
	<div id="container">
    	<div id="main_content">
      		<div id="main">      
        		<p id="main_title">로그인</p>
          		<form action="<%= request.getContextPath()%>/member/login" method="post">
            		<div>  
              		<input type="text" name="email" id="email" class="input_text" required placeholder="이메일"> 
            		</div>
           
            		<div>
              			<input type="password" name="password" class="input_text" required autocomplete="off" placeholder="비밀번호">
            		</div>
            		<div id="login_action_container">
            			<div id="id_save">
                			<label for="chk_id" style="font-size: 13px; font-family: SUIT-Light;">
                				<input type="checkbox" name="remember_email" id="chk_id">아이디 저장
                			</label>
            			</div>
            			<div id="find_info">
              				<a href="<%=request.getContextPath()%>/member/findInfo" style="font-size: 13px; font-family: SUIT-Light;">아이디·비밀번호 찾기</a>
            			</div> 
            		</div>           
            		<div class="login_content">
              			<input type="submit" class="login_btn" id="login_btn" value="로그인">            
            		</div>
            		<div class="login_content">
              			<button type="button" class="login_btn" id="kakao_btn" onclick="kakaoLogin()">
              				<div id="kakao_btn_content">
              					<span id="kakao_logo"><img src="<%= request.getContextPath()%>/resources/images/kakao_logo.png" style="width: 20px;"></span>
              					카카오로 시작하기
              				</div>              				
              			</button>            
            		</div>
            		<div class="login_content">
              			<button type="button" class="login_btn" id="naver_btn" onclick="naverLogin()">
              				<div id="naver_btn_content">
              					<span id="naver_logo"><img src="<%= request.getContextPath()%>/resources/images/naver_logo.png" style="width: 20px;"></span>
              					네이버로 시작하기
              				</div>
              			</button>                
            		</div>
          		</form>
          		<hr>          
          		
          		<div id="login_foot">
            		<span style="font-size: 13px; font-family: SUIT-Light;">아직 퐁당 계정이 없나요?</span>
            		<a href="<%= request.getContextPath()%>/member/register" style="font-family:SUIT-Light; font-size:13px; color: rgb(182, 224, 214);">회원가입</a>
          		</div>
      		</div>
    	</div>
  	</div>
	
	<script>				
		/* 저장된 쿠키값 불러오기 */
		var remember_email = "${member.email}";	    
		if (remember_email != '') {			
			$("#chk_id").attr("checked", true);	
			$("#email").val(remember_email);
		}
		
		function kakaoLogin() {			
			var url = 'https://kauth.kakao.com/oauth/authorize?client_id=' + '<spring:eval expression="@property['kakao.api_key']"/>'
					+ '&redirect_uri='+ '<spring:eval expression="@property['kakao.redirect_uri']"/>' + '&response_type=code';
			location.href= url;						
		}
		
		function naverLogin() {
			// ajax를 통해 네이버 로그인 URL을 얻고, 얻은 url로 이동
			$.ajax({
	        	url: '<%=request.getContextPath()%>/member/login/getNaverAuthUrl',
	        	type: 'get',
	    	}).done(function (res) {
		        location.href = res;
	    	});	
		}
	</script>
</body>
</html>