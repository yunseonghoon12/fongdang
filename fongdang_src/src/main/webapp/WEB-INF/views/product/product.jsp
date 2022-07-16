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
<script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/ckeditor.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/translations/ko.js"></script> 
<!--<script src="//cdn.ckeditor.com/4.18.0/full/ckeditor.js"></script>-->


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
						href="<%=request.getContextPath()%>/product/view"> 펀딩
							상품</a></li>
					<li><a href="<%=request.getContextPath()%>/option/view">
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
				<form method="post" name="productForm" id="productForm" enctype="multipart/form-data">
			
					<table id="maker_Table">
						<tr>
							<td id="title"><b>펀딩상품등록</b></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td id="title">프로젝트 제목<sup>*</sup></td>
							<td><input type="text" name="p_name" class="in_box"
								placeholder="프로젝트 제목입력" value="${product.p_name}">
								<input type="hidden" name="email" id="email" value="${loginInfo.email}"/>
							</td>
							<td></td>
						</tr>
						<tr>
							<td id="title">목표금액<sup>*</sup></td>
							<td><input type="text" name="p_goal" id="p_goal"
								class="in_box" placeholder="" value="${product.p_goal}"></td>
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
								class="in_box"  value="${product.start_day}"></td>
							<td></td>
						</tr>
						<tr>
							<td id="title">펀딩종료일<sup>*</sup></td>
							<td><input type="text" name="end_day" id="end_day"
								class="in_box" value="${product.end_day}"></td>
							<td></td>
						</tr>
						<tr>
							<td id="title">결제예정일<sup>*</sup></td>
							<td><input type="text" name="payment_plan" id="payment_plan"
								class="in_box" value="${product.payment_plan}"></td>
							<td></td>
						</tr>
						<tr>
							<td id="title">발송예정일<sup>*</sup></td>
							<td><input type="text" name="delivery_date"
								id="delivery_date" class="in_box" value="${product.delivery_date}"></td>
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
							<td> <input type="text" name="p_summary" id="p_summary" value="${product.p_summary}">
							<br><small id="small_txt">소개 영상이나 사진과 함께 보이는 글이에요.
									프로젝트를 쉽고 간결하게 소개해 주세요.</small> 
							</td>
							<td></td>
						</tr>

						<tr>
							<td id="title">상품 상세정보<sup>*</sup></td>
							<td>
							<input type="hidden" name="p_story" class="editor" value=""/>
							<textarea  id="editor" name="p_story"></textarea>
						    
							<!-- <script>
                            var content = $(".editor").val();
                            console.log("content : "+ content);
                            var tmpStr = content;
                            tmpStr = tmpStr.replaceAll("&lt;","<");
                            tmpStr = tmpStr.replaceAll("&lt;",">");
                            tmpStr = tmpStr.replaceAll("&amp;lt;","<");
                            tmpStr = tmpStr.replaceAll("&amp;gt;",">");
                            tmpStr = tmpStr.replaceAll("&amp;nbsp;"," ");
                            tmpStr = tmpStr.replaceAll("&amp;amp;","&");
                            document.getElementById('editor').innerHTML=tmpStr;
                          </script>  
                          
                           -->
							<br> <small id="small_txt">스토리 작성방법 가이드</small></td>
							
							
							<td></td>
						</tr>
						<tr>
							<td id="title">상품관련 인증증명서</td>
							<td><input type="file" name="certification_file"></td>
							<td></td>
						</tr>
						<tr>
							<td id="title">스토리 광고 심의동의<sup>*</sup></td>
							<td>
								<a href="">공통 표시·광고 가이드라인</a>
							    <a href="">식품 표시·광고 가이드라인</a>
							    <a href="">화장품 표시·광고 가이드라인</a>
							    <a href="">건강보조기구 표시·광고 가이드라인</a>
							</td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td>
							<input type="text" name="maker_name"  value="${maker_name}"/>
							<input type="hidden" name="update" id="update" value=""/>
							<input type="button" class="btn2" value="저장하기" id="saveProduct" /></td>
							<td></td>
						</tr>
					</table>
				</form>
			</div>
		</section>
	</div>
<script>
      ClassicEditor.create( document.querySelector( '#editor' ), {
          removePlugins: [ 'Heading' ],
          language: { ui: 'ko' , content: 'ko' }
      });
 </script> 
<script>
$(document).ready(function() {  
	
	if($("#email").val() == ''){
		alert('로그인 해주세요.');
		location.href="<%=request.getContextPath()%>/member/login";
	}
	
    $("#saveProduct").click(function () {
    	
    	var form = $('#productForm')[0];
    	var formData = new FormData(form);
    	
    	$.ajax({
            type: "post",
            url: "<%=request.getContextPath()%>/productForm/insert",
            dataType: "text",
            data: formData,
            success: function (result) {
                console.log("result : ", result);
                if(result == "success"){
                	alert("저장 성공");
                	//TODO 이동하는 페이지 쓰기 
                }else{
                	alert("저장에 실패했습니다 \n 관리자에게 문의해주세요.");	
                }
            },
   			error : function (result) {
   				alert("저장에 실패했습니다 \n 관리자에게 문의해주세요.");
   				console.log("result : ", result);
    		}
    	});
    });
});
</script>

</body>
</html>