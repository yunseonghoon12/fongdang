<link href="<%=request.getContextPath()%>/resources/css/reset.css" rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/font.css">
<link rel="shortcut icon" type="image/x-icon" href="<%=request.getContextPath()%>/resources/images/investor.ico">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메시지</title>
<script src="https://code.jquery.com/jquery-3.6.0.js" ></script>
<style>
	button {
	    border: none;
	    border-radius: 3px;
	    cursor: pointer;
	    font-family: SUIT-Regular;
	}
	textarea {
	    resize: none;
	    font-family: SUIT-Regular;
	}
	textarea::placeholder {
	    font-family: SUIT-Regular;
	    color: #cccccc;
	}
	.modal {
	    display: none;
	    position: fixed;
	    top: 0;
	    left: 0;
	    width: 100%;
	    height: 100%;
	    z-index: 1;
	    background-color: rgba(0, 0, 0, 0.7);
	}
	.modal > .message_content {
	    position: relative;
	    top: 150px;
	    margin: auto;
	    width: 350px;
	    background-color: #fffaf5;
	    border-radius: 10px;
	    padding: 10px;
	    font-family: SUIT-Regular;
	}
	.message_content .message_input {
	    margin-top: 20px;
	}
	.message_content .message_send {
	    margin-top: 10px;
	}
	.message_content .message_send button {
	    background-color: transparent;
	    font-family: SUIT-Regular;
	    font-size: 15px;
	}
	.message_content #btn_message_cancel {
	    color: #b8b6b6;
	}
	.message_content #btn_message_send {
	    float: right;
	    color: #9BBFD9;
	}
    #modal_wrap {      
      	margin: 0 auto;
      	width: 400px;
      	height: 400px;      
	    background-color: white;
    }
    #modal_title_wrap {
    	background-color: #9bbfd9;
    	height: 60px;
    }
    #modal_title {
    	text-align: center;
    	font-family: SUIT-Regular;
      	font-size: 17px;
      	color: white;      
      	padding-top: 15px;
      	padding-bottom: 5px;
    }
    #modal_subcation {
    	font-family: SUIT-Regular;
    	text-align: center;
      	font-size: 15px;
    }
    #modal_content {
      border: 1px solid #9bbfd9;
      border-radius: 3px;
      margin: 30px 0;
      padding: 15px;
      height: 300px;            
      color: #444c57;
      font-family: SUIT-Regular;
      font-size: 15px;
      line-height: 1.7em;
    }
    #answer_wrap {      
      margin: 0 auto;
      width: 125px;
      height: 45px;
    }
    #answer_btn {            
      width: 120px;
      height: 40px;
      
      font-family: SUIT-Regular;
      font-size: 14px;
      
      background-color: #b6e0d6;
      border: 1px solid #b6e0d6;
      border-radius: 3px;
      color: white;
      
      cursor: pointer;
    }
  </style>
</head>
<body>
	<div class="modal message">
        <div class="message_content">
            <p class="modal_title">답장하기</p>
            <div class="message_input">
                <textarea cols="45" rows="10" name="m_content" id="m_content" placeholder="답장 내용을 입력해주세요.(최대 160자)" maxlength="160"></textarea>
            </div>
            <div class="message_send">
                <button id="btn_message_cancel" type="button">취소</button>
                <button id="btn_message_send" type="submit">보내기</button>
            </div>
        </div>
    </div>
	<div id="modal_title_wrap">
		<p id="modal_title">메시지</p>
		<p id="modal_subcation">퐁당</p>
	</div>              
  	<div id="modal_wrap">
    	<div id="modal_content">
    		${message.m_content }
    	</div>
    	<div id="answer_wrap">
      		<button type="button" id="answer_btn">답장하기</button>
    	</div>  
  	</div> 

  <script>
    console.log("메시지번호: " + ${message.m_no});
    
    $("#answer_btn").click(function() {
    	console.log("답장하기 click()");
    	$(".message").show();
    });
 	// 취소 버튼 클릭 시 모달창 닫기
    $("#btn_message_cancel").on('click', function () {
        $(".message").hide();
    });
    // 모달창 띄우고 내용 있는 곳 부분 제외한 곳 누르면 모달창 닫기
    $(".message").on('click', function () {
        if (event.target == $(".message").get(0)) {
            $(".message").hide();
        }
    });
 	// 보내기 버튼 클릭 시 처리 내용
	$("#btn_message_send").on('click', function(){
		console.log("보내기 클릭");
		if ($("#m_content").val() == "") {
			alert("답장 내용을 입력해주세요. 내용을 입력해야 답장이 가능합니다.");
			$("#m_content").focus();
			return;
		}
		$.ajax({
			url: "<%=request.getContextPath()%>/message/insert/reply",
			type: "post",
			data: {
				m_no: ${message.m_no},
				m_content: $("#m_content").val()
			},
			success: function(result){
				console.log(result);
				if (result == -1) {
					alert("답장이 보내지지 않았습니다. 다시 시도해주세요.");
					$("#m_content").focus();
				} else if (result == 0) {
					alert("로그인을 한 후에 답장이 가능합니다. 로그인 페이지로 이동합니다.");
					location.href = "<%=request.getContextPath()%>/member/login";
				} else if (result == 1) {
					alert("답장을 보냈습니다.");
					$("#m_content").val("");
					$(".message").hide();
				}
			},
			error: function(request, status, error) {
				console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
			}
		});
	});
  </script>


</body>
</html>