<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="shortcut icon" type="image/x-icon" href="<%=request.getContextPath()%>/resources/images/investor.ico"/>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/reset.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/font.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/button.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/header.css">
<!DOCTYPE html>
<html>
<head>
<title>문의하기</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<style>
* {
	font-family: SUIT-Regular;
}

body {
	width: 100%;
}

.askAllWrap {
	width: 1200px;
	margin: 100px auto 0;
}

.textWrap {
	width: 900px;
	margin: 0 auto;
}

.askAllWrap .titleWrap {
	display: flex;
	justify-content: left;
	align-items: center;
}

.ask_category {
	position: relative;
	left: 22px;
	height: 45px;
	width: 95px;
	font-size: 15px;
	border-radius: 5px;
}

.ask_category:hover {
	border-color: #9bbfd9;
}

.askAllWrap .contentWrap {
	display: flex;
	justify-content: center;
	align-items: center;
}

.buttonWrap {
	margin-top: 55px;
	display: flex;
	justify-content: center;
	align-items: center;
}

.askContent {
	margin-top: 15px;
}

.ask_boxborder {
	padding: .375rem .75rem;
	font-size: 15px;
	font-weight: 400;
	color: #212529;
	background-color: #fff;
	border: 1.8px solid #212529;
	border-radius: 5px;
	transition: border-color .15s ease-in-out, box-shadow .15s ease-in-out
}

.ask_boxborder:hover {
	border-color: #9bbfd9;
}

.ask_boxborder:focus {
	color: #212529;
	background-color: #fff;
	border-color: #9bbfd9;
	outline: 0;
	box-shadow: 0 0 0 .10rem #9bbfd9;
}

.ask_boxborder-color::-moz-color-swatch {
	border-radius: 3px;
}

.askTop {
	display: flex;
	width: 102px;
	font-size: 22px;
	margin: 20px auto;
	background: white;
	z-index: 999;
}
</style>
</head>

<body>
	<jsp:include page="../header.jsp" />
	<form action="doAsk" method="post" id="doAsk">
		<div class="askAllWrap">
			<div class="textWrap">
				<div>
					<h2 class="askTop">문의 글쓰기</h2>
					<hr
						style="position: relative; bottom: 35; z-index: -1; border: double;">
				</div>
				<input type="hidden" name="email" value="${loginInfo.email}" />
				<div class="titleWrap">
					<input class="ask_boxborder" type="text" name="ask_title" placeholder="제목을 입력해주세요."
						id="ask_title" style="width: 784px; height: 46px;"> <select
						size="1" class="ask_category" name="ask_category">
						<option selected>배송</option>
						<option>결제</option>
						<option>상품</option>
						<option>환불</option>
						<option>펀딩</option>
						<option>기타</option>
					</select>
				</div>
				<div class="contentWrap">
					<div>
						<textarea class="askContent ask_boxborder" name="ask_content" placeholder="내용을 입력해주세요."
							id="ask_content" style="width: 900px; height: 352px; resize: none;"></textarea>
						<br>
					</div>
				</div>
				<div class="buttonWrap" style="margin-bottom: 100px;">
					<button class="btn btn-fill-fcolor" type="button"
						style="width: 206px;" onclick="ask_check();">등록하기</button>
				</div>
			</div>
		</div>
	</form>
	<jsp:include page="../footer.jsp" />
	<script>
		function ask_check() {
			var title = document.getElementById("ask_title");
			var content = document.getElementById("ask_content");

			if (title.value == "") {
				alert("제목을 입력하세요.");
				title.focus();
				return false;
			}
			if (content.value == "") {
				alert("내용을 입력하세요.");
				content.focus();
				return false;
			}
			doAsk.submit();
		};
	</script>
</body>

</html>
