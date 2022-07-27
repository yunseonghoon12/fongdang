<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/reset.css">
<link rel="shortcut icon" type="image/x-icon" href="<%=request.getContextPath()%>/resources/images/investor.ico">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/font.css">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>퐁당 회원탈퇴</title>
<script src="https://code.jquery.com/jquery-3.6.0.js" ></script>
<style>
      /* DropOutUser */
    #container {      
     width: 100%;
     height: 850px;     
     margin-top: 100px; 
    }
    #main_content {
      width: 700px;
      height: 800px;
      margin: 0 auto;
      
    }
    #main_content > h1 {
      font-family: SUIT-SemiBold;
      font-size: 36px;
      line-height: 44px;
      font-weight: 700;
    }
    #main_wrap {      
      height: 75px;
      margin-top: 50px;
    }
    #main_title {      
      font-family: SUIT-SemiBold;
      font-size: 28px; 
      line-height: 36px;     
    }
    #sub_caption {
      margin-top: 20px;
      font-family: SUIT-Regular;
      font-size: 15px;
      color: #444c57;      
    }
    #attention_list {      
      /* border: 1px solid red;       */
      margin: 20px 0;
      height: 400px;
    }
    #attention_list li {
      border-top: 1px solid #ccc;
      margin: 10px 0;
    }
    #attention_list li:last-child {
      border-bottom: 1px solid #ccc;
    }
    .list_content {      
      height: 70px;
      padding-top: 15px;      
      color: #444c57;    
    }    
    .list_title {
      font-weight: bold;
      font-family: SUIT-Regular;
      font-size: 15px;
      line-height: 2em;
    }
    .list_caption {
      font-family: SUIT-Light;
      font-size: 13px;
    }
    #chk_agree {
      font-family: SUIT-Regular;
      font-size: 14px;
    }
    #withdraw_btn {
      font-family: SUIT-Regular;
      font-size: 15px;
      width: 116px;
      height: 53px;

      border: 1px solid rgb(243, 156, 18);
      border-radius: 5px;
      background-color: rgb(255, 253, 231);      
      color: rgb(243, 156, 18);
    }
   </style>
</head>
<body>	
	<jsp:include page="../header.jsp"/>
	
  	<div id="container">
	    <div id="main_content">
      		<h1>회원 탈퇴</h1>
      		<div id="main_wrap">
	      	  	<h2 id="main_title">탈퇴 전, 꼭 확인하세요!</h2>
        		<p id="sub_caption">탈퇴 전 반드시 아래 유의 사항을 확인하시기 바랍니다.</p>
        		<ul id="attention_list">
	          		<li>
            			<div class="list_content">
	              			<p class="list_title">탈퇴 후 3개월 내 재가입 불가</p>
              				<p class="list_caption">탈퇴 후 3개월 내 동일 아이디(이메일)로 재가입 불가</p>
            			</div>
          			</li>
          			<li>
	            		<div class="list_content">
              				<p class="list_title">탈퇴 후 재가입 시 신규 회원혜택 제한</p>
              				<p class="list_caption">재가입 후 신규 회원혜택 및 제휴 프로모션 관련 혜택 지급 불가</p>
            			</div>
          			</li>
          			<li>
	            		<div class="list_content">
              				<p class="list_title">탈퇴 후 개인 정보 일괄 삭제</p>
              				<p class="list_caption">참여한/찜 한/개설 중인 프로젝트 등 개인 정보 일괄 삭제</p>
            			</div>
          			</li>
          			<li>
	            		<div class="list_content">
              				<p class="list_title">탈퇴 후 작성한 게시물은 삭제 불가</p>
              				<p class="list_caption">게시글, 댓글, 펀딩한 프로젝트의 투자 리스트에 남겨진 이름 등 삭제 불가</p>
            			</div>
          			</li>
          			<li>
	            		<div class="list_content">
              				<p class="list_title">탈퇴 후 3개월 내 재가입 불가</p>
              				<p class="list_caption">탈퇴 후 3개월 내 동일 아이디(이메일)로 재가입 불가</p>
            			</div>
          			</li>
        		</ul>
        		<form action="<%=request.getContextPath()%>/member/withdraw" method="POST" id="withdrawFrm">
	          		<div style="margin-top: 20px;">
            			<input type="checkbox" name="agree" id="agree" value="true"><span id="chk_agree"> 상기 퐁당 탈퇴 시 유의 사항을 확인하였습니다.</span>                  
          			</div>    
          			<input type="hidden" name="email" value="${loginInfo.email}">      
          			<hr style="margin: 30px 0;">          
            		<button type="button" id="withdraw_btn" onclick="withdrawHandler()">회원 탈퇴</button>          
        		</form>
      		</div>
    	</div>
  	</div>
  	
  	<jsp:include page="../footer.jsp"/>	
	<script>
		function withdrawHandler() {
			var cnf= confirm("회원탈퇴를 요청하시겠습니까?");
			var chk = $("#agree").is(":checked");
			console.log("체크상태: " + chk);
			console.log("체크값: " + ("#agree").val);
			
			if(cnf) {
				if(chk == false) {
					alert("회원탈퇴를 위해 반드시 약관에 동의해야 합니다.");		
					return;
				} else {
					withdrawFrm.submit();
				}
			} else {}
		}
	
		
	
	</script>
</body>
</html>