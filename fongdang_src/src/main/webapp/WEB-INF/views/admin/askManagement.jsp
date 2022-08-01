<link rel="shortcut icon" type="image/x-icon" href="<%=request.getContextPath()%>/resources/images/investor.ico"/>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/reset.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/font.css">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 - 1대1 문의 관리</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<style>
/* header */
#admin_navigator {
	border-bottom: 1px solid #ccc;
	box-sizing: border-box;
	height: 130px;
	color: #444c57;
	padding-top: 20px;
}

#admin_navigationbar {
	position: relative;
	width: 1280px;
	height: 100px;
	margin: 0 auto;
}

#logo_wrap {
	position: absolute;
	top: 0;
	width: 100px;
}

#logo {
	width: 95px;
	height: 65px;
}

#admin_header_title {
	position: absolute;
	top: 30%;
	left: 150px;
	font-family: SUIT-SemiBold;
	font-size: 28px;
}
</style>
<style>
* {
	font-family: SUIT-Regular;
}

a {
	text-decoration: none;
}

#container {
	display: flex;
	flex-flow: row wrap;
	margin: 0 auto;
	width: 1200px;
	height: 800px;
}

#admin_nav {
	/* float: left; */
	width: 20%;
	height: 100%;
}

#admin_nav ul {
	border-right: 1px solid #ccc;
	width: 200px;
	height: 600px;
	padding-top: 50px;
}

#admin_nav li {
	margin: 25px;
}

#admin_nav li a {
	color: #444c57;
}

.main_menu {
	font-family: SUIT-SemiBold;
	font-size: 20px;
	font-weight: bold;
}

.sub_menu {
	padding-left: 30px;
	font-family: SUIT-Regular;
	font-size: 14px;
}

#main_body {
	width: 80%;
	height: 100%;
}
</style>
<style>
.tableWrap {
	position: relative;
    top: 15%;
    margin-left: 15px;
}

.page_title {
	border-bottom: 1px solid #ccc;
	height: 40px;
	font-family: SUIT-SemiBold;
	font-size: 25px;
	top: 70px;
	margin-left: 15px;
	position: relative;
}

.table {
	text-align: center;
}

.table tr th, .table tr td:not(:last-child) {
	width: 100px;
	max-width: 100px;
	overflow: hidden;
}
.contentModal {
	position: absolute;
    width: 319px;
    height: 247px;
    background: #c1c1c1e4;
    bottom: -2px;
    right: 159px;
    padding: 16px;
    text-align: left;
    border: solid 1.7px;
    border-radius: 18px;
    overflow: auto;
    display: none;
}
.ansView{
cursor: pointer;
}
.ansView:hover .contentModal{
display: block;}
</style>
</head>
<body>
	<div id="admin_navigator">
		<div id="admin_navigationbar">
			<div id="logo_wrap">
				<!-- TODO: 퐁당 메인 페이지 URL 작성하기 -->
				<a href="<%=request.getContextPath()%>/"> <img
					src="<%=request.getContextPath()%>/resources/images/logo.png"
					id="logo">
				</a>
			</div>
			<div id="admin_header_title">
				<p>관리자 페이지</p>
			</div>
		</div>
	</div>
	<div id="container">
		<div id="admin_nav">
			<ul>
				<li><a href="<%=request.getContextPath()%>/admin/memberManagement" class="main_menu">회원 관리</a></li>
				<li><a href="<%=request.getContextPath()%>/admin/memberManagement" class="sub_menu">회원 조회</a></li>
				<li><a href="#" class="main_menu">펀딩 관리</a></li>
				<li><a href="<%=request.getContextPath() %>/admin/approval/list" class="sub_menu">승인 요청목록</a></li>
        		<li><a href="<%=request.getContextPath() %>/admin/report/list" class="sub_menu">신고 상품목록</a></li>
				<li><a href="<%=request.getContextPath()%>/admin/sales/list" class="sub_menu">펀딩매출관리</a></li>
				<li><a href="#" class="main_menu">고객 센터</a></li>
				<li><a href="<%=request.getContextPath()%>/notice/admin" class="sub_menu">공지사항</a></li>
				<li><a href="<%=request.getContextPath()%>/admin/ask" class="sub_menu" style="color: #9bbfd9;">1:1문의</a></li>
			</ul>
		</div>

		<div id="main_body">
			<h3 class="page_title">1:1 문의내역 관리</h3>
			<div class="tableWrap">
				<p style="margin-bottom: 22px;">미응답 문의</p>
				<table class="table table-hover">
					<thead>
						<tr>
							<th>제목</th>
							<th>문의종류</th>
							<th>작성자(email)</th>
							<th>작성일</th>
							<th>답변</th>
						</tr>
					</thead>
					<tbody>
						<form action="answer" method="get" id="answer">
							<c:forEach items="${ask_N}" var="askN">
								<tr>
									<input type="hidden" name="ask_no" value="${askN.ask_no}">
									<td>${askN.ask_title}</td>
									<td>${askN.ask_category}</td>
									<td>${askN.email}</td>
									<td>${askN.ask_date}</td>
									<td style="width: 110px;"><a
										href="<%=request.getContextPath()%>/admin/answer/${askN.ask_no}">답변하러가기</a>
									</td>
								</tr>
							</c:forEach>
							<c:if test="${empty ask_N}">
								<td colspan="5" style="font-size: 18px">등록된 문의가 없습니다.</td>
							</c:if>
						</form>
					</tbody>
				</table>

				<p style="margin-top: 75px; margin-bottom: 22px;">응답완료 문의</p>

				<table class="table table-hover">
					<thead>
						<tr>
							<th>제목</th>
							<th>문의종류</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>답변</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${ask_Y}" var="askY">
							<tr>
								<td>${askY.ask_title}</td>
								<td>${askY.ask_category}</td>
								<td>${askY.email}</td>
								<td>${askY.ask_date}</td>
								<td class="ansView" style="width: 110px;position: relative;">답변내용확인
								<div class="contentModal">
								<p>제목:${askY.ask_title}</p><p>내용:${askY.ask_content}</p><br><br><p>답변내용:${askY.ans_content}</p></div></td>
								
							</tr>
						</c:forEach>
						<c:if test="${empty ask_Y}">
							<td colspan="5" style="font-size: 18px">등록된 답변이 없습니다.</td>
						</c:if>
					</tbody>
				</table>
			</div>
		</div>
	</div>

	<script>
	var member=  '${loginInfo.email}';
	console.log("접근한회원정보: " + member);	
	
	if(member == 'admin') {
		console.log("안녕하세요 관리자님!");
	} else {
		alert("관리자 권한이 필요한 페이지입니다.");
		location.href='<%=request.getContextPath()%>/';
	}
		$("#admin_nav ul li a").click(function() {
			console.log("click()");
			var before_color = '#444c57';
			var after_color = '#9bbfd9';

			// 클릭한 이벤트 객체의 폰트색 변경
			$(this).css('color', after_color);
			// 클릭하지 않은 다른 객체들의 폰트색 변경
			$("#admin_nav > ul> li > a").not(this).css('color', before_color);
		});
		
		  $(".ansView").click(function() {
		        
		       	var option= "width=500, height=550";
		       	var m_no = $(this).children().val();
		       	var url = "<%=request.getContextPath()%>/admin/ask/ask_no=";
		       	url += ask_no;
		       	
		       	console.log("url: " + url);
		        window.open(url, "popup", option);
			});
	</script>
	<!-- 	<script>
		$("button[id^='ans_button']").on('click', function(e) {
			answer.submit();
			function($(this));
		});
	</script> -->
</body>
</html>
