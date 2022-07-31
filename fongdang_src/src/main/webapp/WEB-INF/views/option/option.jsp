<link rel="shortcut icon" type="image/x-icon"
	href="<%=request.getContextPath()%>/resources/images/investor.ico" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/reset.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/font.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/maker_header.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/makerRegister.css">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>옵션 등록</title>

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

</head>
<body>
	<jsp:include page="../maker_header.jsp" />
	<div id="section_page">
		<nav id="nav_funding">
			<div style="border-right: 1px solid #ccc; height: 100%"
				class="ulWrap">
				<div id="nav_fundingmeber">

					<b id="member_name">${loginInfo.name}님</b>
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
		<section id="maker">
			<div id="maker_all">
				<form method="post" name="optionForm" enctype="multipart/form-data">

					<table id="maker_Table">
						<tr>
							<td id="title"><b>옵션등록</b><br>
							<input type="hidden" name="p_no" id="p_no" value="${p_no}" /> 
							<input type="hidden" name="option_no" id="option_no" value="${option.option_no}"/>
							<input type="hidden" name="updateYn" id="updateYn" value="${updateYn}"/>
							</td>
							<td><small id="small_txt">최대 5개까지 설정가능합니다.</small></td>
							<td></td>
						</tr>
						<tr>
							<td id="title">옵션명<sup>*</sup></td>
							<td><input type="text" name="option_name" class="in_box"
								placeholder="" value="${option.option_name}">
							</td>
							<td></td>
						</tr>
						<tr>
							<td id="title">옵션가격<sup>*</sup></td>
							<td><input type="text" name="option_price" class="in_box"
								placeholder="" value="${option.option_price}">원</td>
							<td></td>
						</tr>
						<tr>
							<td id="title">옵션 정보<sup>*</sup></td>
							<td><input type="text" name="option_info" class="in_box"
								placeholder="" value="${option.option_info}"></td>
							<td></td>
						</tr>

						<tr>
							<td id="title">제한수량<sup>*</sup></td>
							<td><input type="text" name="option_limit" class="in_box"
								value="${option.option_limit}"></td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td>
								<input type="button" class="btn5" value="저장하기" id="save" />
								<c:if test="${updateYn eq 'Y'}">
								<input type="button" class="btn5" value="삭제하기" id="delete" />
							    </c:if>
							</td>
							<td>
							
							</td>
						</tr>
					</table>
				</form>
			</div>
		</section>
	</div>

</body>

<script>
$(document).ready(function() {   
	if($("#p_no").val() == ''){
		alert('상품을 등록해주세요.');
		location.href="<%=request.getContextPath()%>/product/view";
	}
	
	
	
    $("#save").click(function () {
    	if($("#option_no").val() == ''){
    		$("#option_no").val(0);
    	}
    	const formData = $("form[name=optionForm]").serialize();
    	$.ajax({
            type: "post",
            url: "<%=request.getContextPath()%>/option/insert",
				dataType : "text",
				data : formData,
				success : function(result) {
					console.log("result : ", result);
					if (result == "success") {
						alert("옵션이 저장되었습니다.");
						location.href="<%=request.getContextPath()%>/option/viewList";
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
	
	
	$("#delete").click(function () {
		const formData = $("form[name=optionForm]").serialize();
		$.ajax({
	        type: "post",
	        url: "<%=request.getContextPath()%>/option/delete",
				dataType : "text",
				data : formData,
				success : function(result) {
					console.log("result : ", result);
					if (result == "success") {
						alert("옵션이 삭제되었습니다. ");
						location.href="<%=request.getContextPath()%>/option/viewList";
					} else if (result == "fail") {
						alert("삭제에 실패했습니다 \n 관리자에게 문의해주세요.");
					} 
				},
				error : function(result) {
					alert("삭제에 실패했습니다 \n 관리자에게 문의해주세요.");
					console.log("result : ", result);
				}
			});
	});
});
</script>
</html>