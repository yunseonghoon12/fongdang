<link rel="shortcut icon" type="image/x-icon"
	href="<%=request.getContextPath()%>/resources/images/investor.ico" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/reset.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/font.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/maker_header.css">

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>옵션 등록</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<style type="text/css">

/* body 부분  */
#section_page {
	width: 1200px;
	display: flex;
	justify-content: center;
	margin: 0 auto;
	font-family: SUIT-Regular;
}

#section_page {
	z-index: 1;
}
/* body  목록리스트  */
#nav_funding {
	width: 240px;
}
/* body  본문 */
section #optionList{
	width:960px;
}
/* 테이블  감싸는 div */
section #optionList_all{
	margin: 20px 0px 50px 0px;
}

/* 테이블 전체 */
section table#optionList-table{
	border-spacing: 20px 20px;
	border-collapse: separate;
	padding: 30px;
	/*	table-layout: fixed;*/
}

#nav_funding li {
	text-align: center;
	margin: 20px 0 0;
}
/*  윗첨자* css */
sup {
color: red;
}
	

/* nav 목록글자 호버 */
#nav_funding a:hover {
	opacity: 0.5;
}

/* nav 목록글자 css */
#nav_funding a{
	text-align: center;
	font-size: 16px;
	line-height: 1em;
	color: #444c57;
	display: inline-block;
	padding: 10px 10px;
	margin: 0px 0 0;
	border-radius: 3px;
	width: 130px;
	font-family: SUIT-Regular;
	 border-radius: 50px; 
	border: 1px solid #ced4da;
}

/* nav 글자 설정 */
#nav_fundingmeber {
	padding: 10px;
	text-align: center;
	font-size: 16px;
}
/* 첨부설명 */
#small_txt {
	color: #495057;
	font-size: 10px;
	font-family: SUIT-Light;
}

/* 로그인 회원 글자 */
#member_name {
	text-align: center;
	font-size: 16px;
	color: #444c57;
}

.agree_a {
	font-family: SUIT-Light;
	color: #5e5e5e;
	font-size: 12px;
}
#nav_funding li {
	text-align: center;
	margin: 20px 0 0;
}
/*   */
.ulWrap {
	position: relative;
	top: 71px;
}
/* 옵션 표*/

#optionList-table #optionList-tableAll {
	border-collapse: collapse;
	text-align: center;
	font-family: SUIT-Regular;
	border-top: 1px solid #444444;
}



#optionList-table td{
	padding: 10px;
}

section #col_title{
	margin-top: 50px;
    padding: 10px 0px;
    margin-bottom: 5px;
    font-family: SUIT-SemiBold;
    text-align: center;
    font-size: 18px;
}
#optionList-table td {
    font-family: SUIT-Regular;
    font-size: 15px;
    white-space: nowrap; 
    overflow: hidden; 
    text-overflow: ellipsis;
    margin: 3px 0px;
    height: 25px;
    line-height: 25px;
}
</style>


</head>
<body>
	<jsp:include page="../maker_header.jsp" />
<div id="section_page">
		<nav id="nav_funding">
			<div style="border-right: 1px solid #ccc; height: 100%"
				class="ulWrap">
				<div id="nav_fundingmeber">

					<p id="member_name">${loginInfo.name}님</p>
				</div>
				<ul>
					<li><a href="<%=request.getContextPath()%>/maker/view">
							메이커 정보 </a></li>
					<li><a href="<%=request.getContextPath()%>/product/view">
							펀딩 상품</a></li>
					<li><a href="<%=request.getContextPath()%>/option/viewList">
							펀딩 옵션</a></li>
					<!-- <li><a href="#"> 오픈예정 현황</a></li>
			        <li><a href="#"> 펀딩 현황</a></li>
			        <li><a href="#"> 결제 현황</a></li> 
			        <li><a href="#"> 정산관리</a></li>-->
				</ul>
			</div>
		</nav>
		<section id="optionList">
			<div id="optionList_all">
				<table id="optionList-table">
					<tr>
						<th><b id="optionList-title">옵션 리스트</b></th>
					</tr>
					<tr id="col_title">
						<td>옵션번호</td>
						<td>옵션명</td>
						<td>옵션가격</td>
						<!--<td>옵션정보</td>-->
						<td>제한수량</td>
					</tr>
					<c:forEach items="${optionList}" var="options">
						<tr id="optionTr">
							<td><a
								href="<%=request.getContextPath() %>/option/view?option_no=${options.option_no }&p_no=${options.p_no }">${options.option_no }</a></td>
							<td>${options.option_name}</td>
							<td>${options.option_price}</td>
							<!--<td>${options.option_info}</td>-->
							<td>${options.option_limit}</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</section>
	</div>

</body>

<script>
$(document).ready(function() {    
	
    $("#save").click(function () {
    	const formData = $("form[name=optionForm]").serialize();
    	$.ajax({
            type: "post",
            url: "<%=request.getContextPath()%>/option/insert",
				dataType : "text",
				data : formData,
				success : function(result) {
					console.log("result : ", result);
					if (result == "success") {
						alert("저장 성공");
						//TODO 이동하는 페이지 쓰기 
					} else if (result == "fail") {
						alert("저장에 실패했습니다 \n 관리자에게 문의해주세요.");
					} else if (result == "over") {
						alert("옵션은 5개 까지 등록할 수 있습니다.");
					}
				},
				error : function(result) {
					alert("저장에 실패했습니다 \n 관리자에게 문의해주세요.");
					console.log("result : ", result);
				}
			});
		});
	});
</script>
</html>