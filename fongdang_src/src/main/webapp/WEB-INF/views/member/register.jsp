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
<title>퐁당 회원가입</title>
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
    /* register */
    #container {      
      width: 100%;
      height: 800px;      
    }
    #main_content{      
      	margin: 0 auto;
      	width: 380px;
      	height: 700px;

      	position: relative;
    }
    #main {      
      	height: 600px;
      	padding-top: 45%;      
    }
    #main_title {      
      	width: 300px;
      	height: 50px;
      	font-family: SUIT-SemiBold;
      	font-size: 35px;
      	font-weight: 700;
    }
    #sub_title {
      	font-family: SUIT-Regular;
    }
    #social_login_content {      
      	margin-top: 50px;            
      	height: 70px;
    }
    #icon_group {    	      
      	width: 150px;
      	margin: 10px auto;
    }    
    #kakaoLogin, #naverLogin{    
    	margin: 5px;	   	
    	background: none;
    	border: none;
    }
    #separate {            
      padding-top: 10px;
      text-align: center;
      font-family: SUIT-Light;
      font-size: 12px;
      color: #444c57;
      width: 368px;
    }
    #enroll_btn{
      box-sizing: border-box;      
      width: 380px;
      height: 48px;      
	  font-family: SUIT-Regular;
      font-size: 15px;
      line-height: normal;

      background-color: white;
      color: #444c57;
      border: 1px solid #444c57;
      border-radius: 3px;            
    }
    #enroll_wrap {
      margin: 15px 0;      
    }
    #enroll_foot {            
      width: 250px;
      margin: 30px auto;
      text-align: center;
    }
  </style>
</head>
<body>
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
        <p id="main_title">회원가입</p>     
        <p id="sub_title">
          퐁당 신규회원 가입하고<br>
          다양한 혜택을 받아보세요.
        </p> 
        <div id="social_login_content">          
          	<div id="enroll_wrap">
          		<button type="button" id="enroll_btn" onclick="location.href='<%=request.getContextPath()%>/member/registerForm';">
            		<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-envelope" viewBox="0 0 17 12">
              			<path d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V4Zm2-1a1 1 0 0 0-1 1v.217l7 4.2 7-4.2V4a1 1 0 0 0-1-1H2Zm13 2.383-4.708 2.825L15 11.105V5.383Zm-.034 6.876-5.64-3.471L8 9.583l-1.326-.795-5.64 3.47A1 1 0 0 0 2 13h12a1 1 0 0 0 .966-.741ZM1 11.105l4.708-2.897L1 5.383v5.722Z"/>
            		</svg>
            		이메일로 가입
          		</button>
        	</div>
        </div>
        <hr>
        <p id="separate">또는</p>        
        <div id="icon_group">          	
            <button type="button" id="kakaoLogin" onclick="kakaoLogin()">
            	<img src="<%=request.getContextPath()%>/resources/images/kakao_logo.png" style="width: 45px;">
            </button>            
            <button type="button" id="naverLogin" onclick="naverLogin()">
            	<img src="<%=request.getContextPath()%>/resources/images/naver_logo.png" style="width: 45px;">
            </button>
          </div>
        <div id="enroll_foot">
          <span style="font-size: 13px; font-family: SUIT-Light;">이미 퐁당 계정이 있나요?</span>
          <a href="<%=request.getContextPath()%>/member/login" style="font-size: 13px; font-family: SUIT-Light; color: rgb(182, 224, 214);">로그인</a>
        </div>

      </div>
    </div>
  </div>
  
	<jsp:include page="../footer.jsp" />	
	
	<script>
		function kakaoLogin() {			
			var url = 'https://kauth.kakao.com/oauth/authorize?client_id=' + '<spring:eval expression="@property['kakao.api_key']"/>'
					+ '&redirect_uri='+ '<spring:eval expression="@property['kakao.redirect_uri']"/>' + '&response_type=code';
			location.href= url;						
		}
		
		function naverLogin() {
			// ajax를 통해 얻은 네이버 로그인 URL로 이동
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
