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
 	#find_wrap {
 	 	border-bottom: 1px solid #ccc; 	 	
 		height: 140px; 		
 	}
    #find_title_wrap {
      	width: 1200px;     
      	height: 100%;  
      	margin: 0 auto;    
    }
    #find_title {     
      	box-sizing: border-box;
      	width: 350px;      
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
    }
   	#find_id, #find_pwd {
   		background: none;
   		border: none;
   		font-family: SUIT-Regular;
   		font-size: 15px;
   	}
   	#find_id {
   		border-bottom: 2px solid #b6e0d6;   		 
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
      	height: 500px;
      	background-color: #f5f7fa;
    }
    #member_info_cotent{
    	margin: 0 auto;
    	width: 1200px;
    	height: 100%;
    }
    #id_vision {
      	height: 100%;
      	margin: 0 auto;
      	padding: 30px 0;
    }
    #pwd_vision {
      	height: 100%;
      	margin: 0 auto;
      	padding: 30px 0;
    }
    #memberInfo_form {          
      	width: 370px;
      	height: 200px;
      	margin: 30px auto;
    }    
    .input_email {
      	box-sizing: border-box;
      	width: 365px;
      	height: 48px;
      	line-height: 48px;
      	font-family: SUIT-Regular;
      	font-size: 15px;
      	font-weight: 300;
	    padding-left: 0.95em;
    }
	.error_comment {
		color: red;
		font-size: 13px;
		font-family: SUIT-Light;
		padding-top: 7px;		
	}
    #submit_btn, #send_link, #auth_chk {      
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
    #auth_vision {
    	display: none;
    }
    #result_content {
    	display: none;
    	padding-top: 80px;    	
    	margin: 0 auto;
    	width: 400px;
    	height: 350px;
    }       
    #result_email{    	    
    	color: #444c57;
    	font-weight: bold;
    	font-size: 25px;
    	font-family: SUIT-Regular;
    }
    #result_password {
    	padding-top: 20px;
    
    	color: #444c57;
    	font-family: SUIT-Regular;
    	font-size: 18px;
    	font-weight: bold;    	
    }
    #comment {
    	margin-top: 20px;
    	width: 368px;    	
    	
    	color: rgba(0,0,0,.54);
    	font-family: SUIT-Regular;
    	font-size: 15px;
    	line-height: 20px;
    }
    #btn_wrap {
    	margin-top: 40px;
    	width: 380px;
    	height: 110px;
    }        
    .result_btn {
    	margin-bottom: 10px;
    	width: 368px;
    	height: 48px;
    	border: 1px solid #ccc;
		border-radius: 3px;    	
    	
    	font-size: 17px;
    	font-family: SUIT-Regular;
    	
    }
    #login_btn {
    	background-color: #b6e0d6;
    	color: white;
    }
    #confirm_btn {    	
    	background-color: white;
    	color: #444c57;    		
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
    	var emailValidity = emailValidate(val);
    	console.log(val);
    	
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
        			console.log(result);    			    			
        			var email = result.email;
        			
        			if(email == null) {
        				console.log("email: " + $("#input_email").val());
        				var email = $("#email").val();
        				var html = '는 퐁당에 등록되지 않은 이메일입니다.';
        				var onclick_val = "location.href='"+ "<%=request.getContextPath()%>/member/register'";
        				console.log(onclick_val);

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
		console.log("#send_link_click()");
		var email_val = $("#pwd_email").val();
    	var emailValidity = emailValidate(email_val);
    	console.log("email: " + email_val);
    	
    	 if(emailValidity == false) {
    		return 0;
    	} else { 
    		$.ajax({
    			url: "<%=request.getContextPath()%>/member/authentication",
        		type: "post",
        		data : {        			
        			email: $("#pwd_email").val()
        		},
        		success : function(authNumber) {
        			// * 실제 사용시에는 console.log 띄우지 말기
					console.log("인증번호: " + authNumber);
					alert("인증번호가 전송되었습니다.");	
        			var authNumber = authNumber;
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
						console.log("입력한 인증번호: " + $("#auth_number").val());
						/* console.log("인증번호:  " + authNumber); */
						console.log("email_val: " + email_val);
						var emailValue = email_val;
						var input_num = $("#auth_number").val();
						
						if(input_num == authNumber) {
							console.log("값 일치");
							console.log(emailValue);
							
							$.ajax({
								url: "<%=request.getContextPath()%>/member/find/password",
								type: "get",
								data: {
									email : email_val
								},
								success: function(result) {
									console.log("[컨트롤러에서 가져온값]");
									/* console.log(result);
									console.log("비밀번호: " + result.password); */
									
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
										console.log($("#result_content").html());	
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
  </script>	



</body>
</html>