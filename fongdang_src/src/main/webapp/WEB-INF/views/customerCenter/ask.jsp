<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/button.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/header.css">
<!DOCTYPE html>
<html>
<head>


<title>제목</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
body {
	margin: 0 auto;
	width: 1200px;
}

p, h1, h2, h3, h4, h5, h6 {
	margin-left: 15px;
}

.allWrap {
	width: 100%;
	text-align: center
}

.top {
	position: relative;
	top: 100px;
}

.ask {
	position: relative;
	top: 130px;
	width: 60%;
	margin: 15px auto;
	border-radius: 10px;
	background-color: rgba(153, 153, 153, 0.333);
	display: flex;
	text-align: justify;
}

.askWrap {
	align-items: center;
	justify-content: center;
	position: relative;
	top: 200px;
}

li, h2 {
	margin-left: 10px;
	text-align: left;
}

.reply {
	position: relative;
	text-align: left;
	top: 135px;
	width: 60%;
	margin: 0 auto;
	border-radius: 10px;
	background-color: rgba(153, 153, 153, 0.333);
	padding: 1px;
}

.toggle {
	display: flex;
	align-items: center;
	font-size: 30px;
	margin: 0 50px 0 auto;
	transition: all .4s;
	cursor: pointer;
}

.toggle:hover {
	color: #9bbfd9;
}

ul, li {
	list-style: none;
}

.ask_sort {
	position: relative;
	font-size: 15px;
	color: white;
	top: 25px;
	margin-left: 10px;
	height: 21px;
	background-color: chocolate;
	border: chocolate solid 1.5px;
}

.reply_end {
	position: relative;
	font-size: 15px;
	color: rgb(250, 250, 250);
	top: 25px;
	margin-left: 10px;
	height: 21px;
	background-color: rgba(147, 135, 252, 0.819);
	border: rgba(147, 135, 252, 0.819) solid 1.5px;
}

.btn {
	margin: 50px auto;
	width: 200px;
}
</style>
</head>

<body>
	<div class="allWrap">
		<div class="imgWrap"></div>
		<div class="top">
			<p>
			<h1>나의 1:1 문의 내역</h1>
			</p>
		</div>
		<ul class="askWrap" style="width: 90%; margin: 0 auto;">
			<li style="display: flex;">
				<h2 class="ask01">언제 도착하나요?</h2>
				<span class="ask_sort">배송문의</span><span class="reply_end">답변완료</span>
				<span class="toggle">&#9660</span>
			</li>
			<li class="content">
				<p>한달 전에 주문했는데 아직도 준비중이네요. 언제 도착하는지 알고싶습니다.</p>
				<hr style="width: 99%;">
				<p>
				<h4>내일 도착합니다</h4>
				</p>
			</li>
			<li style="display: flex;">
				<h2 class="ask01">언제 도착하나요?</h2> <span class="toggle">&#9660</span>
			</li>
			<li class="content">
				<p>한달 전에 주문했는데 아직도 준비중이네요. 언제 도착하는지 알고싶습니다.</p>
				<hr style="width: 99%;">
				<p>
				<h4>내일 도착합니다</h4>
				</p>
			</li>
			<li style="display: flex;">
				<button class="btn btn-fill-fcolor">문의하기</button>
			</li>
		</ul>
	</div>
	</div>

	<script>
		$(document).ready(function() {
			$(".toggle").click(function() {
				$(this).parent().next().toggle();

			});
		});
	</script>
</body>

</html>