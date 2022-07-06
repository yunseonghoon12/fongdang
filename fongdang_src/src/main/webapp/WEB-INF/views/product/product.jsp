<link rel="shortcut icon" type="image/x-icon" href="<%=request.getContextPath()%>/resources/images/investor.ico"/>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/reset.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/font.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/maker_header.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/makerRegister.css">

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PRODCUT</title>
<!-- 제이쿼리 js -->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/timepicker.css" />
<script src="<%=request.getContextPath()%>/resources/js/timepicker.js"></script>
<script>

$( document ).ready(function() {
	
	$("#start_day").datepicker({
		dateFormat:'yy-mm-dd',
		monthNamesShort:[ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월' ],
		dayNamesMin:[ '일', '월', '화', '수', '목', '금', '토' ],
		changeMonth:true,
		changeYear:true,
		showMonthAfterYear:true,
		showOn:"button",
	    buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif",
		// timepicker 설정
		timeFormat:'HH',
		controlType:'select',
		oneLine:true,
	});
	$( "#end_day" ).datepicker({
		dateFormat:'yy-mm-dd',
		monthNamesShort:[ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월' ],
		dayNamesMin:[ '일', '월', '화', '수', '목', '금', '토' ],
		changeMonth:true,
		changeYear:true,
		showMonthAfterYear:true,
		showOn:"button",
	    buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif",

	});
	$( "#delivery_date" ).datepicker({
		dateFormat:'yy-mm-dd',
		monthNamesShort:[ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월' ],
		dayNamesMin:[ '일', '월', '화', '수', '목', '금', '토' ],
		changeMonth:true,
		changeYear:true,
		showMonthAfterYear:true,
		showOn:"button",
	    buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif",

	});
	$( "#payment_plan" ).datepicker({
		dateFormat:'yy-mm-dd',
		monthNamesShort:[ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월' ],
		dayNamesMin:[ '일', '월', '화', '수', '목', '금', '토' ],
		changeMonth:true,
		changeYear:true,
		showMonthAfterYear:true,
		showOn:"button",
	    buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif",

	});   
	
	function readImage(input) {
	    // 인풋 태그에 파일이 있는 경우
	    if(input.files && input.files[0]) {
	        // 이미지 파일인지 검사 (생략)
	        // FileReader 인스턴스 생성
	        const reader = new FileReader()
	        // 이미지가 로드가 된 경우
	        reader.onload = e => {
	            const previewImage = document.getElementById("preview-image")
	            previewImage.src = e.target.result
	        }
	        // reader가 이미지 읽도록 하기
	        reader.readAsDataURL(input.files[0])
	    }
	}
	// input file에 change 이벤트 부여
	const inputImage = document.getElementById("input-image")
	inputImage.addEventListener("change", e => {
	    readImage(e.target)
	})
});

</script>
</head>
<body>
<jsp:include page="../maker_header.jsp"/>
	<div id="section_page">
		<nav id="nav_funding">
			<div style="border-right: 1px solid #ccc; height: 100%" class="ulWrap">
				<div id="nav_fundingmeber">

					<p id="member_name">${loginInfo.name}님</p>
				</div>
				<ul>
					<li><a href="<%=request.getContextPath()%>/maker/Register">
							메이커 정보 </a></li>
					<li><a
						href="<%=request.getContextPath()%>/product/product.pag"> 펀딩
							상품</a></li>
					<li><a href="<%=request.getContextPath()%>/option/option.pag">
							펀딩 옵션</a></li>
					<li><a href="#"> 오픈예정 현황</a></li>
					<li><a href="#"> 펀딩 현황</a></li>
					<!-- <li><a href="#"> 결제 현황</a></li> -->
					<li><a href="#"> 정산관리</a></li>
				</ul>
			</div>
		</nav>
		<section id="maker">  
			<div id="maker_all">
				<form action="<%=request.getContextPath()%>/product/product.pag"
					method="post" enctype="multipart/form-data">
					<!-- <div>
                <p id="maker_title"> 펀딩상품등록 </p>
            </div> -->
					<table id="maker_Table">
						<tr>
							<td id="title"><b>펀딩상품등록</b></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td id="title">프로젝트 제목<sup>*</sup></td>
							<td><input type="text" name="p_name" class="in_box"
								placeholder="프로젝트 제목입력"></td>
							<td></td>
						</tr>
						<tr>
							<td id="title">목표금액<sup>*</sup></td>
							<td><input type="text" name="p_goal" id="p_goal"
								class="in_box" placeholder=""></td>
							<td></td>
						</tr>
						<tr>
							<td id="title">카테고리<sup>*</sup></td>
							<td><select name="category_id" class="in_box">
									<option value="C1">반려동물</option>
									<option value="C2">캠핑</option>
									<option value="C3">식품</option>
									<option value="C4">테크 ⠂가전</option>
									<option value="C5">뷰티</option>
									<option value="C6">기타</option>
							</select></td>
							<td></td>
						</tr>
						<tr>
							<td id="title">기간설정</td>
							<td></p></td>
							<td></td>
						</tr>
						<tr>
							<td id="title">펀딩시작일<sup>*</sup></td>
							<td><input type="text" name="start_day" id="start_day"
								class="in_box"></td>
							<td></td>
						</tr>
						<tr>
							<td id="title">펀딩종료일<sup>*</sup></td>
							<td><input type="text" name="end_day" id="end_day"
								class="in_box"></td>
							<td></td>
						</tr>
						<tr>
							<td id="title">결제예정일<sup>*</sup></td>
							<td><input type="text" name="payment_plan" id="payment_plan"
								class="in_box"></td>
							<td></td>
						</tr>
						<tr>
							<td id="title">발송예정일<sup>*</sup></td>
							<td><input type="text" name="delivery_date"
								id="delivery_date" class="in_box"></td>
							<td></td>
						</tr>
						
						<tr>
							<td id="title">상품 대표이미지<sup>*</sup></td>
							<td>
								<div class="image-container">
									<img style="width: 300px;" id="preview-image"
										src="<%=request.getContextPath()%>/resources/images/previewImage.png">
										<br/>
									     <input type="file" name="thumbnail_file" id="input-image">
									     <br><small id="small_txt">프로젝트의 맨 위에서 가장 먼저 보여 주고 싶은 영상이나
										  사진을 등록해 주세요.</small>
								</div>
							</td>
							<td></td>
						</tr>
						<tr>
							<td id="title">상품요약<sup>*</sup> <br>

							</td>
							<td> <input type="text" name="p_summary" id="p_summary">
							<br><small id="small_txt">소개 영상이나 사진과 함께 보이는 글이에요.
									프로젝트를 쉽고 간결하게 소개해 주세요.</small> 
							</td>
							<td></td>
						</tr>

						<tr>
							<td id="title">상품 상세정보<sup>*</sup></td>
							<td><input type="text" name="p_story" id="p_story">
								<br> <small id="small_txt">스토리 작성방법 가이드</small></td>
							<td></td>
						</tr>


						<tr>
							<td id="title">상품관련 인증증명서</td>
							<td><input type="file" name="certification_file"></td>
							<td></td>
						</tr>
						<tr>
							<td id="title">정책사항</td>
							<td>설명 설명 - 모달창으로 진행 ? 여부</td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td><button type="submit" class="btn2" value="저장하기">저장하기</button></td>
							<td></td>
						</tr>
					</table>
				</form>
			</div>
		</section>
	</div>

</body>
</html>