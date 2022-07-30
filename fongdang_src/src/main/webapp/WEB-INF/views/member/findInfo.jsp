<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/reset.css">
<link rel="shortcut icon" type="image/x-icon" href="<%=request.getContextPath()%>/resources/images/investor.ico">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/font.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/memberFindInfo.css">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <title>아이디·비밀번호 찾기</title>
<script src="https://code.jquery.com/jquery-3.6.0.js" ></script>
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
 	<div id="find_wrap">
  		<div id="find_title_wrap">
		    <p id="find_title">아이디·비밀번호 찾기</p>    
		    <div id="find_info_wrap">
      			<ul id="find_info">
        			<button id="find_id">아이디 찾기</button>
        			<button id="find_pwd">비밀번호 찾기</button>
      			</ul>
    		</div>
  		</div> 	
 	</div>
  <div id="page_body">  
  	<div id="member_info_cotent">
	    <!-- 아이디 찾기 -->
	    <div id="id_vision">
      		<p id="guide">
		        퐁당은 이메일을 아이디로 사용합니다.<br>
        		소유하고 계신 계정을 입력해보세요.<br>
        		가입여부를 확인해드립니다.     
        	</p>
      		<form id="memberInfo_form">
		        <div><input type="text" name="email" class="input_email" id="email" placeholder="이메일 계정"></div>
		        <p class="error_comment"></p>
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
      		<form id="memberInfo_form">
		        <div><input type="text" name="email" class="input_email" id="pwd_email" placeholder="이메일 계정"></div>
		        <p class="error_comment"></p>
        		<div id="submit_btn_wrap">
          			<button type="button" id="send_link">링크 발송</button>          
        		</div>
      		</form>
    	</div>
    	<div id="auth_vision"></div>
    	
    	<div id="result_content">
	    	<div id="result_comment_wrap">
	    		<p id="result_email"></p>
	    		<p id="comment"></p>
	    		<div id="btn_wrap">
	    			<div><button type="button" class="result_btn" id="login_btn" onclick="location.href='<%=request.getContextPath()%>/member/login';">로그인</button></div>
	    			<div><button type="button" class="result_btn" id="confirm_btn" onclick="location.href='<%=request.getContextPath()%>/member/findInfo';">다시 확인</button></div>
	    		</div>
	    	</div>
    	</div> 	
  	</div>
  </div>

  <jsp:include page="../footer.jsp"/>

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
      location.reload(); 
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
      	
      	$("#result_content").html(" ");  
      	$("#id_vision").hide();
      	$("#pwd_vision").show();      
    });    
    
    $("#submit_btn").click(function() {
    	var val = $("#email").val();
    	// 이메일 유효성 체크
    	var emailValidity = emailValidate(val);    	
    	
    	if(emailValidity == false) {
    		return 0; 
    	} else {
    		$.ajax({
    	    	url: "<%=request.getContextPath()%>/member/find/email",
        		type: "post",
        		data: {
    	    		email: $("#email").val()
        		},
        		success: function(result) {		    			
        			var email = result.email;
        			
        			if(email == null) {
        				console.log("email: " + $("#input_email").val());
        				var email = $("#email").val();
        				var html = '는 퐁당에 등록되지 않은 이메일입니다.';
        				var onclick_val = "location.href='"+ "<%=request.getContextPath()%>/member/register'";

        				$("#result_email").html(email);
        				$("#comment").html(html);
        				
        				$("#login_btn").removeAttr("onclick");
        				$("#login_btn").attr("onclick", onclick_val);
        				$("#login_btn").html("회원가입하기");
        				
        				
        				$("#id_vision").hide();
        				$("#result_content").show();
        			} else {
        				console.log("email: " + email);				
        				var email = result.email;        				
        				var html = '회원으로 등록된 이메일 아이디입니다.';
        				html += '<br>해당 이메일로 로그인하고 퐁당을 이용하세요!'        				
        				
        				$("#id_vision").hide();
        				$("#result_email").html(email);
        				$("#comment").html(html);
        				$("#result_content").show();
        			}    		
        		},
        		error : function(request, status, error) {
    				console.log(request);
    				console.log(status);
    				console.log(error);								
    			}    	
        	});	
    	}
    });
    
    $("#send_link").click(function() {
		console.log("#send_link click()");
		var email_val = $("#pwd_email").val();
    	var emailValidity = emailValidate(email_val);
    	member_chk = memberCheckHandler(email_val);
    	    	
    	if(emailValidity == false) { // 이메일 유효성 확인
    		return ;
    	} else if(member_chk != 0) { // 기존 회원 유저인지 확인 
    		switch(member_chk) {
    			case 1:
    				alert("입력하신 이메일은 소셜로 가입한 계정입니다. 가입때 사용한 소셜계정으로 로그인해주세요.");
    				break;
    			case -1:
    				alert("입력하신 이메일이 존재하지 않습니다. 회원가입을 진행해주세요.");
    				break;
    		}    		
   		 	return;
   	 	} else { 
    		alert("인증번호가 전송되었습니다.");
    		$.ajax({
    			url: "<%=request.getContextPath()%>/member/authentication",
        		type: "post",
        		data : {        			
        			email: $("#pwd_email").val()
        		},
        		success : function(authNumber) {        			
        			var authNumber = authNumber; // 난수로 생성한 인증번호
        			var html = "";
					$("#pwd_vision").hide();
					$("#auth_vision").show();
				
	      			html += '<p id="guide">';
	    		    html += '   가입하셨던 이메일 계정을 입력하시면, <br>';
	        		html += '	비밀번호를 이메일로 발송해드립니다.';
	      			html += '</p>';
	      			html += '<form id="memberInfo_form">';
	      			html += '	<div><input type="text" name="auth_number" class="input_email" id="auth_number" placeholder="인증번호 6자리를 입력하세요."></div>';
	      			html += '	<p class="error_comment"></p>';
	      			html += '	<div id="submit_btn_wrap">';
	      			html += '		<button type="button" id="auth_chk">확인</button>  ';
	      			html += '	</div>';
	      			html += '</form>';
					
					$("#auth_vision").html(html);
					$("#auth_chk").click(function() {
						var emailValue = email_val;
						var input_num = $("#auth_number").val();
						
						if(input_num == authNumber) {
							$.ajax({
								url: "<%=request.getContextPath()%>/member/find/password",
								type: "get",
								data: {
									email : email_val
								},
								success: function(result) {
									
									if(result.email == null) {
										alert("회원이 존재하지 않습니다.");
										location.href= '<%=request.getContextPath()%>/member/findInfo';
									} else {
										var html = '';
										var email = result.email;
										var password = result.password;
										const onclick_val = "location.href='"+ "<%=request.getContextPath()%>/member/login'";
										
										html += '<p id="result_password">';
										html += 	email+ '의 비밀번호는 ';
										html += '	<span style="color:blue">' + password +'</span> 입니다.';
										html +=	'</p>';
										html += '<div id="btn_wrap">';
										html += '	<div><button type="button" class="result_btn", id="login_btn">로그인 하러가기</button></div>';
										html += '</div>';																		
										
										$("#auth_vision").hide();
										$("#result_content").html(" ");
										$("#result_content").html(html);
										$("#result_content").show();
										
										$("#login_btn").removeAttr("onclick");
				        				$("#login_btn").attr("onclick", onclick_val);
									}
									
								}, 
								error : function(request, status, error) {
				    				console.log(request);
				    				console.log(status);
				    				console.log(error);				
				    			}	
							});  
						} else {
							console.log("값 불일치");
							alert("인증번호가 일치하지 않습니다.");
						}
					});
					
        		},
        		error : function(request, status, error) {
    				console.log(request);
    				console.log(status);
    				console.log(error);								
    			}	
    		});  
    		 
    	 }  
	});
    
    function emailValidate(email) {
    	// 이메일 유효성 정규식검사 
    	var filter = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
    	
    	if(email == '') {    		
    		$(".error_comment").html("이메일 주소를 다시 입력해주세요.");
    		return false;
    	} else if(!filter.test(email)) {
    		// test() : 주어진 문자열이 정규 표현식을 만족하는지 판별, return값 [true | false]
    		$(".error_comment").html("이메일 형식에 맞게 다시 입력해주세요.");
    		return false;
    	} else {    		
    		$(".error_comment").html(" ");
    		return true;
    	} 
    }
    
    function memberCheckHandler(email_val) { 
    	var chk_result;
    	
    	$.ajax({
    		url: '<%=request.getContextPath()%>/member/find/email/confirm',
    		type: 'post',
    		data: {
    			email : email_val
    		},
    		async: false, // 동기 방식으로 설정    		
    		success : function (result) {  
    			chk_result = result;
    		  			
    			if(result == 1) { 
    				// 1. 소셜회원인경우 return 1
    				console.log("check social_member");
    			} else if(result == 0) { 
    				// 2. 기존회원인경우 return 0
    				console.log("exsisting member");
    			} else { 
    				// 3. 가입하지 않은 회원인 경우 return -1
    				console.log("member is not exist");
    			}
    		},
    		error : function(request, status, error) {
				console.log(request);
				console.log(status);
				console.log(error);								
			}
    	});
    	return chk_result;
    }    
    
  </script>	



</body>
</html>