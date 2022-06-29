<link rel="shortcut icon" type="image/x-icon" href="<%=request.getContextPath()%>/resources/images/investor.ico"/>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/font.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/reset.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/fundingInfo.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/fundingInfo_modal.css">
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
    <div class="modal report">
        <div class="report_content">
            <p class="modal_title">신고하기</p>
            <div class="report_sel">
                <span>신고사유 선택</span>
                <select name="report_category" id="report_category">
                    <option value="허위사실">허위사실</option>
                    <option value="지적재산권 침해">지적재산권 침해</option>
                    <option value="동일 제품의 타채널 유통">동일 제품의 타채널 유통</option>
                    <option value="기타">기타</option>
                </select>
            </div>
            <div class="report_input">
                <p>신고 내용 입력</p>
                <textarea cols="35" rows="10" name="report" placeholder="신고 내용을 입력해주세요." required></textarea>
            </div>
            <div class="report_proof">
                <span>증빙 자료</span>
                <button id="btn_proof" type="button">파일 첨부</button>
            </div>
            <div class="report_notice">
                <p>신고 내용이 사실과 다르거나 허위인 경우, 이용 제재를 받을 수 있습니다.</p>
                <p>신고자의 정보 및 신고 내용은 안전하게 보호되며 외부에 제공되지 않습니다.</p>
            </div>
            <div class="report_send">
                <button id="btn_report_cancel" type="button">취소</button>
                <button id="btn_report_send" type="button">신고</button>
            </div>
        </div>
    </div>
    <div class="modal review">
        <div class="review_content">
            <p class="modal_title">리뷰 수정</p>
            <div class="review_input">
                <textarea cols="35" rows="10" name="review"></textarea>
            </div>
            <div class="review_send">
                <button id="btn_review_cancel" type="button">취소</button>
                <button id="btn_review_send" type="button">수정</button>
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
                        <p style="margin-bottom: 15px;">상품 요약</p>
                        <div class="funding_info_group">
                            <div class="funding_end_day">
                                <img src="<%=request.getContextPath()%>/resources/images/calendar.png">
                                <p class="funding_info_group_title">펀딩 종료일</p>
                                <p class="funding_info_group_content">2022.XX.XX</p>
                            </div>
                            <div class="line"></div>
                            <div class="funding_pay_day">
                                <img src="<%=request.getContextPath()%>/resources/images/credit-card.png">
                                <p class="funding_info_group_title">결제 예정일</p>
                                <p class="funding_info_group_content">2022.XX.XX</p>
                            </div>
                            <div class="line"></div>
                            <div class="funding_delivery_day">
                                <img src="<%=request.getContextPath()%>/resources/images/delivery.png">
                                <p class="funding_info_group_title">발송 예정일</p>
                                <p class="funding_info_group_content">2022.XX.XX</p>
                            </div>
                        </div>
                        <div class="funding_notice">
                            <img src="<%=request.getContextPath()%>/resources/images/pushpin.png">
                            <p>목표 금액의 100% 이상 모이면 펀딩이 성공되며, 펀딩 마감일까지 목표 금액이 100% 모이지 않으면 결제가 진행되지 않습니다.</p>
                        </div>
                    </div>
                    <div class="right_funding_info">
                        <div class="d_day">
                            <span style="font-size: 25px; font-family: SUIT-SemiBold;">00일 남음</span>
                            <span style="font-size: 12px; font-family: SUIT-Light;">2022.XX.XX 종료</span>
                        </div>
                        <div class="achieve_rate">
                            <span style="font-size: 16px; font-family: SUIT-Regular;">달성률 0000%</span>
                            <span style="font-size: 12px; font-family: SUIT-Light;">목표금액 1000000원</span>
                        </div>
                        <div class="total_money">
                            <span style="font-size: 16px; font-family: SUIT-Regular;">누적 펀딩액 000000000원</span>
                        </div>
                        <div class="support">
                            <span style="font-size: 16px; font-family: SUIT-Regular;">서포터 00000명</span>
                        </div>
                        <button id="btn_funding" type="button"><img src="<%=request.getContextPath()%>/resources/images/funding.png">펀딩하기</button>
                        <div class="like_and_share">
                            <button id="btn_like" type="button"><img src="<%=request.getContextPath()%>/resources/images/heart.png">좋아요</button>
                            <button id="btn_share" type="button"><img src="<%=request.getContextPath()%>/resources/images/share.png">공유하기</button>
                        </div>
                        <button id="btn_message" type="button"><img src="<%=request.getContextPath()%>/resources/images/message.png">판매자에게 문의하기</button>
                        <button id="btn_report" type="button"><img src="<%=request.getContextPath()%>/resources/images/report.png">신고하기</button>
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
                    <input type="radio" name = "tab" id="story_tab"><label for="story_tab" class="tab_btn">스토리</label>
                    <input type="radio" name = "tab" id="review_tab"><label for="review_tab" class="tab_btn">상품리뷰</label>
                </nav>
                <section class="funding_story">상품 상세정보 나오는 곳</section>
                <section class="funding_review">
                    <div class="review_input">
                        <textarea cols="100" rows="5" name="review" placeholder="리뷰 내용을 입력해주세요." required></textarea>
                        <button id="btn_review" type="button">리뷰등록</button>
                    </div>
                    <div class="review_list">
                        <div class="review_list_left"></div>
                        <div class="review_list_right">
                            <div class="review_info">
                                <p>작성자닉네임</p>
                                <p>yyyy.mm.dd hh:mm:ss</p>
                                <div class="review_update_delete">
                                    <button class="btn_review_update" type="button">리뷰수정</button>
                                    <button class="btn_review_delete" type="button" onclick="deleteReview();">리뷰삭제</button>
                                </div>
                            </div>
                            <div class="review_content">리뷰 내용</div>
                        </div>
                    </div>
                </section>
            </div>
        </div>
        <div class="wrap footer"></div>
    </div>

    <script>
    	/* 새로고침해도 라디오 버튼 값 유지하기 위해 sessionStorage 사용, localStorage는 영구 값 유지라서 그거까지는 필요없음 */
        console.log("preValue : " + sessionStorage.getItem('preValue'));

        if(sessionStorage.getItem('preValue') == 'story' || sessionStorage.getItem('preValue') == null){
            console.log("preValue는 story");
            $("#story_tab").prop('checked', true);

            $(".funding_review").hide();
            $(".funding_story").show();
        } else if(sessionStorage.getItem('preValue') == 'review'){
            console.log("preValue는 review");
            $("#review_tab").prop('checked', true);
            
            $(".funding_story").hide();
            $(".funding_review").show();
        }
        $("#story_tab").on('click', function(){
            console.log("스토리 선택");
            $(".funding_review").hide();
            $(".funding_story").show();
            sessionStorage.setItem('preValue', 'story');
            // preValue = $(this).val();
            console.log("preValue : " + sessionStorage.getItem('preValue'));

            $("#story_tab").prop('checked', true);
        });
        $("#review_tab").on('click', function(){
            console.log("리뷰 선택");
            $(".funding_story").hide();
            $(".funding_review").show();
            sessionStorage.setItem('preValue', 'review');
            // preValue = $(this).val();
            console.log("preValue : " + sessionStorage.getItem('preValue'));

            $("#review_tab").prop('checked', true);
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
        // 문의하기 성공 시, 내용 입력 창 초기화 후 알럿창 띄우고 모달창 닫기
        $("#btn_message_send").on('click', function(){
            alert("판매자에게 문의했습니다. 답장을 기다려주세요.");
            $(".message_input textarea").val("");
            $(".message").hide();
        });

        // 신고 버튼 클릭 시 모달창 띄우기
        $("#btn_report").on('click', function () {
            $(".report").show();
        });
        // 취소 버튼 클릭 시 모달창 닫기
        $("#btn_report_cancel").on('click', function () {
            $(".report").hide();
        });
        // 모달창 띄우고 내용 있는 곳 부분 제외한 곳 누르면 모달창 닫기
        $(".report").on('click', function () {
            if (event.target == $(".report").get(0)) {
                $(".report").hide();
            }
        });
        // 신고 성공 시, 신고사유 및 내용 입력 창 초기화 후 알럿창 띄우고 모달창 닫기
        $("#btn_report_send").on('click', function(){
            alert("신고 되었습니다.");
            $(".report_sel select").val("허위사실").prop("selected", true);
            // $('.report_sel select').find('option:first').attr('selected', 'selected');
            $(".report_input textarea").val("");
            $(".report").hide();
        });
        // 리뷰 수정 클릭 시 모달 창 열기
        // function updateReview(){
        //     $(".review").show();
        // };
        // 리뷰 수정 클릭 시 모달창 띄우기
        $(".btn_review_update").on('click', function(){
            console.log($(this).parent().parent().next().html());
            $(".review_input > textarea").val($(this).parent().parent().next().html());
            $(".review").show();
        });
        // 취소 버튼 클릭 시 모달창 닫기
        $("#btn_review_cancel").on('click', function () {
            $(".review").hide();
        });
        // 모달창 띄우고 내용 있는 곳 부분 제외한 곳 누르면 모달창 닫기
        $(".review").on('click', function () {
            if (event.target == $(".review").get(0)) {
                $(".review").hide();
            }
        });
        // 리뷰 등록 성공 시, 내용 입력 창 초기화 후 알럿창 띄우고 모달창 닫기
        $("#btn_review_send").on('click', function(){
            alert("리뷰가 수정되었습니다.");
            $(".review_input textarea").val("");
            $(".review").hide();
        });
        // 리뷰 삭제 클릭
        function deleteReview(){
            console.log("리뷰 삭제 클릭");
        };
    </script>
</body>
</html>