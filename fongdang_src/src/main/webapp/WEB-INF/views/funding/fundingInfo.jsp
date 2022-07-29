<link href="<%=request.getContextPath()%>/resources/css/reset.css" rel="stylesheet">
<link rel="shortcut icon" type="image/x-icon" href="<%=request.getContextPath()%>/resources/images/investor.ico"/>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/font.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/fundingInfo.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/fundingInfo_modal.css">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펀딩 상세조회</title>
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
            	<input type="hidden" id = "receiver" value="${funding.maker_name}">
                <textarea cols="43" rows="10" name="m_content" id="m_content" placeholder="문의 내용을 입력해주세요.(최대 160자)" maxlength="160"></textarea>
            </div>
            <div class="message_send">
                <button id="btn_message_cancel" type="button">취소</button>
                <button id="btn_message_send" type="submit">보내기</button>
            </div>
        </div>
    </div>
    <div class="modal report">
    	<form id="report_form" method="post">
	        <div class="report_content">
	            <p class="modal_title">신고하기</p>
	            <div class="report_sel">
	                <span>신고사유 선택</span>
	                <input type="hidden" name="p_no" id="p_no" value="${funding.p_no}">
	                <select name="report_category" id="report_category">
	                    <option value="허위사실">허위사실</option>
	                    <option value="지적재산권 침해">지적재산권 침해</option>
	                    <option value="동일 제품의 타채널 유통">동일 제품의 타채널 유통</option>
	                    <option value="기타">기타</option>
	                </select>
	            </div>
	            <div class="report_input">
	                <p>신고 내용 입력</p>
	                <textarea cols="35" rows="10" name="report_content" id="report_content" placeholder="신고 내용을 입력해주세요.(최대 160자)" maxlength="160"></textarea>
	            </div>
	            <div class="report_proof">
	            	<input class="upload-name" value="증빙자료" disabled="disabled">
					<label for="uploadfile" id="btn_proof">파일 첨부</label> 
					<input type="file" name="uploadfile" id="uploadfile">
	            </div>
	            <div class="report_notice">
	            	<p>동일 상품 신고는 불가능합니다.</p>
	            	<p>증빙자료는 png, jpg, jpeg 파일만 업로드 가능합니다.</p>
	                <p>신고 내용이 사실과 다르거나 허위인 경우, 이용 제재를 받을 수 있습니다.</p>
	                <p>신고자의 정보 및 신고 내용은 안전하게 보호되며 외부에 제공되지 않습니다.</p>
	            </div>
	            <div class="report_send">
	                <button id="btn_report_cancel" type="button">취소</button>
	                <button id="btn_report_send" type="button">신고</button>
	            </div>
	        </div>
        </form>
    </div>
    <div class="modal review">
        <div class="review_content">
            <p class="modal_title">리뷰 수정</p>
            <div class="review_input">
            	<input type="hidden" id="review_r_no">
                <textarea cols="35" rows="10" name="review_update" id="review_update" maxlength="1300"></textarea>
            </div>
            <div class="review_send">
                <button id="btn_review_cancel" type="button">취소</button>
                <button id="btn_review_send" type="button">수정</button>
            </div>
        </div>
    </div>
    <div class="main_wrap">
        <div class="wrap content" style="width: 1200px; margin: 0 auto;">
            <div class="funding_header" style="margin-top: 32px;">
                <p>${funding.category_name}</p>
                <h2>${funding.p_name}</h2>
            </div>
            <div class="funding_content">
                <section class="funding_info">
                    <div class="left_funding_info">
                        <img id = "thumbnail_img" src="${funding.p_thumbnail}">
                        <p style="margin-top: 15px; margin-bottom: 15px;">${funding.p_summary}</p>
                        <div class="funding_info_group">
                            <div class="funding_end_day">
                                <img src="<%=request.getContextPath()%>/resources/images/calendar.png">
                                <p class="funding_info_group_title">펀딩 종료일</p>
                                <p class="funding_info_group_content">${funding.end_day}</p>
                            </div>
                            <div class="line"></div>
                            <div class="funding_pay_day">
                                <img src="<%=request.getContextPath()%>/resources/images/credit-card.png">
                                <p class="funding_info_group_title">결제 예정일</p>
                                <p class="funding_info_group_content">${funding.payment_plan}</p>
                            </div>
                            <div class="line"></div>
                            <div class="funding_delivery_day">
                                <img src="<%=request.getContextPath()%>/resources/images/delivery.png">
                                <p class="funding_info_group_title">발송 예정일</p>
                                <p class="funding_info_group_content">${funding.delivery_date}</p>
                            </div>
                        </div>
                        <div class="funding_notice">
                            <img src="<%=request.getContextPath()%>/resources/images/pushpin.png">
                            <p>목표 금액의 100% 이상 모이면 펀딩이 성공되며, 펀딩 마감일까지 목표 금액이 100% 모이지 않으면 결제가 진행되지 않습니다.</p>
                        </div>
                    </div>
                    <div class="right_funding_info">
                        <div class="d_day">
                        	<c:choose>
                        		<c:when test="${funding.d_day < 0}">
                        			<span style="font-size: 25px; font-family: SUIT-SemiBold;">판매 종료</span>
                        		</c:when>
                        		<c:otherwise>
                        			<span style="font-size: 25px; font-family: SUIT-SemiBold;">${funding.d_day}일 남음</span>
                        		</c:otherwise>
                        	</c:choose>
                            <%-- <span style="font-size: 25px; font-family: SUIT-SemiBold;">${funding.d_day}일 남음</span> --%>
                            <span style="font-size: 12px; font-family: SUIT-Light;">${funding.end_day} 종료</span>
                        </div>
                        <div class="achieve_rate">
                            <span style="font-size: 16px; font-family: SUIT-Regular;">달성률 ${funding.p_goal_percent}%</span>
                            <span style="font-size: 12px; font-family: SUIT-Light;">목표금액 ${funding.p_goal_str}원</span>
                        </div>
                        <div class="total_money">
                            <span style="font-size: 16px; font-family: SUIT-Regular;">누적 펀딩액 ${funding.total_funding_money}원</span>
                        </div>
                        <div class="support">
                            <span style="font-size: 16px; font-family: SUIT-Regular;">서포터 ${funding.supporter}명</span>
                        </div>
                        <button id="btn_funding" type="button" onclick="location.href='<%=request.getContextPath()%>/order/option/${p_no}'"><img src="<%=request.getContextPath()%>/resources/images/funding.png">펀딩하기</button>
                        <div class="like_and_share">
                            
                            <!-- sun start -->
                            <c:if test="${pick_yn eq 'N'}">
                            <button id="btn_like" type="button">
                            <img id="pick_img" src="<%=request.getContextPath()%>/resources/images/heart.png">좋아요(<span id="pick_cnt">${pick_cnt}</span>)
                            </button>
                            </c:if>
                            <c:if test="${pick_yn eq 'Y'}">
                            <button id="btn_like" type="button">
                            <img id="pick_img" src="<%=request.getContextPath()%>/resources/images/heart_color.png">좋아요(<span id="pick_cnt">${pick_cnt}</span>)
                            </button>
                            </c:if>
                            <input type="hidden" id="pick_yn" name="pick_yn" value="${pick_yn}" />
                            <input type="hidden" id="pick_update_yn" name="pick_update_yn" value="${pick_update_yn}" />
                            <input id="email" type="hidden" value="${loginInfo.email}">
                            <!-- sun end -->
                            <button id="btn_share" type="button"><img src="<%=request.getContextPath()%>/resources/images/share.png">공유하기</button>
                        </div>
                        <button id="btn_message" type="button"><img src="<%=request.getContextPath()%>/resources/images/message.png">판매자에게 문의하기</button>
                        <button id="btn_report" type="button"><img src="<%=request.getContextPath()%>/resources/images/report.png">신고하기</button>
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
	                                    <td>${funding.maker_email}
	                                    <!-- sun start-->
	                                    <!-- sun end-->
	                                    </td>
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
                    <input type="radio" name = "tab" id="story_tab"><label for="story_tab" class="tab_btn">스토리</label>
                    <input type="radio" name = "tab" id="review_tab"><label for="review_tab" class="tab_btn">상품리뷰</label>
                </nav>
                <section class="funding_story">${funding.p_story}</section>
                <section class="funding_review">
                	<!-- TODO : 로그아웃 상태이면 안 보이게 하기? -->
                    <div class="review_input">
                    	<input type="hidden" id="p_no" value="${funding.p_no}">
                        <textarea cols="100" rows="5" id="r_content" placeholder="리뷰 내용을 입력해주세요.(최대 1300자)" maxlength="1300"></textarea>
                        <button id="btn_review" type="button">리뷰등록</button>
                    </div>
                    <c:choose>
                    	<c:when test="${empty funding.review_list}">
                    		<div class="review_list" style="text-align: center; font-size: 24px;">리뷰가 없습니다.</div>
                    	</c:when>
                    	<c:otherwise>
                    		<c:forEach var="review" items="${funding.review_list}">
			                   	<div class="review_list">
			                   		<c:choose>
			                   			<c:when test="${empty review.profile}"><div class="review_list_left" style="background-image: url('<%=request.getContextPath()%>/resources/images/user.png')"></div></c:when>
			                   			<c:otherwise><div class="review_list_left" style="background-image: url('${review.profile}')"></div></c:otherwise>
			                   		</c:choose>
			                        <div class="review_list_right">
			                            <div class="review_info">
			                                <p>${review.r_writer}</p>
			                                <p>${review.r_date}</p>
			                                <c:if test="${loginInfo.nickname == review.r_writer}">
				                                <div class="review_update_delete">
				                                	<!-- TODO: 두 개의 버튼은 세션정보와 비교해서 보임여부 수정 -->
				                                	<input type="hidden" value="${review.r_no}">
				                                    <button class="btn_review_update" type="button">리뷰수정</button>
				                                    <button class="btn_review_delete" type="button" onclick="deleteReview(${review.r_no});">리뷰삭제</button>
				                                </div>
			                                </c:if>
			                            </div>
			                            <div class="review_content">${review.r_content}</div>
			                        </div>
			                    </div>
                    		</c:forEach>
                    	</c:otherwise>
                    </c:choose>
                </section>
            </div>
        </div>
        <jsp:include page="../footer.jsp" />
    </div>

    <script>
	    $(function(){
	    	var link=document.location.href;
	    	var lastUrl = link.split("/").pop(); // /를 기준으로 맨 끝 값 꺼내기
	    	var tab = lastUrl.split("#").pop(); // #을 기준으로 맨 끝 값 꺼내기
	    	if(lastUrl == tab) // 상세조회 처음 들어갔을 때 스토리 탭 클릭을 위해 필요
	    		$("#story_tab").trigger("click");
	    	else 
	    		$("#"+tab+"").trigger("click");
	    });

        $("#story_tab").on('click', function(){
            console.log("스토리 선택");
            $(".funding_review").hide();
            $(".funding_story").show();
            location.href="#story_tab";
           
            $("#story_tab").prop('checked', true);
        });
        $("#review_tab").on('click', function(){
            console.log("리뷰 선택");
            $(".funding_story").hide();
            $(".funding_review").show();
            location.href="#review_tab";
            
            $("#review_tab").prop('checked', true);
        });
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
            	console.log("클릭~");
                $(".report").hide();
            }
        });
     	// 파일 첨부 클릭 시
     	$("#uploadfile").on('change', function(){ //값이 변경되면
     		if(window.FileReader){  // modern browser
     			
     		    var filename = $(this)[0].files[0].name;
     		} else {  // old IE
     		      var filename = $(this).val().split('/').pop().split('\\').pop(); // 파일명만 추출
     		}
     		    
     		$(this).siblings('.upload-name').val(filename); // 추출한 파일명 삽입
     	});
        // 신고 성공 시, 신고사유 및 내용 입력 창 초기화 후 알럿창 띄우고 모달창 닫기
        $("#btn_report_send").on('click', function(){
        	console.log("신고하기 클릭");
            if ($("#report_content").val() == "") {
				alert("신고 내용을 입력해주세요. 내용을 입력해야 리뷰를 등록할 수 있습니다.");
				$("#report_content").focus();
				return;
			}
            if ($("#uploadfile").val()) { // 파일이 있다면
            	var ext = $("#uploadfile").val().split('.').pop().toLowerCase(); //확장자 분리하여 소문자로 변경
            	
            	if($.inArray(ext, ['jpg','jpeg','png']) == -1) { //확장자가 있는지 체크
                    alert('jpg, jpeg, png 파일만 업로드 할수 있습니다. 파일 확인 후 다시 시도해주세요.');
                    return;
                }
            }
            var form = $("#report_form")[0]; //form에 작성된 모든 것 가져오기
            var formData = new FormData(form);
            
            $.ajax({
				url: "<%=request.getContextPath()%>/report/insert",
				type: "post",
				processData : false, //데이터 객체를 문자열로 바꿀지에 대한 값 true=일반문자/ false=데이터객체
				contentType : false, //일반 text인지 구분하는 값 true이면 일반 텍스트로 구분
				data: formData,
				success: function(result){
					console.log(result);
					if (result == -1) {
						alert("신고가 되지 않았습니다. 다시 시도해주세요.");
						$("#report_content").focus();
					} else if (result == 0) {
						alert("로그인을 한 후에 신고가 가능합니다. 로그인 페이지로 이동합니다.");
						location.href = "<%=request.getContextPath()%>/member/login";
					} else if (result == 2) {
						alert("이미 신고한 상품입니다.");
						$("#report_category").val("허위사실").prop("selected", true);
			            $(".report_input textarea").val("");
			            $(".upload-name").val("증빙자료");
			            $(".report").hide();
					} else if (result == 1) {
						alert("상품을 신고했습니다.");
			            $("#report_category").val("허위사실").prop("selected", true);
			            $(".report_input textarea").val("");
			            $(".upload-name").val("증빙자료");
			            $(".report").hide();
					}
				},
				error: function(request, status, error) {
					console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
				}
			});
        });
        
     	// 리뷰등록 버튼 클릭 시 처리 내용
		$("#btn_review").on('click', function(){
			console.log("리뷰등록 클릭");
			if ($("#r_content").val() == "") {
				alert("리뷰 내용을 입력해주세요. 내용을 입력해야 리뷰를 등록할 수 있습니다.");
				$("#r_content").focus();
				return;
			}
			$.ajax({
				url: "<%=request.getContextPath()%>/review/insert",
				type: "post",
				data: {
					r_content: $("#r_content").val(),
					p_no: $("#p_no").val()
				},
				success: function(result){
					console.log(result);
					if (result == -1) {
						alert("리뷰가 등록되지 않았습니다. 다시 시도해주세요.");
						$("#r_content").focus();
					} else if (result == 0) {
						alert("로그인을 한 후에 리뷰등록이 가능합니다. 로그인 페이지로 이동합니다.");
						location.href = "<%=request.getContextPath()%>/member/login";
					} else if (result == 2) {
						alert("상품에 펀딩을 한 후, 리뷰를 남길 수 있습니다. 해당 상품을 펀딩해주세요!");
					}else if (result == 1) {
						alert("리뷰가 등록됐습니다.");
						location.reload();
					}
				},
				error: function(request, status, error) {
					console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
				}
			});
		});
     	
		// 리뷰 수정 클릭 시 모달 창 열기
        // function updateReview(r_no){
        //     $(".review").show();
        // };
        // 리뷰 수정 클릭 시 모달창 띄우기
        $(".btn_review_update").on('click', function(){
            console.log($(this).parent().parent().next().html());
            console.log($(this).prev().val());
            $("#review_update").val($(this).parent().parent().next().html()); //원래 리뷰글
            $("#review_r_no").val($(this).prev().val()); //수정할 리뷰번호
            $(".review").show();
            $("#review_update").focus();
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
        // 리뷰수정 성공 시, 내용 입력 창 초기화 후 알럿창 띄우고 모달창 닫기
        $("#btn_review_send").on('click', function(){
        	console.log("리뷰수정 클릭");
			if ($("#review_update").val() == "") {
				alert("수정할 리뷰 내용을 입력해주세요. 내용을 입력해야 리뷰를 수정할 수 있습니다.");
				$("#review_update").focus();
				return;
			}
            $.ajax({
				url: "<%=request.getContextPath()%>/review/update",
				type: "post",
				data: {
					r_content: $("#review_update").val(),
					r_no: $("#review_r_no").val()
				},
				success: function(result){
					console.log(result);
					if (result == -1) {
						alert("리뷰가 수정되지 않았습니다. 다시 시도해주세요.");
						$("#review_update").focus();
					} else if (result == 0) {
						alert("로그인을 한 후에 리뷰수정이 가능합니다. 로그인 페이지로 이동합니다.");
						location.href = "<%=request.getContextPath()%>/member/login";
					} else if (result == 1) {
						alert("리뷰가 수정됐습니다.");
						location.reload();
					}
				},
				error: function(request, status, error) {
					console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
				}
			});
        });
        // 리뷰 삭제 클릭
        function deleteReview(r_no){
            console.log(r_no + "리뷰 삭제 클릭");
            if (confirm("정말 삭제하시겠습니까? 삭제된 리뷰는 복구 불가능합니다.") == false) {
				$(this).parents("form").submit();
			} else {
	            $.ajax({
					url: "<%=request.getContextPath()%>/review/delete",
					type: "post",
					data: {
						r_no: r_no
					},
					success: function(result){
						console.log(result);
						if (result == -1) {
							alert("리뷰가 삭제되지 않았습니다. 다시 시도해주세요.");
						} else if (result == 0) {
							alert("로그인을 한 후에 리뷰삭제가 가능합니다. 로그인 페이지로 이동합니다.");
							location.href = "<%=request.getContextPath()%>/member/login";
						} else if (result == 1) {
							alert("리뷰가 삭제됐습니다.");
							location.reload();
						}
					},
					error: function(request, status, error) {
						console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
					}
				});
			}
        };
        <!-- sun start-->
        $("#btn_like").on('click', function(){
        	
        	if($("#email").val() == ''){
        		alert('로그인 해주세요.');
        		return;
        	}
        	
        	var urlStr;
        	if ($("#pick_update_yn").val() == 'Y') {
        		urlStr = "<%=request.getContextPath()%>/pick/update";
			}else{
				urlStr = "<%=request.getContextPath()%>/pick/insert";
			}

        	var pickYn = $("#pick_yn").val();
        	if (pickYn == 'N') {
        		pickYn = 'Y';
			}else{
				pickYn = 'N';
			}
        	
			$.ajax({
				url: urlStr,
				type: "post",
				data: {
					email: $("#email").val(),
					p_no: $("#p_no").val(),
					pick_yn: pickYn
				},
				datatype: "JSON",
				success: function(result){
					console.log(result);
					var data = JSON.parse(result);
					console.log(data);
					if (data.pick_yn == 'Y') {
						$("#pick_yn").val('Y');
						var  src = "<%=request.getContextPath()%>/resources/images/heart_color.png";
						$("#pick_img").attr('src', src);
					} else{
						var  src = "<%=request.getContextPath()%>/resources/images/heart.png";
						$("#pick_yn").val('N');
						$("#pick_img").attr('src', src);
					}
					$('#pick_cnt').text(data.pick_cnt);
					$("#pick_update_yn").val(data.pick_update_yn);
				},
				error: function(request, status, error) {
					console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
				}
			});
        });
        <!-- sun end-->
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