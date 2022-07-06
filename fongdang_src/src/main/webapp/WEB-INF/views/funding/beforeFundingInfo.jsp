<link rel="shortcut icon" type="image/x-icon" href="<%=request.getContextPath()%>/resources/images/investor.ico"/>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/font.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/reset.css">
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
</head>
<body>
    <div class="modal share">
        <div class="share_content">
            <p class="modal_title">공유하기</p>
            <div class="share_way">
                <button id="btn_kakao_share"><img src="<%=request.getContextPath()%>/resources/images/kakao.png"></button>
                <button id="btn_facebook_share"><img src="<%=request.getContextPath()%>/resources/images/facebook.png"></button>
                <button id="btn_twitter_share"><img src="<%=request.getContextPath()%>/resources/images/twitter.png"></button>
                <button id="btn_link_share"><img src="<%=request.getContextPath()%>/resources/images/link.png"></button>
            </div>
            <div class="share_confirm">
                <button id="btn_share_confirm" type="button">확인</button>
            </div>
        </div>
    </div>
    <div class="modal message">
        <div class="message_content">
            <p class="modal_title">문의하기</p>
            <p class="message_notice">* 문의하기는 실시간 채팅이 아닙니다. 판매자에게 답장이 올 때까지 기다려주세요. *</p>
            <div class="message_input">
            	<input type="hidden" id = "receiver" value="Best goods global">
                <textarea cols="45" rows="10" name="message" id="m_content" placeholder="문의 내용을 입력해주세요." required></textarea>
            </div>
            <div class="message_send">
                <button id="btn_message_cancel" type="button">취소</button>
                <button id="btn_message_send" type="button">보내기</button>
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
        <div class="wrap header"></div>
        <div class="wrap content" style="width: 1200px;">
            <div class="funding_header">
                <p>${funding.category_name}</p>
                <h2>${funding.p_name}</h2>
            </div>
            <div class="funding_content">
                <section class="funding_info">
                    <div class="left_funding_info">
                        <img id = "thumbnail_img" src="${funding.p_thumbnail}">
                        <p style="margin-top: 15px; margin-bottom: 15px;">${funding.p_summary}</p>
                    </div>
                    <div class="right_funding_info">
                        <button id="btn_funding_alarm" type="button"><img src="<%=request.getContextPath()%>/resources/images/funding_alarm.png">알림신청<span style="margin-left: 10px; font-size: 12px;">123명이 신청 중</span></button>
                        <button id="btn_funding_alarm_cancel" type="button"><img src="<%=request.getContextPath()%>/resources/images/funding_alarm.png">알림신청완료<span style="margin-left: 10px; font-size: 12px;">123명이 신청 중</span></button>
                        <div class="like_and_share">
                            <button id="btn_like" type="button"><img src="<%=request.getContextPath()%>/resources/images/heart.png">좋아요</button>
                            <button id="btn_share" type="button"><img src="<%=request.getContextPath()%>/resources/images/share.png">공유하기</button>
                        </div>
                        <p class="funding_open_info">${funding.start_day} 오픈예정</p>
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
                    <input type="radio" name = "tab" id="story_tab" checked><label for="story_tab" class="tab_btn">스토리</label>
                </nav>
                <section class="funding_story">${funding.p_story}</section>
            </div>
        </div>
        <div class="wrap footer"></div>
    </div>

    <script>
	    // 공유하기 버튼 클릭 시 모달창 띄우기
	    $("#btn_share").on('click', function(){
	        $(".share").show();
	    });
	    // 확인 버튼 클릭 시 모달창 닫기
	    $("#btn_share_confirm").on('click', function () {
	        $(".share").hide();
	    });
	    // 모달창 띄우고 내용 있는 곳 부분 제외한 곳 누르면 모달창 닫기
	    $(".share").on('click', function () {
	        if (event.target == $(".share").get(0)) {
	            $(".share").hide();
	        }
	    });
	    // 공유하기 -> 카카오톡 아이콘 클릭 시 처리
	    $("#btn_kakao_share").on('click', function(){
	        var sendUrl = document.URL;
	        Kakao.init('a4cd1cbcb7370c8222dfd1f5d5de4ecd'); // 사용할 앱의 JavaScript 키 설정
	
	        Kakao.Link.createDefaultButton({
	            container: '#btn_kakao_share', // HTML에서 작성한 ID값
	            objectType: 'feed',
	            content: {
	            title: "퐁당", // 보여질 제목
	            description: "퐁당", // 보여질 설명
	            imageUrl: sendUrl, // 콘텐츠 URL
	            link: {
	                mobileWebUrl: sendUrl,
	                webUrl: sendUrl
	            }
	            }
	        });
	    });
	    // 공유하기 -> 페이스북 아이콘 클릭 시 처리
	    $("#btn_facebook_share").on('click', function(){
	        var sendUrl = document.URL;
	        window.open("http://www.facebook.com/sharer/sharer.php?u=" + encodeURIComponent(sendUrl));
	    });
	    // 공유하기 -> 트위터 아이콘 클릭 시 처리
	    $("#btn_twitter_share").on('click', function(){
	        var sendUrl = document.URL;
	        window.open("http://twitter.com/share?url=" + encodeURIComponent(sendUrl));
	    });
	    // 공유하기 -> 링크 아이콘 클릭 시 처리
	    $("#btn_link_share").on('click', function(){
	        // 1. 새로운 element 생성
		    var tmpTextarea = document.createElement('textarea');
	        
	        // 2. 해당 element에 복사하고자 하는 value 저장
	        tmpTextarea.value = document.URL;
	        
	        // 3. 해당 element를 화면에 안보이는 곳에 위치
	        tmpTextarea.setAttribute('readonly', '');
	        tmpTextarea.style.position = 'absolute';
	        tmpTextarea.style.left = '-9999px';
	        document.body.appendChild(tmpTextarea);
	        
	        // 4. 해당 element의 value를 시스템 함수를 호출하여 복사
	        tmpTextarea.select();
	        tmpTextarea.setSelectionRange(0, 9999);  // 셀렉트 범위 설정
	        var successChk = document.execCommand('copy');
	        
	        // 5. 해당 element 삭제
	        document.body.removeChild(tmpTextarea);
	
	        // 클립보드 성공여부 확인
	        if(!successChk){
	        	alert("URL이 복사 실패했습니다. 다시 시도해주세요.");
	        } else {
	            alert("URL이 복사 되었습니다.");
	            $(".share").hide();
	        }
	    });
	    
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
						/* location.href = "login"; */
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
            $(".alarm").show();
        });
        // 모달창 띄우고 내용 있는 곳 부분 제외한 곳 누르면 모달창 닫기
        $(".alarm").on('click', function () {
            if (event.target == $(".alarm").get(0)) {
                $(".alarm").hide();
            }
        });
        // 알림신청완료 버튼 클릭 시 모달창 띄우기
        $("#btn_funding_alarm_cancel").on('click', function(){
            $(".cancel_alarm").show();
        });
        // 모달창 띄우고 내용 있는 곳 부분 제외한 곳 누르면 모달창 닫기
        $(".cancel_alarm").on('click', function () {
            if (event.target == $(".cancel_alarm").get(0)) {
                $(".cancel_alarm").hide();
            }
        });
    </script>
</body>
</html>