<link href="<%=request.getContextPath()%>/resources/css/reset.css" rel="stylesheet">
<link rel="shortcut icon" type="image/x-icon" href="<%=request.getContextPath()%>/resources/images/investor.ico">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/font.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/header.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/profileSettup.css">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로필 설정</title>
<script src="https://code.jquery.com/jquery-3.6.0.js" ></script>
</head>
<body>	
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
          			<input type="hidden" name="profile" value="${member.profile}" style="cursor: pointer;">
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
					<input type="text" name="password" id="new_password" placeholder="소셜 사이트를 통해 비밀번호를 변경해주세요." readonly="readonly">
				</div>
	</c:when>
	<c:otherwise>
          		<div>
            		<input type="password" name="password" id="new_password" autocomplete="off" placeholder="비밀번호">
            		<input type="password" name="cnf_password" id="cnf_new_password" autocomplete="off" placeholder="비밀번호 확인">
          		</div>
          		<p id="pwd_error"></p>
	</c:otherwise>
</c:choose>	
        	</div>
        	<div id="nickname_field">
          		<label>닉네임</label>
          		<div>
            		<input type="text" name="nickname" id="nickname" placeholder="닉네임" maxlength="10" >
          		</div>
        	</div>
        	<div id="intro_field">
          		<label>간단한 한 마디로 나를 소개해주세요</label>
          		<div>
	            	<textarea cols="49" rows="4" name="intro" id="intro"></textarea>
          		</div>
        	</div>
        	<div id="btn_wrap">
          		<button type="button" id="revoke_btn" onclick="revokeHandler()">취소</button>
          		<button type="button" id="submit_btn" onclick="submitHandler()">확인</button>          		
        	</div>
      	</form>
    </div>
  </div>
  
  <jsp:include page="../footer.jsp"/>
  
  <script>  	  	
  	function revokeHandler() {
  		var cnf= confirm("취소 시, 설정하신 프로필 정보가 적용되지 않습니다. 취소하시겠습니까?");
  		
  		if(cnf) {
  			location.href='<%=request.getContextPath()%>/member/myfongdang';
  		} else {} 
  	}
  	
  	function submitHandler() {
  		/* console.log("email: " + $("#email").val());
  		console.log("new_password: " + $("#new_password").val());  		
  		console.log("nickname: " + $("#nickname").val());
  		console.log("intro: " + $("#intro").val()); */
  		
  		var cnf = confirm("회원의 프로필을 수정하시겠습니까?");
  		var new_password = $("#new_password").val();
  		var cnf_pwd = $("#cnf_new_password").val();
  		var nickname = $("#nickname").val();  		
  		var flag = true;
  		
  		if(cnf) {  			
  			if(new_password == "") { // 비밀번호 값을 입력하지 않은 경우
  				console.log('new_password is null');
  				profileFrm.submit();
  			} else { 
  				console.log('new_password is not null');
  				var passwordValidity = passwordValidate(new_password, cnf_pwd); // 비밀번호 유효성 확인  				
  				if(passwordValidity == false) {  	
  					flag = false;
  				}  				
  			} 
  				
  			if(flag == true) {
  				profileFrm.submit();	
  			}
  		} else {}
  	}  	  	
  	
  	function passwordValidate(pwd, cnf_pwd) {
    	var pwd_size = pwd.length;
    	
    	if(cnf_pwd =='') {
    		$("#pwd_error").html("변경할 비밀번호을 다시 입력해주세요.");
    		$("#cnf_new_password").css( {"border" : "1px solid red"} );
    		return false;
    	} else if(pwd_size < 3 || pwd_size > 6) {
    		$("#cnf_new_password").css( {"border" : "1px solid red"} );
    		$("#new_password").css( {"border" : "1px solid red"} );
    		$("#pwd_error").html("비밀번호를 3~6자 내로 입력해주세요.");
    		return false;
    	} else if(pwd != cnf_pwd) {
    		$("#cnf_new_password").css( {"border" : "1px solid red"} );
    		$("#pwd_error").html("비밀번호가 일치하지 않습니다.");
    		return false;
    	} else {
    		$("#new_password").css( {"border" : "1px solid black"} );    		
    		$("#cnf_new_password").css( {"border" : "1px solid black"} );
    		$("#pwd_error").html(" ");
    		return true;
    	}    	
    }  	
  	
  </script>
</body>
</html>