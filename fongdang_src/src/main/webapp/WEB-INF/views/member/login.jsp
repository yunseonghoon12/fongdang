<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/reset.css">
<link rel="shortcut icon" type="image/x-icon" href="<%=request.getContextPath()%>/resources/images/investor.ico">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/font.css">
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
<style>  
    /* header */
    a {
	      text-decoration: none;
      	color: #444c57;
    }
    #header_container {
      	position: relative;      
      	border-bottom: 1px solid #ccc;
    }
    #header_content {    
		position: relative;
		margin: 0 auto;
		width: 1280px;
		height: 80px;    	
    }    
    #logo_inclusion {
      	position: absolute;
      	width: 100px;      
      	left: 0; 
    }     
    #logo {      
      	width: 90px; 
      	height: 65px;            
    }
    #right_content {
      	position: absolute;
      	width: 140px;
      	right: 0;      
    }
    #right_bar {            
      	width: 200px;      
    }
    #right_bar li {            
      	display: inline-block;
      	margin: 10px;
    }
    #right_bar li a {
      	font-family:  SUIT-Regular;
      	font-size: 15px;
      	line-height: 55px;
    }      
  </style>
  <style>
    #container {      
      	width: 100%;
      	height: 880px;      
    }
    #main_content{      
      	position: relative;
      	margin: 0 auto;
      	width: 380px;
      	height: 700px;
    }
    #main {      
      	height: 600px;
      	padding-top: 110px;      
    }  
    #main_title {      
      	width: 300px;
      	height: 50px;
      	font-family: SUIT-SemiBold;
      	font-size: 35px;
      	font-weight: 700;
    }  
    .input_text {
      	margin-top: 13px;
      	padding: 0 0.95em;
      	box-sizing: border-box;
      	width: 368px;
      	height: 48px;
      	font-family: SUIT-Regular;
      	font-size: 14px;
      	font-weight: 300;      
      	border: 1px solid #ccc;      
    }
    #login_action_container {
      	/* border: 1px solid #ccc; */
      	box-sizing: border-box;
      	width: 368px;
      	height: 50px;     
      	line-height: 50px;
      	margin: 2px 0 15px 0;
    }
    #id_save {    
      	float: left;       
      	position: relative;        
    }   
    #id_save >label {
      	padding-left: 25px;
    }
    #find_info {
      	float: right;
    }
    #chk_id {
      	position: absolute;
      	width: 18px;
      	height: 18px;  
      	top: 13px;
      	left: 0;      
    }
    .login_content {      
      	box-sizing: border-box;
      	clear: both;      
      	width: 370px;
      	height: 60px;         
    }  
    .login_btn {
    	margin-top: 10px;
      	width: 368px;
      	height: 48px;
      	border-radius: 3px;
      	font-family: SUIT-Regular;
      	font-size: 16px;
      	font-weight: 400;
    }  
    #login_btn {      
      	background-color: rgb(182, 224, 214);
      	border-color: rgb(182, 224, 214);
      	color: white;      
      	cursor: pointer;
    }
    #kakao_btn_content, #naver_btn_content {
    	position: relative;
    }
    #kakao_btn {
		border-color: #fee500;
    	background-color: #fee500;
      	color: #444c57;
      	
      	cursor: pointer;
    }
    #naver_btn {
		border-color: #00d337;
    	background-color: #00d337;
      	color: white;
      	
      	cursor: pointer;
    }    
    #kakao_logo {
    	position: absolute;
    	left: 20px;
    	top: 0;
    }        
    #naver_logo {
    	position: absolute;
    	left: 20px;
    	top: 0;
    }
    #separate {                  
      	text-align: center;
      	font-size: 12px;
      	font-family: SUIT-Regular;
      	color: #444c57;
      	width: 368px;   
      	height: 25px;   
      	line-height: 25px;
    }
    #social_login_content {                  
      	height: 70px;
    }
    #icon_group {      
      	width: 60px;
      	margin: 10px auto;
    }
    #icon_group > a > img {
      	margin: 5px;
    }
    #login_foot {            
      	width: 250px;
      	margin: 30px auto;
      	text-align: center;
    }
  </style>
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
  
	<%-- 
	<form action="<%= request.getContextPath()%>/member/login" method="post">
		<div><input type="text" name="email" placeholder="이메일" required></div>
		<div><input type="password" name="password" placeholder="비밀번호" required></div>		
		<div><button type="submit">로그인</button></div>	
	</form> 
	--%>
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
          		<%-- <p id="separate">또는</p>
          		<div id="social_login_content">
            		<div id="icon_group">              			
              			<a href="#"><img src="<%= request.getContextPath()%>/resources/images/google_logo.png" style="width: 45px;"></a>
            		</div>
          		</div> --%>
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
			console.log("저장된 쿠키값: " + remember_email);
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