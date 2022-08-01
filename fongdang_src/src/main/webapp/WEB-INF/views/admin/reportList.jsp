<link rel="shortcut icon" type="image/x-icon" href="<%=request.getContextPath()%>/resources/images/investor.ico"/>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/font.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/reset.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/reportList.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/reportList_modal.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 - 신고 상품 목록</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
    <div class="modal cancel_approval">
        <div class="cancel_approval_content">
            <p class="approval_ask">상품 판매를 비승인 하시겠습니까?</p>
            <div class="approval_send">
                <button id="btn_cancel_approval_cancel" type="button">취소</button>
                <button id="btn_cancel_approval_submit" type="button">확인</button>
            </div>
        </div>
    </div>
    <div class="modal report_detail">
    	<div class="report_detail_content">
    		<span class="modal_title">신고상품 상세조회</span><button id="btn_close" type="button"><i class="fa fa-close"></i></button>
    		<div id="product_name"></div>
    		<div id="email_and_report_date">신고자 : <span id="email" style="margin-right: 15px;"></span>신고일 : <span id="report_date"></span></div>
    		<div id="report_category">신고사유</div>
    		<div id="report_content"></div>
    		<a id="report_file" target="_blank"></a>
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
                <li><a href="<%=request.getContextPath() %>/admin/approval/list" class="sub_menu">승인 요청목록</a></li>
                <li><a href="<%=request.getContextPath() %>/admin/report/list" class="sub_menu" style="color: #9bbfd9;">신고 상품목록</a></li>
                <li><a href="<%=request.getContextPath()%>/admin/sales/list" class="sub_menu">펀딩 매출관리</a></li>
                <li><a href="#" class="main_menu">고객 센터</a></li>
                <li><a href="<%=request.getContextPath()%>/notice/admin" class="sub_menu">공지사항</a></li>
                <li><a href="<%= request.getContextPath()%>/admin/ask" class="sub_menu">1:1문의</a></li>
            </ul>
        </div>

        <div id="main_body">
        	<p id="title">신고 상품 목록 관리</p>
            <div id="grid_container_wrap">
                <div class="grid_container">
                    <div class="col_title">상품번호</div>
                    <div class="col_title">상품명</div>
                    <div class="col_title">신고사유</div>
                    <div class="col_title">신고자</div>
                    <div class="col_title">신고일</div>
                    <div class="col_title">승인여부변경</div>
                </div>
                <c:forEach items="${reportList}" var="report">
                	<div class="grid_container">
	                    <div class="col_data">${report.p_no}</div>
	                    <div class="col_data" onclick="openReportDetail('${report.p_name}', '${report.email}', '${report.report_date}', '${report.report_category}', '${report.report_content}', '${report.report_file}');" style="cursor: pointer;">${report.p_name}</div>
	                    <div class="col_data">${report.report_category}</div>
	                    <div class="col_data">${report.email}</div>
	                    <div class="col_data">${report.report_date}</div>
	                    <div class="col_data"><button type="button" class="btn_approval_n" onclick="openApprovalWindow(${report.p_no}, '${report.reported_email}');">비승인</button></div>
                	</div>
                </c:forEach>
            </div>
            <div id="page_wrap">
                <div id="page_nation">
                	<c:if test="${startPage > 1}">
						<button id="btn_prev" type="button" onclick="location.href='<%=request.getContextPath()%>/admin/report/list?page=${startPage-1}'"></button>
					</c:if>
					<c:forEach var="i" begin="${startPage}" end="${endPage}">
						<c:if test="${i == currentPage}">
							<button class="active btnPage" type="button" onclick="location.href='<%=request.getContextPath()%>/admin/report/list?page=${i}'">${i}</button>
						</c:if>
						<c:if test="${i != currentPage}">
							<button class="btnPage" type="button" onclick="location.href='<%=request.getContextPath()%>/admin/report/list?page=${i}'">${i}</button>
						</c:if>
					</c:forEach>
					<c:if test="${endPage < totalPageCnt}">
						<button id="btn_next" type="button" onclick="location.href='<%=request.getContextPath()%>/admin/report/list?page=${endPage+1}'"></button>
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
    	var reported_email = null;
    	
    	// 상품명 클릭 시, 신고 정보 상세보여주는 모달창 띄우기
    	function openReportDetail(p_name, email, report_date, report_category, report_content, report_file) {
            $("#product_name").text(p_name);
            $("#email").text(email);
            $("#report_date").text(report_date);
            $("#report_category").text(report_category);
            $("#report_content").text(report_content);
            if(report_file == '') {
                $("#report_file").removeAttr('href');
                $("#report_file").text('첨부파일 없음');
            } else {
                $("#report_file").prop('href', report_file);
                $("#report_file").text('첨부파일 열기');
            }

    		$(".report_detail").show();
    	};
    	// 제목 옆에 X 버튼 클릭 시 모달창 닫기
        $("#btn_close").on('click', function () {
            $(".report_detail").hide();
        });
        // 모달창 띄우고 내용 있는 곳 부분 제외한 곳 누르면 모달창 닫기
        $(".report_detail").on('click', function () {
            if (event.target == $(".report_detail").get(0)) {
                $(".report_detail").hide();
            }
        });
        
    	// 비승인 클릭 시, 상품 판매 비승인 여부 물어보는 모달창 띄우기
	    function openApprovalWindow(approval_no, approval_email) {
	        console.log("비승인 클릭");
	        p_no = approval_no;
	        reported_email = approval_email;
	        $(".cancel_approval").show();
	    };
	    // 취소 버튼 클릭 시 모달창 닫기
	    $("#btn_cancel_approval_cancel").on('click', function () {
	        $(".cancel_approval").hide();
	    });
	    // 모달창 띄우고 내용 있는 곳 부분 제외한 곳 누르면 모달창 닫기
	    $(".cancel_approval").on('click', function () {
	        if (event.target == $(".cancel_approval").get(0)) {
	            $(".cancel_approval").hide();
	        }
	    });
	    // 확인 버튼 클릭 시 처리
	    $("#btn_cancel_approval_submit").on('click', function(){
	    	console.log("확인 클릭");
	    	console.log(p_no + ", " + reported_email);
            $.ajax({
				url: "<%=request.getContextPath()%>/funding/updateApproval",
				type: "post",
				data: {
					p_no: p_no,
					email: reported_email,
					p_approval: 'N',
					a_content: "펀딩 신청하신 상품의 누적 신고 횟수로 인해 판매가 중지되었습니다."
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