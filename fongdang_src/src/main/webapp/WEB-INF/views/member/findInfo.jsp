<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/reset.css">
<link rel="shortcut icon" type="image/x-icon" href="<%=request.getContextPath()%>/resources/images/investor.ico">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/font.css">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <title>아이디·비밀번호 찾기</title>
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
      font-family: SUIT-Regular;
      font-size: 15px;
      line-height: 55px;
    }      
  </style>
  <style>    
    #find_title_wrap {     
      border-bottom: 1px solid #ccc;       
      height: 140px;      
    }
    #find_title {     
      box-sizing: border-box;
      width: 350px;
      margin-left: 20%;
      margin-top: 3%;
      font-family: SUIT-SemiBold;
      font-size: 32px;
    }    
    #find_info_wrap {     
      font-size: 32px;
      position: relative;
      height: 108px;
    }
    #find_info {      
      position: absolute;
      bottom: 0;
      margin-left: 20%;
    }
    #find_info li {      
      display: inline-block;            
      
    }
    #find_info li:nth-of-type(1) {
      border-bottom: 2px solid #b6e0d6;         
    }
    #find_info li:nth-of-type(1) a{
      color: #b6e0d6;
    }
    #find_info > li > a {            
      text-align: center;
      font-family: SUIT-Regular;
      font-size: 15px;
      height: 70px;      
    }
    #guide {      
      font-family: SUIT-Regular;
      font-size: 14px;
      font-weight: 400;
      line-height: 20px;

      width: 380px;
      height: 60px;
      margin: 0 auto; 
      padding-top: 50px;      
    }        
    #page_body {            
      height: 650px;
      background-color: #f5f7fa;
    }
    #email_form {      
      width: 370px;
      height: 200px;
      margin: 30px auto;
    }
    #pwd_form {
      width: 370px;
      height: 200px;
      margin: 30px auto;
    }
    #input_email {
      box-sizing: border-box;
      width: 365px;
      height: 48px;
      line-height: 48px;
      font-family: SUIT-Regular;
      font-size: 15px;
      font-weight: 300;
      padding-left: 0.95em;
    }

    #submit_btn {      
      box-sizing: border-box;
      width: 365px;
      height: 48px;
      
      font-family: SUIT-Regular;
      font-size: 17px;
      font-weight: 400;
      margin-top: 20px;      
    
      border: 1px solid #b6e0d6;     
      border-radius: 5px;
      background-color: #b6e0d6;      
      color: white;
    }
    #pwd_vision {
      display: none;
    }
  </style>
</head>
<body>
	<header>
    <div id="header_container">
      <div id="logo_inclusion">
        <a href="#">
          <img src="<%=request.getContextPath()%>/resources/images/logo.png" alt="logo" id="logo">
        </a>
      </div>
      <div id="right_content">
        <ul id="right_bar">
          <li><a href="<%=request.getContextPath()%>/member/login">로그인</a></li>
          <li><a href="<%=request.getContextPath()%>/member/register">회원가입</a></li>
        </ul>
      </div>
    </div>
  </header>
  <div id="find_title_wrap">
    <p id="find_title">아이디·비밀번호 찾기</p>    
    <div id="find_info_wrap">
      <ul id="find_info">
        <li id="find_id"><a href="#">아이디 찾기</a></li>
        <li id="find_pwd"><a href="#">비밀번호 찾기</a></li>
      </ul>
    </div>
  </div>
  <div id="page_body">  
    <!-- 아이디 찾기 -->
    <div id="id_vision">
      <p id="guide">
        퐁당은 이메일을 아이디로 사용합니다.<br>
        소유하고 계신 계정을 입력해보세요.<br>
        가입여부를 확인해드립니다.        </p>
      <form action="#" id="email_form">
        <div><input type="text" name="" id="input_email" placeholder="이메일 계정"></div>
        <div id="submit_btn_wrap">
          <button type="button" id="submit_btn">확인</button>          
        </div>
      </form>   
    </div>          
    <!-- 비밀번호 찾기 -->
    <div id="pwd_vision">
      <p id="guide">
        가입하셨던 이메일 계정을 입력하시면, <br>
        비밀번호를 이메일로 발송해드립니다.
      </p>
      <form action="#" id="pwd_form">
        <div><input type="text" name="" id="input_email" placeholder="이메일 계정"></div>
        <div id="submit_btn_wrap">
          <button type="button" id="submit_btn">링크 발송</button>          
        </div>
      </form>
    </div>
  </div>

  
  <footer style="text-align: center; font-size: 13px; font-weight: 300; margin: 30px 0;" >
    <p>KH정보교육원 ｜ 사업자등록번호 : 851-87-00622 ｜ 서울 강남 제2014-01호 ｜ 대표자 : 양진선 ｜ 책임자 : 최홍석 ｜  개인정보관리책임자 : 양진선</p>
    <br>
    <p>종로지원 : 서울특별시 중구 남대문로 120 대일빌딩 2F, 3F</p>
    <p>Copyright &copy; 1998-2022 KH Information Educational Institute All Right Reserved</p>
  </footer>

  <script>
    $("#find_id").click(function() {
      $("#find_id").css({
        "border-bottom" : "2px solid #b6e0d6"
      });   
      $("#find_id a").css({
        "color" : "#b6e0d6"
      });      
      $("#find_pwd").css({
        "border-bottom" : "none"
      });
      $("#find_pwd a").css({
        "color" : "#444c57"
      });     

      $("#id_vision").show();
      $("#pwd_vision").hide();
    });

    $("#find_pwd").click(function() {
      $("#find_id").css({
        "border-bottom" : "none"
      });
      $("#find_id a").css({
        "color" : "#444c57"
      });

      $("#find_pwd").css({
        "border-bottom" : "2px solid #b6e0d6"
      });     
      $("#find_pwd a").css({
        "color" : "#b6e0d6"
      });

      $("#id_vision").hide();
      $("#pwd_vision").show();
    });    
  </script>	



</body>
</html>