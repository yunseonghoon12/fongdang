<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/reset.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/font.css">
<link rel="shortcut icon" type="image/x-icon"
	href="<%=request.getContextPath()%>/resources/images/investor.ico">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>퐁당 - 관리자페이지</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<style>
/* header */
* {
    font-family: SUIT-Regular;
}

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
/* main section */
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
	width: 180px;
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
	/* float: right; */
	width: 80%;
	height: 100%;
}

.replyTextareaWrap {
	position: relative;
	top: -75px;
	height: 330px;
	width: 760px;
}

.customerAskWrap {
	position: relative;
	margin-top: 45px;
	width: 1000px;
	height: 200px;
}

#answer {
	margin: 0 auto;
	justify-content: center;
}

.replyTextarea {
	width: 760px;
	height: 330px;
	position: relative;
	resize: none;
}
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
			<!-- 관리자 메뉴 -->
			<!-- <a>태그 href에 각 기능별로 이동할 url 작성 -->
			<ul>
				<li><a href="#" class="main_menu">회원 관리</a></li>
				<li><a href="#" class="sub_menu">회원 조회</a></li>
				<li><a href="#" class="main_menu">펀딩 관리</a></li>
				<li><a href="#" class="sub_menu">승인 요청목록</a></li>
				<li><a href="#" class="sub_menu">펀딩 일정 관리</a></li>
				<li><a href="#" class="sub_menu">신고 상품</a></li>
				<li><a href="#" class="sub_menu">펀딩매출관리</a></li>
				<li><a href="#" class="main_menu">고객 센터</a></li>
				<li><a href="#" class="sub_menu">공지사항</a></li>
				<li><a href="<%=request.getContextPath()%>/admin/ask"
					class="sub_menu">1:1문의</a></li>
			</ul>
		</div>

		<div id="main_body">
			<form action="<%=request.getContextPath()%>/admin/answer.do"
				id="answer" method="POST" style="height: 458px;">
				<c:forEach items="${ask}" var="ask">
					<div class="customerAskWrap">
						<p>제목: ${ask.ask_title}</p>
						<br>
						<p>내용: ${ask.ask_content}</p>
						<input type="hidden" name="email" value="${ask.email}"> <input
							type="hidden" name="a_content" value="관리자로부터 문의하신 답변이 도착했습니다.">
					</div>
				</c:forEach>
				<input type="hidden" name="ask_no" value="${ask_no}">
				<div class="replyTextareaWrap">
					<textarea class="replyTextarea" name="ans_content" id="ans_content"></textarea>
				</div>
			</form>
			<div
				style="display: flex; justify-content: center; margin: 0 auto; margin-top: 40px; position: relative; right: 110px;">
				<button type="button" onclick="ans_check();"
					style="margin-right: 10px;">등록</button>
				<a href="<%=request.getContextPath()%>/admin/ask"><button>취소</button></a>
			</div>
		</div>
	</div>

	<jsp:include page="../footer.jsp" />
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
	</script>
	<script>
		function ans_check() {
			var content = document.getElementById("ans_content");

			if (content.value == "") {
				alert("내용을 입력하세요.");
				content.focus();
				return false;
			}
			answer.submit();
		};
	</script>
</body>
</html>