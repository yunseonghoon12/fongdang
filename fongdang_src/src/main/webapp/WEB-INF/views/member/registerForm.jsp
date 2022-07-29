<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/reset.css">
<link rel="shortcut icon" type="image/x-icon" href="<%=request.getContextPath()%>/resources/images/investor.ico">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/font.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/registerForm.css">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>퐁당 회원가입</title>
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
      <div id="logo_inclusion">
        <a href="<%=request.getContextPath()%>/">
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
  <div id="container">
    <div id="main_content">
      <p id="main_title">회원가입</p>  
      <p id="sub_title" style="font-family: SUIT-Regular; font-size: 14px; color:#444c57;">
        최소한의 정보를 받고 있습니다.
      </p>   
      <form action="register.do" method="post" id="joinFrm">
        <div id="name_field">
          <label>이름</label>
          <div>
            <input type="text" name="name" id="name" placeholder="이름 입력">
          </div>
          <!-- TODO: error message -->
          <p id="name_error"></p>
        </div>        
        <div id="nickname_field">
          <label>닉네임</label>
          <div>
            <input type="text" name="nickname" id="nickname" placeholder="닉네임 입력">                        
          </div>
          <!-- TODO: error message -->
          <p id="nickname_error"></p>
        </div>
        <div id="email_field">
          <label>이메일</label>
          <div>
            <input type="email" name="email" id="email" autocomplete="off" placeholder="이메일 계정">
            <button type="button" id="email_chk" onclick="emailCheck()">중복확인</button>                  
          </div>
                
          <!-- TODO: error message -->
          <p id="email_error"></p>
        </div>
        <div id="pwd_field">
          <label>비밀번호</label>
          <div>
            <input type="password" name="password" id="password" autocomplete="off" placeholder="비밀번호">
          </div>
          <div>
            <input type="password" name="confirm_password" id="confirm_password" autocomplete="off" placeholder="비밀번호 확인">
          </div>
          <!-- TODO: error message -->
          <p id="pwd_error"></p>
        </div>  
        <div id="fongdang_checkbox">         
          <input type="checkbox" name="chk_agree" id="agree" value="true"><span id="chk_agree">전체동의</span>                  
          <span id="requirement_service">
            펀딩·회원 서비스(필수)                                    
              <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor" class="bi bi-chevron-down" viewBox="0 0 16 10">
                <path fill-rule="evenodd" d="M1.646 4.646a.5.5 0 0 1 .708 0L8 10.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708z"/>
              </svg>            
          </span> 
          <p id="sub_caption">            
            개인정보보호법에 따라 퐁당에 회원가입 신청하시는 분께 수집하는 개인정보의 항목, 개인정보의 수집 및 이용목적, 개인정보의 보유 및 이용기간, 동의 거부권 및 동의 거부 시 서비스 이용이 불가능함을 알려 드리오니 자세히 읽은 후 동의해주세요.
          </p>
        </div> 
        <div>
          <!-- <input type="submit" id="enroll_btn" value="완료"> -->
          <button type="button" id="enroll_btn" onclick="registerHandler()">완료</button>
        </div>
      </form>
    </div>  
  </div>

  <script>  
  	var cnt = 1; 
  	flag = false;
  	
    $("#requirement_service").click(function() {
    	subcationShowHandler();     
    });
  	
    function subcationShowHandler() {    	
     	if(cnt % 2 == 0) {        	
        	$("#sub_caption").hide();         	
      	} else {	        
        	$("#sub_caption").show();         	
      	}
     	++cnt;
    }      
    
    function registerHandler(){
    	var cnf= confirm("회원가입을 진행하시겠습니까?");
   		
    	var name = $("#name").val();
    	var nickname = $("#nickname").val();
   		var email = $("#email").val();
   		var pwd = $("#password").val();
   		var cnf_pwd = $("#confirm_password").val();
   		var utiliy_chk = $("#agree").is(":checked");
   		
   		// 회원가입 정보 유효성 검사
   		var nameValidity = nameValidate(name);
   		var nicknameValidity = nicknameValidate(nickname);
   		var passwordValidity = passwordValidate(pwd, cnf_pwd);
		var emailValidity = emailCheck();		
		
		/* console.log("이메일 검사: " + emailValidity); // 성공: true, 실패: false
   		console.log("name: " + name);
   		console.log("nickname: " + nickname);
		console.log("email: " + email);   		    		
   		console.log("password: " + pwd);
   		console.log("confirm_password: " + cnf_pwd);
   		console.log("약관동의: " + utiliy_chk);
   		console.log("name.length: " + name.length);
   		console.log("nickname.length: " + nickname.length); */
   		
    	if(cnf) {
    		if(emailValidity == false) {
    			alert("이메일 중복확인을 클릭하세요.");
    			return;
    		} else if(utiliy_chk == false) {
    			alert("회원가입은 이용약관에 동의할 경우 가능합니다.");
    			return; 
    		} else if(passwordValidity == false) {
    			return;
    		} else if(nameValidity == false) {
    			return;
    		} else if(nicknameValidity == false) {
    			return; 
    		} else {
    			// 모든 유효성 검사를 마친 경우 회원가입 정보를 전달 
    			console.log("회원가입을 진행합니다.");	
    			joinFrm.submit();
    		}   	    		
    	} else {
    		console.log("회원가입을 취소합니다.");
    	}
    }
    
    function nameValidate(name) {
    	var size= name.length;
    	
    	if(name == '') {
    		$("#name_error").html("이름을 입력해주세요.");
    		return false;	
    	} else if(size < 1 || size > 13) {
    		$("#name_error").html("이름을 2~13자로 입력해주세요.");
    		return false;    		
    	} else {
    		$("#name_error").html(" ");
    		return true;
    	}    	
    }
    
    function nicknameValidate(nickname) {
		var size= nickname.length;
    	
    	if(nickname == '') {
    		$("#nickname_error").html("닉네임을 입력해주세요.");
    		return false;	
    	} else if(size < 2 || size>13) {
    		$("#nickname_error").html("닉네임을 2~10자로 입력해주세요.");
    		return false;    		
    	} else {
    		$("#nickname_error").html(" ");
    		return true;
    	}
    }
    
    function passwordValidate(pwd, cnf_pwd) {
    	var pwd_size = pwd.length;
    	
    	if(pwd == '' || cnf_pwd =='') {
    		$("#pwd_error").html("비밀번호를 입력해주세요.");
    		return false;
    	} else if(pwd_size < 3 || pwd_size > 6) {
    		$("#pwd_error").html("비밀번호를 3~6자 내로 입력해주세요.");
    		return false;
    	} else if(pwd != cnf_pwd) {    
    		$("#pwd_error").html("비밀번호가 일치하지 않습니다.");
    		return false;
    	}  else {
    		$("#pwd_error").html(" ");
    		return true;
    	}    	
    }
    
    function emailValidate(email) {
    	// 이메일 유효성 정규식검사 
    	var filter = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
    	
    	if(email == '') {    		
    		$("#email_error").html("이메일 주소를 다시 입력해주세요.");
    		return false;
    	} else if(!filter.test(email)) {
    		// test() : 주어진 문자열이 정규 표현식을 만족하는지 판별, return값 [true | false]
    		$("#email_error").html("이메일 형식에 맞게 다시 입력해주세요.");
    		return false;
    	} else {    		
    		$("#email_error").html(" ");
    		return true;
    	} 
    }
    
    function emailCheck() {    	  	
    	var input_email = $("#email").val();
    	
    	$.ajax({
	    	url: '<%=request.getContextPath()%>/member/duplication/check',
    		type: 'get',
   			data: {
	    			email: input_email
   			},
   			success: function(data) {    	
   				if(data == 'null') {
   					var html = '이메일을 입력하세요.';
   					$("#email_error").css({
   						"color" : "red"
   					});
   					
   					$("#email_error").html(html);   
   				}
    			if(data == 'pass') {   					
   					// 이메일 유효성 체크
   					var test = emailValidate(input_email);      					
   					if(test == false) {
   						flag = false;
   						console.log("=>state of flag: " + flag);
   						return ;
   					} else {
   						flag = true;	   						
   					}   					
   					var html = '사용 가능한 이메일입니다.';
   					$("#email_error").css({
   						"color" : "green"
   					});
   					
   					$("#email_error").html(html);    				
   				} 
   				if(data == 'fail') {
   					console.log("중복 이메일 검사결과: " + data); // 중복된 이메일 존재  	
   					var html = '이미 존재하는 이메일입니다.';
   					$("#email_error").css({
   						"color" : "red"
   					});
   					
   					$("#email_error").html(html);
   				}
   				
   			},
   			error : function(request, status, error) {
				console.log(request);
				console.log(status);
				console.log(error);				
			}
   		});
    	
	   	return flag;
    }
  
  </script>




</body>
</html>