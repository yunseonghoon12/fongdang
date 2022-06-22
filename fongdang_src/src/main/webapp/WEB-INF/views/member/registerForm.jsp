<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/reset.css">
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
    /* joinForm */
    #container {      
      width: 100%;   
      height: 850px;      
    }
    #main_content{      
      width: 370px;
      height: 780px;
      margin: 0 auto;
      padding-top: 2%;
    }
    #main_title{      
      font-size: 32px;
      font-weight: 700;
      margin-bottom: 20px;
    }
    #joinFrm {
      margin: 25px 0;      
    }
    #name_field {      
      width: 100%;
      height: 90px;
      margin: 25px 0;
    }
    #name_field > label {          
      display: block;
      color: #444c57;
      font-size: 17px;
      font-weight: 700;
      line-height: 24px;
      margin-bottom: 10px;
    }
    #name_field > div > input {
      box-sizing: border-box;
      border: 1px solid #ccc;
      border-radius: 4px;
      width: 368px;
      height: 48px;
      padding-left: 0.65em;
      font-size: 17px;
      font-weight: 300;     
    }
    #nickname_field {      
      width: 100%;
      height: 90px;
      margin: 25px 0;
    }
    #nickname_field > label {          
      display: block;
      color: #444c57;
      font-size: 17px;
      font-weight: 700;
      line-height: 24px;
      margin-bottom: 10px;
    }
    #nickname_field > div > input {
      box-sizing: border-box;
      border: 1px solid #ccc;
      border-radius: 4px;
      width: 368px;
      height: 48px;
      padding-left: 0.65em;
      font-size: 17px;
      font-weight: 300;     
    }
    #email_field {      
      width: 100%;
      height: 90px;
      margin: 25px 0;
    }
    #email_field > label {          
      display: block;
      color: #444c57;
      font-size: 17px;
      font-weight: 700;
      line-height: 24px;
      margin-bottom: 10px;
    }
    #email_field > div > input {
      box-sizing: border-box;
      border: 1px solid #ccc;
      border-radius: 4px;
      width: 368px;
      height: 48px;
      padding-left: 0.65em;
      font-size: 17px;
      font-weight: 300;     
    }
    #pwd_field {
      width: 100%;
      height: 150px;
      margin: 25px 0;
    }
    #pwd_field > label {          
      display: block;
      color: #444c57;
      font-size: 17px;
      font-weight: 700;
      line-height: 24px;
      margin-bottom: 10px;
    }
    #pwd_field > div > input {
      box-sizing: border-box;
      border: 1px solid #ccc;
      border-radius: 4px;
      width: 368px;
      height: 48px;
      margin-bottom: 7px;
      padding-left: 0.65em;
      font-size: 17px;
      font-weight: 300;     
    }    
    #chk_agree {
      font-size: 14px;
      font-weight: 700;     
      padding-left: 5px;
    }
    #requirement_service {      
      font-size: 14px;
      padding-left: 110px;
    }
    #sub_caption {
      display: none;      
      border: 1px solid #ccc;
      border-radius: 4px;
      width: 350px;
      height: 70px;
      margin: 10px auto;
      padding: 10px;      
      font-size: 11px;  
      line-height: 1rem;    
    }
    #enroll_btn {
      box-sizing: border-box;
      width: 368px;
      height: 48px;
      margin-top: 15px;

      font-size: 16px;
      font-weight: bold;
      background-color: #b6e0d6;
      color: white;
      border: 1px solid #b6e0d6;
      border-radius: 5px;
    }
  </style>
</head>
<body>
	<header>
    <div id="header_container">
      <div id="logo_inclusion">
        <a href="#">
          <img src="resources/images/logo.png" alt="logo" id="logo">
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
  <div id="container">
    <div id="main_content">
      <p id="main_title">회원가입</p>  
      <p id="sub_title" style="font-size: 14px; color:#444c57;">
        최소한의 정보를 받고 있습니다.
      </p>   
      <form action="#" method="post" id="joinFrm">
        <div id="name_field">
          <label>이름</label>
          <div>
            <input type="text" placeholder="이름 입력">
          </div>
          <p><!-- TODO: error message --></p>
        </div>        
        <div id="nickname_field">
          <label>닉네임</label>
          <div>
            <input type="text" placeholder="닉네임 입력">
          </div>
          <p><!-- TODO: error message --></p>
        </div>
        <div id="email_field">
          <label>이메일</label>
          <div>
            <input type="email" placeholder="이메일 계정">
          </div>
          <p><!-- TODO: error message --></p>
        </div>
        <div id="pwd_field">
          <label>비밀번호</label>
          <div>
            <input type="password" name="password" autocomplete="off"  placeholder="비밀번호">
          </div>
          <div>
            <input type="password" name="confirm_password" autocomplete="off" placeholder="비밀번호 확인">
          </div>
          <p><!-- TODO: error message --></p>
        </div>  
        <div id="fongdang_checkbox">         
          <input type="checkbox" name=""><span id="chk_agree">전체동의</span>                  
          <span id="requirement_service">
            펀딩·회원 서비스(필수)                        
              <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor" class="bi bi-chevron-down" viewBox="0 0 16 10">
                <path fill-rule="evenodd" d="M1.646 4.646a.5.5 0 0 1 .708 0L8 10.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708z"/>
              </svg>
            </button>
          </span> 
          <p id="sub_caption">            
            개인정보보호법에 따라 퐁당에 회원가입 신청하시는 분께 수집하는 개인정보의 항목, 개인정보의 수집 및 이용목적, 개인정보의 보유 및 이용기간, 동의 거부권 및 동의 거부 시 서비스 이용이 불가능함을 알려 드리오니 자세히 읽은 후 동의해주세요.
          </p>
        </div> 
        <div>
          <button type="button" id="enroll_btn">완료</button>
        </div>
      </form>
    </div>  
  </div>

  <script>
    $("#requirement_service").click(function() {
      subcationShow();     
    });
    
    var cnt = 1;
    function subcationShow() {      
      
      if(cnt % 2 == 0) {
        console.log("cnt: " + cnt);
        $("#sub_caption").hide(); 
        ++cnt;
      } else {
        console.log("cnt: " + cnt);
        $("#sub_caption").show(); 
        ++cnt;
      }
    }    
  </script>




</body>
</html>