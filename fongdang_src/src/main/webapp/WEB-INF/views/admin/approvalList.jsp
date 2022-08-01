<link rel="shortcut icon" type="image/x-icon" href="<%=request.getContextPath()%>/resources/images/investor.ico"/>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/font.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/reset.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/approvalList.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/approvalList_modal.css">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 - 승인 요청 목록</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
    <div class="modal approval">
        <div class="approval_content">
            <p class="approval_ask">상품 판매를 승인 하시겠습니까?</p>
            <div class="approval_send">
                <button id="btn_approval_cancel" type="button">취소</button>
                <button id="btn_approval_submit" type="button">확인</button>
            </div>
        </div>
    </div>
    <div class="modal cancel_approval">
        <div class="cancel_approval_content">
            <p class="approval_ask">상품 판매를 비승인 하시겠습니까?</p>
            <div class="approval_send">
                <button id="btn_cancel_approval_cancel" type="button">취소</button>
                <button id="btn_cancel_approval_submit" type="button">확인</button>
            </div>
        </div>
    </div>
    <div id="admin_navigator">
        <div id="admin_navigationbar">
            <div id="logo_wrap">
                <!-- TODO: 퐁당 메인 페이지 URL 작성하기 -->
                <a href="<%=request.getContextPath()%>/">
                    <img src="<%=request.getContextPath() %>/resources/images/logo.png" id="logo">
                </a>
            </div>
            <div id="admin_header_title">
                <p>관리자 페이지</p>
            </div>
        </div>
    </div>
    <div id="container">
        <div id="admin_nav">
            <!-- 관리자 메뉴 -->
            <!-- <a>태그 href에 각 기능별로 이동할 url 작성 -->
            <ul>
                <li><a href="#" class="main_menu">회원 관리</a></li>
                <li><a href="<%= request.getContextPath()%>/admin/memberManagement" class="sub_menu">회원 조회</a></li>
                <li><a href="#" class="main_menu">펀딩 관리</a></li>
                <li><a href="<%=request.getContextPath() %>/admin/approval/list" class="sub_menu" style="color: #9bbfd9;">승인 요청목록</a></li>
                <li><a href="<%=request.getContextPath() %>/admin/report/list" class="sub_menu">신고 상품목록</a></li>
                <li><a href="<%=request.getContextPath()%>/admin/sales/list" class="sub_menu">펀딩 매출관리</a></li>
                <li><a href="#" class="main_menu">고객 센터</a></li>
                <li><a href="<%=request.getContextPath()%>/notice/admin" class="sub_menu">공지사항</a></li>
                <li><a href="<%= request.getContextPath()%>/admin/ask" class="sub_menu">1:1문의</a></li>
            </ul>
        </div>

        <div id="main_body">
        	<p id="title">승인 요청 목록 관리</p>
            <div id="grid_container_wrap">
                <div class="grid_container">
                    <div class="col_title">상품번호</div>
                    <div class="col_title">상품명</div>
                    <div class="col_title">카테고리</div>
                    <div class="col_title">메이커명</div>
                    <div class="col_title">메이커 유형</div>
                    <div class="col_title">필수서류 첨부</div>
                    <div class="col_title">누적신고횟수</div>
                    <div class="col_title">승인여부변경</div>
                </div>
                <c:forEach var="approval" items="${approvalList}">
                	<div class="grid_container">
	                    <div class="col_data">${approval.p_no}</div>
	                    <c:choose>
	                    	<c:when test="${approval.d_day <= 0 || approval.p_report_cnt > 0}">
	                    		<div class="col_data" style="cursor: pointer;" onclick="location.href='<%=request.getContextPath()%>/funding/info/${approval.p_no}'">${approval.p_name}</div>
	                    	</c:when>
	                    	<c:otherwise>
	                    		<div class="col_data" style="cursor: pointer;" onclick="location.href='<%=request.getContextPath()%>/funding/info/before/${approval.p_no}'">${approval.p_name}</div>
	                    	</c:otherwise>
	                    </c:choose>
	                    <%-- <div class="col_data">${approval.p_name}</div> --%>
	                    <div class="col_data">${approval.category_name}</div>
	                    <div class="col_data">${approval.maker_name}</div>
	                    <c:choose>
	                    	<c:when test="${approval.maker_category == 'I'}">
	                    		<div class="col_data">개인</div>
	                    	</c:when>
	                    	<c:when test="${approval.maker_category == 'B'}">
	                    		<div class="col_data">법인</div>
	                    	</c:when>
	                    </c:choose>
	                    <c:choose>
	                    	<c:when test="${empty approval.p_certification}">
	                    		<div class="col_data">N</div>
	                    	</c:when>
	                    	<c:when test="${not empty approval.p_certification}">
	                    		<div class="col_data">Y</div>
	                    	</c:when>
	                    </c:choose>
	                    <div class="col_data">${approval.p_report_cnt}</div>
	                    <div class="col_data"><button type="button" class="btn_approval_y" onclick="changeApproval(${approval.p_no}, 'Y', '${approval.email}');">승인</button> / <button type="button" class="btn_approval_n" onclick="changeApproval(${approval.p_no}, 'N', '${approval.email}');">비승인</button></div>
	                </div>
                </c:forEach>
            </div>
            <div id="page_wrap">
                <div id="page_nation">
					<c:if test="${startPage > 1}">
						<button id="btn_prev" type="button" onclick="location.href='<%=request.getContextPath()%>/admin/approval/list?page=${startPage-1}'"></button>
					</c:if>
					<c:forEach var="i" begin="${startPage}" end="${endPage}">
						<c:if test="${i == currentPage}">
							<button class="active btnPage" type="button" onclick="location.href='<%=request.getContextPath()%>/admin/approval/list?page=${i}'">${i}</button>
						</c:if>
						<c:if test="${i != currentPage}">
							<button class="btnPage" type="button" onclick="location.href='<%=request.getContextPath()%>/admin/approval/list?page=${i}'">${i}</button>
						</c:if>
					</c:forEach>
					<c:if test="${endPage < totalPageCnt}">
						<button id="btn_next" type="button" onclick="location.href='<%=request.getContextPath()%>/admin/approval/list?page=${endPage+1}'"></button>
					</c:if>
                </div>
            </div>
        </div>
    </div>
    <!-- 임시 footer -->
    <!-- <footer style="background-color: #ccc; color: blue; font-size:28px; text-align:center; height: 200px;">푸터 영역</footer> -->
    <%-- <jsp:include page="../footer.jsp" /> --%>
    <script>
    var member=  '${loginInfo.email}';
	console.log("접근한회원정보: " + member);	
	
	if(member == 'admin') {
		console.log("안녕하세요 관리자님!");
	} else {
		alert("관리자 권한이 필요한 페이지입니다.");
		location.href='<%=request.getContextPath()%>/';
	}
    	var p_no = null;
    	var p_approval = null;
    	var email = null;
    	
	    function changeApproval(approval_no, approval_yn, approval_email) {
	    	p_no = approval_no;
	    	p_approval = approval_yn;
	    	email = approval_email;
	    	
	        if(p_approval == 'Y') {
	            console.log("승인 클릭");
	            $(".approval").show();
	        } else if(p_approval == 'N') {
	            console.log("비승인 클릭");
	            $(".cancel_approval").show();
	        }
	    };
	    // 승인 -> 취소 버튼 클릭 시 모달창 닫기
	    $("#btn_approval_cancel").on('click', function () {
	        $(".approval").hide();
	    });
	    // 비승인 -> 취소 버튼 클릭 시 모달창 닫기
	    $("#btn_cancel_approval_cancel").on('click', function () {
	        $(".cancel_approval").hide();
	    });
	    // 승인 -> 모달창 띄우고 내용 있는 곳 부분 제외한 곳 누르면 모달창 닫기
	    $(".approval").on('click', function () {
	        if (event.target == $(".approval").get(0)) {
	            $(".approval").hide();
	        }
	    });
	    // 비승인 -> 모달창 띄우고 내용 있는 곳 부분 제외한 곳 누르면 모달창 닫기
	    $(".cancel_approval").on('click', function () {
	        if (event.target == $(".cancel_approval").get(0)) {
	            $(".cancel_approval").hide();
	        }
	    });
	
	    // 승인 -> 확인 버튼 클릭 시 처리
	    $("#btn_approval_submit").on('click', function(){
	        console.log("승인 : 확인 클릭");
	        console.log(p_no + ", " + p_approval + ", " + email);
	        
	        $.ajax({
				url: "<%=request.getContextPath()%>/funding/updateApproval",
				type: "post",
				data: {
					p_no: p_no,
					p_approval: p_approval,
					email: email,
					a_content: "펀딩 신청하신 상품이 판매 승인되었습니다."
				},
				success: function(result){
					console.log(result);
					if (result == -1) {
						alert("상품 판매 승인이 되지 않았습니다. 다시 시도해주세요.");
					} else if (result == 0) {
						alert("관리자 로그인을 한 후에 승인이 가능합니다. 로그인 페이지로 이동합니다.");
						location.href = "<%=request.getContextPath()%>/member/login";
					} else if (result == 1) {
						alert("상품 판매를 승인했습니다.");
						location.reload();
					}
				},
				error: function(request, status, error) {
					console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
				}
			});
	    });
	    // 비승인 -> 확인 버튼 클릭 시 처리
	    $("#btn_cancel_approval_submit").on('click', function(){
	    	console.log("비승인 : 확인 클릭");
	    	console.log(p_no + ", " + p_approval + ", " + email);
	    	
	        $.ajax({
				url: "<%=request.getContextPath()%>/funding/updateApproval",
				type: "post",
				data: {
					p_no: p_no,
					p_approval: p_approval,
					email: email,
					a_content: "펀딩 신청하신 상품이 판매 비승인되었습니다."
				},
				success: function(result){
					console.log(result);
					if (result == -1) {
						alert("상품 판매 비승인이 되지 않았습니다. 다시 시도해주세요.");
					} else if (result == 0) {
						alert("관리자 로그인을 한 후에 비승인이 가능합니다. 로그인 페이지로 이동합니다.");
						location.href = "<%=request.getContextPath()%>/member/login";
					} else if (result == 1) {
						alert("상품 판매를 비승인했습니다.");
						location.reload();
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