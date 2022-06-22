<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/reset.css">  
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
      border-bottom: 1px solid #ccc;
      height: 80px;
      position: relative;      
    }
    #logo_inclusion {
      position: absolute;
      width: 100px;      
      left: 13%;
    }     
    #logo {
      width: 85px; 
      height: 60px;      
    }
    #right_content {
      position: absolute;
      left: 80%;
    }
    #right_bar {            
      width: 200px;      
    }
    #right_bar li {      
      display: inline-block;
      margin: 10px;
    }
    #right_bar li a {
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
      margin: 0 auto;
      width: 380px;
      height: 700px;

      position: relative;
    }
    #main {      
      height: 600px;
      padding-top: 110px;      
    }  
    #main_title {      
      width: 300px;
      height: 50px;
      font-size: 35px;
      font-weight: 700;
    }  
    .input_text {
      margin-top: 13px;
      padding: 0 0.95em;
      box-sizing: border-box;
      width: 368px;
      height: 48px;
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
      margin: 2px 0;
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
    #login_content {      
      box-sizing: border-box;
      clear: both;      
      width: 370px;
      height: 60px;         
    }    
    #login_btn {
      margin-top: 10px;
      width: 368px;
      height: 48px;
      border: 1px solid white;
      border-radius: 3px;
      background-color: rgb(182, 224, 214);
      color: white;
      font-size: 17px;
    }
    #separate {                  
      text-align: center;
      font-size: 12px;
      color: #444c57;
      width: 368px;   
      height: 25px;   
      line-height: 25px;
    }
    #social_login_content {                  
      height: 70px;
    }
    #icon_group {      
      width: 190px;
      margin: 10px auto;
    }
    #icon_group > a > img {
      margin: 5px;
    }
    #login_foot {            
      width: 250px;
      margin: 0 auto;
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
      		<div id="logo_inclusion">
		        <a href="#">
    		      <img src="<%= request.getContextPath()%>/resources/images/logo.png" alt="logo" id="logo">
        		</a>
      		</div>
      		<div id="right_content">
	        	<ul id="right_bar">
          			<li><a href="#">로그인</a></li>
          			<li><a href="#">회원가입</a></li>
        		</ul>
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
              <input type="text" name="email" class="input_text" placeholder="이메일"> 
            </div>
            <div>
              <input type="password" name="password" class="input_text" autocomplete="off" placeholder="비밀번호">
            </div>
            <div id="login_action_container">
              <div id="id_save">
                <label style="font-size: 13px;">
                <input type="checkbox" name="" id="chk_id">아이디 저장
                </label>
            </div>
            <div id="find_info">
              <a href="#" style="font-size: 13px;">아이디·비밀번호 찾기</a>
            </div>            
            <div id="login_content"">
              <input type="submit" id="login_btn" value="로그인">            
            </div>
          </form>
          <hr>          
          <p id="separate">또는</p>
          <div id="social_login_content">
            <div id="icon_group">
              <a href="#"><img src="<%= request.getContextPath()%>/resources/images/kakao_logo.png" style="width: 45px;"></a>
              <a href="#"><img src="<%= request.getContextPath()%>/resources/images/naver_logo.png" style="width: 45px;"></a>
              <a href="#"><img src="<%= request.getContextPath()%>/resources/images/google_logo.png" style="width: 45px;"></a>
            </div>
          </div>
          <div id="login_foot">
            <span style="font-size: 13px;">아직 퐁당 계정이 없나요?</span>
            <a href="#" style="font-size: 13px; color: rgb(182, 224, 214);">회원가입</a>
          </div>
      </div>
    </div>
  </div>
	
</body>
</html>