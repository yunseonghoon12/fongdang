<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/reset.css">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로필 설정</title>
<script src="https://code.jquery.com/jquery-3.6.0.js" ></script>
<style>
  /* profile */
  #container {      
    width: 100%;
    height: 900px;      
  }
  #main_content{     
    width: 370px;
    height: 850px;
    margin: 0 auto;
    padding-top: 2%;
   }
   #main_wrap{
    position: relative;
    height: 50px;
   }
   #main_title{      
    position: absolute;
    font-size: 20px;
    line-height: 24px;
    margin-bottom: 15px;
    color: #444c57;    
  }
  #withdraw {
    position: absolute;
    font-size: 13px;
    top: 25px;
    right: 0;
  }
  #proflie_field {
    margin: 10px 0;
    
    padding-top: 10px;
    font-size: 15px;
    line-height: 20px;
    height: 250px;
  }
  #personal_img {
    display: block;
    width: 130px;
    margin: 0 auto;
  }
  #profile{    
    width: 80px;
    margin: 0 auto;
    padding-top: 25px;
  }
  #id_field {    
    width: 100%;
    height: 90px;
    margin-top: 5px;
    }
  #id_field > label {          
    display: block;
    color: #444c57;
    font-size: 15px;      
    line-height: 24px;
    margin-bottom: 10px;
  }
  #id_field > div > input {
    box-sizing: border-box;
    border: 1px solid #ccc;
    border-radius: 4px;
    width: 368px;
    height: 46px;
    margin-bottom: 7px;
    padding-left: 0.65em;
    font-size: 13px;
    font-weight: 300;     
  }    
  #pwd_field {
    width: 100%;
    height: 90px;
    margin-top: 5px;
    }
  #pwd_field > label {          
    display: block;
    color: #444c57;
    font-size: 15px;      
    line-height: 24px;
    margin-bottom: 10px;
  }
  #pwd_field > div > input {
    box-sizing: border-box;
    border: 1px solid #ccc;
    border-radius: 4px;
    width: 368px;
    height: 46px;
    margin-bottom: 7px;
    padding-left: 0.65em;
    font-size: 13px;
    font-weight: 300;     
  }
  #nickname_field {
      width: 100%;
      height: 90px;
      margin-top: 5px;
    }
  #nickname_field > label {          
    display: block;
    color: #444c57;
    font-size: 15px;      
    line-height: 24px;
    margin-bottom: 10px;
  }
  #nickname_field > div > input {
    box-sizing: border-box;
    border: 1px solid #ccc;
    border-radius: 4px;
    width: 368px;
    height: 46px;
    margin-bottom: 7px;
    padding-left: 0.65em;
    font-size: 13px;
    font-weight: 300;     
  }
  #intro_field {
      width: 100%;
      height: 90px;
      margin-top: 5px;
    }
  #intro_field > label {          
    display: block;
    color: #444c57;
    font-size: 15px;      
    line-height: 24px;
    margin-bottom: 10px;
  }
  #intro_field > div > textarea {
    box-sizing: border-box;
    border: 1px solid #ccc;
    border-radius: 4px;
    width: 368px;
    height: 80px;
    margin-bottom: 7px;
    /* padding-left: 0.65em; */
    padding: 10px;
    font-size: 14px;
    font-weight: 300;     
  }   
  #btn_wrap {
    position: relative;
    margin-top: 50px;
    width: 100%;
    height: 60px;
  }
  #revoke_btn {    
    box-sizing: border-box;
    position: absolute;
    left: 0;

    width: 180px;
    height: 48px;    
    
    background-color: #444c57;
    border: 1px solid #444c57;
    border-radius: 5px;
    color: white;
  }
  #submit_btn {
    box-sizing: border-box;    
    position: absolute;
    right: 0;

    width: 180px;
    height: 48px;

    background-color: #b6e0d6;
    border: 1px solid #b6e0d6;
    border-radius: 5px;
    color: white;  
  }
</style>
</head>
<body>
	<header style="height: 100px; background: #ccc">헤더 영역</header>

  <div id="container">
    <div id="main_content">
      <div id="main_wrap">
        <p id="main_title">프로필 설정</p>  
        <a href="#" id="withdraw">회원탈퇴</a>
      </div>
      <form action="" method="post">
        <div id="proflie_field">
          <p>프로필 사진</p>          
            <img src="<%=request.getContextPath()%>/resources/images/user.png" id="personal_img" alt="회원사진">
            <div>
              <!-- <button type="button" id="profile">프로필 사진 등록</button> -->
              <div id="profile">
                <input type="file">
              </div>
            </div>          
        </div>
        <div id="id_field">
          <label>아이디</label>
          <div>
            <input type="text" placeholder="읽기 전용" readonly>
          </div>
        </div>
        <div id="pwd_field">
          <label>새 비밀번호</label>
          <div>
            <input type="password" autocomplete="off" placeholder="새 비밀번호">
          </div>
        </div>
        <div id="nickname_field">
          <label>닉네임</label>
          <div>
            <input type="text" placeholder="닉네임">
          </div>
        </div>
        <div id="intro_field">
          <label>간단한 한 마디로 나를 소개해주세요</label>
          <div>
            <textarea cols="49" rows="4"></textarea>
          </div>
        </div>
        <div id="btn_wrap">
          <input type="reset" id="revoke_btn" value="취소">
          <input type="submit" id="submit_btn" value="확인">
        </div>
      </form>

    </div>
  </div>

  <footer style="height:100px; background: #ccc">푸터 영역</footer>
</body>
</html>