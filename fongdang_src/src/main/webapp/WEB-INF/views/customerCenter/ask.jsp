<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<c:set var="path" value="${pageContext.request.contextPath}" />
<%-- <script src="${path}/resources/css/.css"></script>  --%>
<title>제목</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
body {
	margin: 0 10%;
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
	top: 100px;
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
	margin: 0 10px 0 auto;
}

ul, li {
	list-style: none;
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
		<ul class="askWrap" style="width: 90%; margin: 50px auto;">
			<li style="display: flex;">
				<h2 class="ask01">언제 도착하나요?</h2> <span class="toggle">&#9660</span>
			</li>
			<li class="123">
				<p>한달 전에 주문했는데 아직도 준비중이네요. 언제 도착하는지 알고싶습니다.</p>
				<hr style="width: 99%;">
				<p>
				<h4>내일 도착합니다</h4>
				</p>
			</li>
			<li style="display: flex;">
				<h2 class="ask01">언제 도착하나요?</h2> <span class="toggle">&#9660</span>
			</li>
			<li class="123">
				<p>한달 전에 주문했는데 아직도 준비중이네요. 언제 도착하는지 알고싶습니다.</p>
				<hr style="width: 99%;">
				<p>
				<h4>내일 도착합니다</h4>
				</p>
			</li>
		</ul>
	</div>
	</div>

	<script>
		$(document).ready(function() {
			$(".toggle").click(function() {
				$(".123").toggle();
			});
		});
	</script>
</body>

</html>