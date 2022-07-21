<link href="<%=request.getContextPath()%>/resources/css/reset.css" rel="stylesheet">
<link rel="shortcut icon" type="image/x-icon" href="<%=request.getContextPath()%>/resources/images/investor.ico">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/font.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/header.css">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    height: 1000px;      
  }
  #main_content{     
    width: 370px;
    height: 850px;
    margin: 80px auto;
    /* padding: 8% 0; */
   }
   #main_wrap{
    position: relative;
    height: 50px;
   }
   #main_title{      
    position: absolute;
    font-family: SUIT-Regular;
    font-size: 20px;
    line-height: 24px;
    margin-bottom: 15px;
    color: #444c57;    
  }
  #withdraw {
    position: absolute;
    text-decoration:none;
    font-family: SUIT-Light;
    font-size: 13px;
    top: 15px;
    right: 0;
  }
  #proflie_field {  
    margin: 10px 0;
    font-family: SUIT-Regular;
    padding-top: 10px;
    font-size: 15px;
    line-height: 20px;
    height: 350px;
  }
  .personal_img {
    display: block;
    border-radius: 210px;
    width: 210px;
    height: 200px;
    margin: 30px auto;
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
    font-family: SUIT-Regular;
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
    font-family: SUIT-Light;
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
    font-family: SUIT-Regular;
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
    font-family: SUIT-Light;
    font-size: 13px;
    font-weight: 300;     
  }
  #nickname_field {
    width: 100%;
    height: 90px;
    margin-top: 18px;
  }
  #nickname_field > label {          
    display: block;
    color: #444c57;
    font-family: SUIT-Regular;
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
    font-family: SUIT-Light;
    font-size: 13px;
    font-weight: 300;     
  }
  #intro_field {  	
      width: 100%;
      height: 90px;
      margin-top: 5px;
      resize : none;
    }
  #intro_field > label {          
    display: block;
    color: #444c57;
    font-family: SUIT-Regular;
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
    padding: 10px;
    font-family: SUIT-Light;
    font-size: 13px;
    
    resize: none;  
  }   
  #btn_wrap {
    position: relative;
    margin-top: 90px;
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
    border-radius: 3px;
    color: white;
    font-family: SUIT-Regular;
    font-size: 15px;
    
    cursor: pointer;
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
    font-family: SUIT-Regular;
    font-size: 17px;
    
    cursor: pointer;
  }
  
  #pwd_error {
	padding-top: 5px;
	color: red; 
	font-family: SUIT-Light;
	font-size: 13px;
   }
</style>
</head>
<body>
	<!-- <header style="height:200px; color: blue; font-size:32px; text-align:center; background-color:#ccc">헤더 영역</header> -->
	<jsp:include page="../header.jsp"/>
  	<div id="container">
    	<div id="main_content">
      		<div id="main_wrap">
        		<p id="main_title">프로필 설정</p>  
        		<a href="<%=request.getContextPath()%>/member/withdraw" id="withdraw">회원탈퇴</a>
      		</div>
      		<form action="<%=request.getContextPath()%>/member/update" method="post" id="profileFrm" enctype="multipart/form-data">
        		<div id="proflie_field">
          			<p>프로필 사진</p>
<c:if test="${ not empty member.profile}">
          			<input type="hidden" name="profile" value="${member.profile}">
          			<img src="${member.profile}" class="personal_img">          

</c:if>          	
<c:if test="${ empty member.profile}">
            		<img src="<%=request.getContextPath()%>/resources/images/user.png" class="personal_img">
</c:if>		
            		<div>
              			<!-- <button type="button" id="profile">프로필 사진 등록</button> -->
              			<div id="profile"><input type="file" name="uploadfile"></div>
            		</div>          
        		</div>
        	<div id="id_field">
          		<label>아이디</label>
          		<div>
	            	<input type="text" name="email" id="email" value="${member.email}" readonly>
          		</div>
        	</div>
        	<div id="pwd_field">
          		<label>새 비밀번호</label>
<c:choose>
	<c:when test="${!empty kakaoToken or !empty naverToken}">
				<div>
					<input type="text" placeholder="소셜 사이트를 통해 비밀번호를 변경해주세요." readonly="readonly">
				</div>
	</c:when>
	<c:otherwise>
          		<div>
            		<input type="password" name="password" id="password" min="3" autocomplete="off" placeholder="새 비밀번호">
          		</div>
          		<p id="pwd_error"></p>
	</c:otherwise>
</c:choose>	
        	</div>
        	<div id="nickname_field">
          		<label>닉네임</label>
          		<div>
            		<input type="text" name="nickname" id="nickname" placeholder="닉네임">
          		</div>
        	</div>
        	<div id="intro_field">
          		<label>간단한 한 마디로 나를 소개해주세요</label>
          		<div>
	            	<textarea cols="49" rows="4" name="intro" id="intro"></textarea>
          		</div>
        	</div>
        	<div id="btn_wrap">
          		<button type="reset" id="revoke_btn">취소</button>
          		<button type="button" id="submit_btn" onclick="submitHandler()">확인</button>          		
        	</div>
      	</form>
    </div>
  </div>

  <!-- <footer style="height:200px; color: blue; font-size:32px; text-align:center; background-color:#ccc">푸터 영역</footer> -->
  <jsp:include page="../footer.jsp"/>
  <script>
  	$("#submit_btn").click(function () {
  		console.log("email: " + $("#email").val());
  		console.log("password: " + $("#password").val());
  		console.log("passwordTypeof: " + typeof($("#password").val()));
  		console.log("nickname: " + $("#nickname").val());
  		console.log("intro: " + $("#intro").val());
  	});
  	
  	
  	function submitHandler() {
  		var cnf = confirm("회원의 프로필을 수정하시겠습니까?");
  		var pwd = $("#password").val();
  		
  		var passwordValidity = passwordValidate(pwd);  		
  		
  		if(cnf) {  			
  			profileFrm.submit();  			
  		} else {}
  	}
  	
  	function passwordValidate(pwd) {
    	var pwd_size = pwd.length;
    	
    	if(pwd == '') {
    		$("#pwd_error").html("비밀번호를 입력해주세요.");
    		return false;
    	} else if(pwd_size < 3 || pwd_size > 6) {
    		$("#pwd_error").html("비밀번호를 3~6자 내로 입력해주세요.");
    		return false;
    	} else {
    		$("#pwd_error").html(" ");
    		return true;
    	}    	
    }
  	
  </script>
</body>
</html>