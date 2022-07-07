<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	width: 506px;
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
	height: 30px;
	width: 95px;
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
	margin-top: 15px;
	display: flex;
	justify-content: center;
	align-items: center;
}

.askContent {
	margin-top: 15px;
}

.ask_boxborder {
	padding: .375rem .75rem;
	font-size: 1.3rem;
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

.ask_boxborder::-webkit-file-upload-button {
	color: #212529;
	background-color: #e9ecef;
	pointer-events: none;
	border-color: inherit;
	border-style: solid;
	border-width: 0;
	border-inline-end-width: 1px;
	border-radius: 0;
	transition: color .15s ease-in-out, background-color .15s ease-in-out,
		border-color .15s ease-in-out, box-shadow .15s ease-in-out
}

.ask_boxborder-color::-moz-color-swatch {
	border-radius: 3px;
}

.askTop {
	display: flex;
	width: 115px;
	font-size: 25px;
	margin: 20px auto;
	background: white;
	z-index: 999;
}
</style>
</head>

<body>
	<jsp:include page="../header.jsp" />
	<form action="#" method="post">
		<div class="askAllWrap">
			<div class="textWrap">
				<div>
					<h2 class="askTop">문의 글쓰기</h2>
					<hr
						style="position: relative; bottom: 35; z-index: -1; border: double;">
				</div>

				<div class="titleWrap">
					<input class="ask_boxborder" type="text"
						style="width: 380px; height: 24px;"> <select size="1"
						class="ask_category">
						<option value="ask1" selected>선택</option>
						<option value="ask2">배송</option>
						<option value="ask3">결제</option>
						<option value="ask4">상품</option>
						<option value="ask5">환불</option>
						<option value="ask6">기타</option>
					</select>
				</div>
				<div class="contentWrap">
					<div>
						<textarea class="askContent ask_boxborder" name="opinion"
							style="width: 500px; height: 300px;"></textarea>
						<br>
					</div>
				</div>
				<div class="buttonWrap" style="margin-bottom: 100px;">
					<button type="submit" class="btn btn-fill-fcolor" style="width: 150px">등록하기</button>
				</div>
			</div>
		</div>
	</form>
	
		<jsp:include page="../footer.jsp" />
</body>

</html>
