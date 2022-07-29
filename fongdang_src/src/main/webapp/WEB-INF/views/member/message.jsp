<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/reset.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/font.css">
<link rel="shortcut icon" type="image/x-icon" href="<%=request.getContextPath()%>/resources/images/investor.ico">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/message.css">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메시지</title>
<script src="https://code.jquery.com/jquery-3.6.0.js" ></script>
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
	<div id="message_title_wrap">
		<p id="message_title">메시지</p>
		<p id="message_subcation">퐁당</p>
	</div>              
  	<div id="message_content_wrap">
    	<div id="message_content">
    		${message.m_content}
    	</div>
<c:if test="${message.sender == loginInfo.email}">
    	<div id="answer_wrap" style="width:128px;">
    		<button type="button" id="check_btn">확인</button>    	
    	</div>
</c:if>    	
<c:if test="${message.sender != loginInfo.email}">
		<!-- 사용자가 메이커로부터 수신받은 메시지에 답장 -->
		<div id="answer_wrap" style="width: 250px;">
      		<button type="button" id="answer_btn">답장하기</button>
      		<button type="button" id="check_btn">확인</button>
    	</div>
</c:if> 
    	  
  	</div> 

  <script>
  	var sender = '${message.sender}';
  	var receiver = '${message.receiver}'
  	var email = '${loginInfo.email}';
  	
    $("#answer_btn").click(function() {    	
    	$(".message").show();
    });
    $("#check_btn").click(function() {
    	window.close();
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