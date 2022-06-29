<link rel="shortcut icon" type="image/x-icon" href="<%=request.getContextPath()%>/resources/images/investor.ico"/>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/font.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/reset.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/beforeFundingInfo.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/beforeFundingInfo_modal.css">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펀딩예정 상세조회</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
    <div class="modal message">
        <div class="message_content">
            <p class="modal_title">문의하기</p>
            <p class="message_notice">* 문의하기는 실시간 채팅이 아닙니다. 판매자에게 답장이 올 때까지 기다려주세요. *</p>
            <div class="message_input">
                <textarea cols="45" rows="10" name="message" placeholder="문의 내용을 입력해주세요." required></textarea>
            </div>
            <div class="message_send">
                <button id="btn_message_cancel" type="button">취소</button>
                <button id="btn_message_send" type="button">보내기</button>
            </div>
        </div>
    </div>
    <div class="main_wrap">
        <div class="wrap header"></div>
        <div class="wrap content">
            <div class="funding_header">
                <p>카테고리명</p>
                <h2>상품명</h2>
            </div>
            <div class="funding_content">
                <section class="funding_info">
                    <div class="left_funding_info">
                        <img id = "thumbnail_img" src="<%=request.getContextPath()%>/resources/images/funding.jpg">
                        <p>상품 요약</p>
                    </div>
                    <div class="right_funding_info">
                        <button id="btn_funding_alarm" type="button"><img src="<%=request.getContextPath()%>/resources/images/funding_alarm.png">알림신청<span style="margin-left: 10px; font-size: 12px;">123명이 신청 중</span></button>
                        <div class="like_and_share">
                            <button id="btn_like" type="button"><img src="<%=request.getContextPath()%>/resources/images/heart.png">좋아요</button>
                            <button id="btn_share" type="button"><img src="<%=request.getContextPath()%>/resources/images/share.png">공유하기</button>
                        </div>
                        <p class="funding_open_info">mm/dd(X요일) hh시 mm분 오픈예정</p>
                        <button id="btn_message" type="button"><img src="<%=request.getContextPath()%>/resources/images/message.png">판매자에게 문의하기</button>
                        <h3>메이커 정보</h3>
                        <div class="maker_info">
                            <div class="maker_img_name">
                                <div class="maker_logo"></div>
                                <span class="maker_name">회사명</span>
                            </div>
                            <table>
                                <tr>
                                    <th>이메일</th>
                                    <td>fonddang@google.com</td>
                                </tr>
                                <tr>
                                    <th>문의전화</th>
                                    <td>010-1234-5678</td>
                                </tr>
                                <tr>
                                    <th>카카오톡 채널</th>
                                    <td>채널명</td>
                                </tr>
                                <tr>
                                    <th>홈페이지</th>
                                    <td>홈페이지주소</td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </section>
                <nav class="funding_menu">
                    <input type="radio" name = "tab" id="story_tab" checked><label for="story_tab" class="tab_btn">스토리</label>
                </nav>
                <section class="funding_story">상품 상세정보 나오는 곳</section>
            </div>
        </div>
        <div class="wrap footer"></div>
    </div>

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
        // 문의하기 성공 시, 내용 입력 창 초기화 후 알럿창 띄우고 모달창 닫기
        $("#btn_message_send").on('click', function(){
            alert("판매자에게 문의했습니다. 답장을 기다려주세요.");
            $(".message_input textarea").val("");
            $(".message").hide();
        });
    </script>
</body>
</html>