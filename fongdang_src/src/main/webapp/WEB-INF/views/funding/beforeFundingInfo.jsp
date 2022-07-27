<link href="<%=request.getContextPath()%>/resources/css/reset.css" rel="stylesheet">
<link rel="shortcut icon" type="image/x-icon" href="<%=request.getContextPath()%>/resources/images/investor.ico" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/font.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/beforeFundingInfo.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/beforeFundingInfo_modal.css">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펀딩예정 상세조회</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<style>
.funding_story img {
	width: 1200px;
    position: relative;
    right: 120px;
}
</style>
</head>
<body>
	<jsp:include page="../header.jsp" />
	<div class="modal message">
		<div class="message_content">
			<p class="modal_title">문의하기</p>
			<p class="message_notice">* 문의하기는 실시간 채팅이 아닙니다. 판매자에게 답장이 올 때까지
				기다려주세요. *</p>
			<div class="message_input">
				<input type="hidden" id="receiver" value="${funding.maker_name}">
				<textarea cols="43" rows="10" name="message" id="m_content" placeholder="문의 내용을 입력해주세요.(최대 160자)" maxlength="160"></textarea>
			</div>
			<div class="message_send">
				<button id="btn_message_cancel" type="button">취소</button>
				<button id="btn_message_send" type="button">보내기</button>
			</div>
		</div>
	</div>
	<div class="modal phone">
		<div class="phone_content">
			<p class="modal_title">알림신청</p>
			<div class="phone_input">
				<input type="hidden" id="p_no" value="${funding.p_no}"> <input
					type="text" name="s_receiver" id="s_receiver"
					placeholder="오픈 알림을 받을 번호를 입력해주세요." maxlength="11"> <span
					style="font-family: SUIT-Light; font-size: 10px; color: red;">*
					핸드폰 번호 입력 시 '-'를 제외한 숫자만 입력해주세요.</span>
			</div>
			<div class="phone_submit">
				<button id="btn_phone_cancel" type="button">취소</button>
				<button id="btn_phone_submit" type="button">입력</button>
			</div>
		</div>
	</div>
	<div class="modal alarm">
		<div class="alarm_content">
			<p>오픈 알림이 신청되었습니다!</p>
		</div>
	</div>
	<div class="modal cancel_alarm">
		<div class="cancel_alarm_content">
			<p>오픈 알림 신청이 취소되었습니다.</p>
		</div>
	</div>
	<div class="main_wrap">
		<div class="wrap content" style="width: 1200px; margin: 0 auto;">
			<div class="funding_header" style="margin-top:32px;">
				<p>${funding.category_name}</p>
				<h2>${funding.p_name}</h2>
			</div>
			<div class="funding_content">
				<section class="funding_info">
					<div class="left_funding_info">
						<img id="thumbnail_img" src="${funding.p_thumbnail}">
						<p style="margin-top: 15px; margin-bottom: 15px;">${funding.p_summary}</p>
					</div>
					<div class="right_funding_info">
						<c:choose>
							<c:when test="${empty funding.sms}">
								<button id="btn_funding_alarm" type="button">
									<img src="<%=request.getContextPath()%>/resources/images/funding_alarm.png">알림신청<span style="margin-left: 10px; font-size: 12px;">${funding.p_sms_cnt}명이 신청 중</span>
								</button>
							</c:when>
							<c:when test="${not empty funding.sms}">
								<input type="hidden" id="s_no" value="${funding.sms.s_no}">
								<button id="btn_funding_alarm_cancel" type="button">
									<img src="<%=request.getContextPath()%>/resources/images/funding_alarm.png">알림신청완료<span style="margin-left: 10px; font-size: 12px;">${funding.p_sms_cnt}명이 신청 중</span>
								</button>
							</c:when>
						</c:choose>
						<p class="funding_open_info">${funding.start_day}오픈예정</p>
						<button id="btn_message" type="button"><img src="<%=request.getContextPath()%>/resources/images/message.png">판매자에게 문의하기</button>
						<h3>메이커 정보</h3>
						<div class="maker_info">
							<div class="maker_img_name">
								<div class="maker_logo"></div>
								<span class="maker_name">${funding.maker_name}</span>
							</div>
							<table>
								<c:if test="${not empty funding.maker_email}">
									<tr>
										<th>이메일</th>
										<td>${funding.maker_email}</td>
									</tr>
								</c:if>
								<c:if test="${not empty funding.maker_phone}">
									<tr>
										<th>문의전화</th>
										<td>${funding.maker_phone}</td>
									</tr>
								</c:if>
								<c:if test="${not empty funding.maker_kakao_channel}">
									<tr>
										<th>카카오톡 채널</th>
										<td>${funding.maker_kakao_channel}</td>
									</tr>
								</c:if>
								<c:if test="${not empty funding.maker_homepage}">
									<tr>
										<th>홈페이지</th>
										<td>${funding.maker_homepage}</td>
									</tr>
								</c:if>
							</table>
						</div>
					</div>
				</section>
				<nav class="funding_menu">
					<input type="radio" name="tab" id="story_tab" checked><label
						for="story_tab" class="tab_btn">스토리</label>
				</nav>
				<section class="funding_story">${funding.p_story}</section>
			</div>
		</div>
	</div>
	<jsp:include page="../footer.jsp" />
    <script>
        // 문의하기 버튼 클릭 시 모달창 띄우기
        $("#btn_message").on('click', function(){
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
     	// 문의하기 버튼 클릭 시 처리 내용
		$("#btn_message_send").on('click', function(){
			console.log("보내기 클릭");
			if ($("#m_content").val() == "") {
				alert("문의 내용을 입력해주세요. 내용을 입력해야 문의가 가능합니다.");
				$("#m_content").focus();
				return;
			}
			$.ajax({
				url: "<%=request.getContextPath()%>/message/insert",
				type: "post",
				data: {
					m_content: $("#m_content").val(),
					receiver: $("#receiver").val()
				},
				success: function(result){
					console.log(result);
					if (result == -1) {
						alert("문의가 보내지지 않았습니다. 다시 시도해주세요.");
						$("#m_content").focus();
					} else if (result == 0) {
						alert("로그인을 한 후에 문의가 가능합니다. 로그인 페이지로 이동합니다.");
						location.href = "<%=request.getContextPath()%>/member/login";
					} else if (result == 1) {
						alert("판매자에게 문의를 했습니다. 답장을 기다려주세요.");
						$("#m_content").val("");
						$(".message").hide();
					}
				},
				error: function(request, status, error) {
					console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
				}
			});
		});
        // 문의하기 성공 시, 내용 입력 창 초기화 후 알럿창 띄우고 모달창 닫기
        /* $("#btn_message_send").on('click', function(){
            alert("판매자에게 문의했습니다. 답장을 기다려주세요.");
            $(".message_input textarea").val("");
            $(".message").hide();
        }); */
        
        // 알림신청 버튼 클릭 시 모달창 띄우기
        $("#btn_funding_alarm").on('click', function(){
            $(".phone").show();
        });
     	// 모달창 띄우고 내용 있는 곳 부분 제외한 곳 누르면 모달창 닫기
        $(".phone").on('click', function () {
            if (event.target == $(".phone").get(0)) {
                $(".phone").hide();
            }
        });
        // 취소 클릭 시 전화번호 입력 모달창 닫기
        $("#btn_phone_cancel").on('click', function() {
        	$(".phone").hide();
        });
        // 입력 클릭 시 처리부분
        $("#btn_phone_submit").on('click', function() {
        	console.log("입력 클릭");
        	var regPhone = /^01([0|1|6|7|8|9])([0-9]{3,4})([0-9]{4})$/;
			if ($("#s_receiver").val() == "") {
				alert("알람을 받을 번호를 입력해주세요. 번호를 입력해야 알림신청이 가능합니다.");
				$("#s_receiver").focus();
				return;
			}
			if (regPhone.test($("#s_receiver").val()) === false) { // 입력한 휴대폰 번호 유효성 체크
                alert('휴대폰 번호를 정확히 입력해주세요.');
                $("#s_receiver").focus();
                return;
            }
			$.ajax({
				url: "<%=request.getContextPath()%>/sms/insert",
				type: "post",
				data: {
					p_no: $("#p_no").val(),
					s_receiver: $("#s_receiver").val()
				},
				success: function(result){
					console.log(result);
					if (result == -1) {
						alert("알림 신청이 되지 않았습니다. 다시 시도해주세요.");
						$("#s_receiver").focus();
					} else if (result == 0) {
						alert("로그인을 한 후에 알림신청이 가능합니다. 로그인 페이지로 이동합니다.");
						location.href = "<%=request.getContextPath()%>/member/login";
					} else if (result == 1) {
						$("#s_receiver").val("");
						$(".phone").hide();
			        	$(".alarm").show();
					}
				},
				error: function(request, status, error) {
					console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
				}
			});
        });
        // 모달창 띄우고 내용 있는 곳 부분 제외한 곳 누르면 모달창 닫기
        $(".alarm").on('click', function () {
            if (event.target == $(".alarm").get(0)) {
                /* $(".alarm").hide(); */
            	location.reload();
            }
        });
        
        // 알림신청완료 버튼 클릭 시 모달창 띄우기
        $("#btn_funding_alarm_cancel").on('click', function(){
        	console.log("알림신청완료 클릭");
			$.ajax({
				url: "<%=request.getContextPath()%>/sms/delete",
				type: "post",
				data: {
					s_no: $("#s_no").val(),
				},
				success: function(result){
					console.log(result);
					if (result == -1) {
						alert("알림신청 취소가 되지 않았습니다. 다시 시도해주세요.");
						$("#s_receiver").focus();
					} else if (result == 0) {
						alert("로그인을 한 후에 알림신청 취소가 가능합니다. 로그인 페이지로 이동합니다.");
						location.href = "<%=request.getContextPath()%>/member/login";
					} else if (result == 1) {
						$(".cancel_alarm").show();
					}
				},
				error: function(request, status, error) {
					console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
				}
			});
        });
        // 모달창 띄우고 내용 있는 곳 부분 제외한 곳 누르면 모달창 닫기
        $(".cancel_alarm").on('click', function () {
            if (event.target == $(".cancel_alarm").get(0)) {
                /* $(".cancel_alarm").hide(); */
            	location.reload();
            }
        });
        
 /* 상세페이지 사진 전부 출력 */
            $("img[data-src]").each(function(){
                console.log($(this).data("src"));
                var datasrc = $(this).data("src");
                if(!$(this).attr("src")){
                    $(this).attr("src",datasrc);
                    $(this).removeAttr("style");
                }
            });

    </script>
</body>
</html>