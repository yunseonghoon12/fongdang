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
<title>상품 등록</title>
<!-- 제이쿼리 js -->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/timepicker.css" />
<script src="<%=request.getContextPath()%>/resources/js/timepicker.js"></script>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!--<script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/ckeditor.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/translations/ko.js"></script> --> 


<script  type="text/javasctipt" src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
<script>

$( document ).ready(function() {
	
	$("#start_day").datetimepicker({
		dateFormat:'yy-mm-dd',
		monthNamesShort:[ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월' ],
		dayNamesMin:[ '일', '월', '화', '수', '목', '금', '토' ],
		changeMonth:true,
		changeYear:true,
		showMonthAfterYear:true,
		showOn:"button",
	    buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif",
		// timepicker 설정
		timeFormat:'HH:mm',
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

					<b id="member_name">${loginInfo.name}님</b>
				</div>
				<ul>
					<li><a href="<%=request.getContextPath()%>/maker/view">
							메이커 정보 </a></li>
					<li><a
						href="<%=request.getContextPath()%>/product/view"> 펀딩
							상품</a></li>
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
				<form method="post" name="productForm" id="productForm" enctype="multipart/form-data">
			
					<table id="maker_Table">
						<tr>
							<td id="title"><b>펀딩상품등록</b></td>
							<td><input type="hidden" name="email" id="email" value="${loginInfo.email}"/>
							    <input type="hidden" name="updateYn" id="updateYn" value="${updateYn}"/>
							    <input type="hidden" name="p_no" id="p_no" value="${product.p_no}"/>
							</td>
							<td></td>
						</tr>
						<tr>
							<td id="title">프로젝트 제목<sup>*</sup></td>
							<td><input type="text" name="p_name" class="in_box"
								placeholder="프로젝트 제목입력" value="${product.p_name}"></td>
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
								class="in_box"  value="<fmt:formatDate pattern="yyyy-MM-dd hh:mm" value="${product.start_day}"/>"></td>
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
									<img style="width: 150px;" id="preview-image"
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
							<input type="text" name="p_story" id= "p_story"  class="editor"  value="${product.p_story}"/> 
								<!--<input type="hidden" name="p_story" id= "p_story"  class="editor"  value="${product.p_story}"/> -->
							    <!--<textarea   name="p_story"  name="editor1" id="editor"  value="${product.p_story}"></textarea> --> 
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
								<a class="agree_a" href="https://www.notion.so/27fa609c0082479381c46154e0c8474d">공통 표시·광고 가이드라인</a><br>
							    <a class="agree_a" href="https://www.notion.so/d53769b3bae34d3fa1e4fef4bc3a73c1">식품 표시·광고 가이드라인</a><br>
							    <a class="agree_a" href="https://www.notion.so/c872056d693640ca9fa869c96413837d">화장품 표시·광고 가이드라인</a><br>
							    <a class="agree_a" href="https://www.notion.so/7157dab6bcb1489aadcc12ce91370120">건강보조기구 표시·광고 가이드라인</a><br>
							</td>
							<td></td>
						</tr>
						<tr>
							<td id="title"></td>
							<td> <button type="button" class="btn3">동의서 확인</button> 
									<div class="modal">
				                        <div class="message_content">
				                              <p class="modal_title">동의서</p>                                                                     
					                               <div id="id_content">
					                                 <p>본 서약의 목적은 퐁당 주식회사(이하 “회사”)가 운영하는 인터넷사이트 http://www.fongdang.kr (이하 “사이트”)에 크라우드펀딩 프로젝트 개설자(이하 “메이커”)가 프로젝트 개설을 위한 스토리 등의 컨텐츠(이하 “스토리”)를 작성함에 있어 제반 되는 의무를 정함에 있습니다.</p>
					                                 <p>메이커는 스토리 작성에 있어 회사의 관련 규정을 성실히 준수하여야 하며, 다음 각 호의 사항에 동의합니다.</p>
					                                 <p>1. 메이커는 퐁당이 게시 및 안내하는 심의 가이드라인을 확인하고 이를 숙지하여야 합니다. 이를 확인하지 않거나 오인하여 발생한 손해에 대한 책임은 메이커가 부담하여야 합니다.</p>
					                                 <p>2. 퐁당에서 제공하는 가이드라인은 심의를 담당하는 기관 및 기관 담당자에 따라 해석이 달라질수 있으며, 이 경우 와디즈는 해당 기관 및 기관 담당자의 해석을 우선시합니다. 또한 퐁당이 기관 및 기관 담당자를 통해 직접 삭제 또는 수정 권고를 받은 경우 퐁당은 임의 삭제 또는 수정 등의 조치를 할 수 있습니다.</p>
					                                 <p>3. 메이커는 표시광고의 공정화에 관한 법률, 식품위생법, 화장품법, 전기용품 및 생활용품 안전관리법, 상표법, 저작권법 등 스토리 작성과 관련하여 법령이 요구하는 사항을 준수해야 하며, 법령을 준수하지 않아 발생하는 손해에 대한 책임은 메이커가 부담하여야 합니다. 퐁당은 메이커가 법령을 준수하지 않음으로써 브랜드 이미지 실추 등의 손해를 입을 수 있는 바, 이를 대비하기 위해 법령을 준수하지 않은 사항에 대하여 임의 삭제 또는 수정 등의 조치를 할 수 있습니다.</p>
					                                 <p>4. 메이커는 개설한 프로젝트 및 구성 리워드가 제 3자의 지식재산권을 침해하거나 침해할 가능성이 없음을 진술 및 보증하여야 합니다. 퐁당 지식재산권 보호정책을 위반하여 제 3자의 권리를 침해하거나 침해할 가능성이 있는 경우, 메이커는 이와 관련된 법적 책임을 지며 와디즈의 해당 프로젝트 중단/취소 등의 제한 조치에 응할 것을 확인합니다.</p>
					                                 <p>본 동의서에서 정하지 않은 사항은 회사와 메이커 사이에 별도 합의한 약정 내용 및 이용약관을 따릅니다.</p>
					                               </div>
				                               <div class="message_send">
												   	<button type="button" class="btn_close">확인</button>
							                  </div>
				                            </div>
		                                </div>
		                        </td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td>
							<input type="hidden" name="maker_name"  value="${maker_name}"/>
							
							<input type="hidden" name="update" id="update" value=""/>
							<input type="button" class="btn2" value="저장하기" id="saveProduct" /></td>
						
						 <td></td>
						</tr>
					</table>
				</form>
			</div>
		</section>
	</div>
	
<!--<script>
  ClassicEditor
    .create( document.querySelector( '#editor' ) )
    .catch( error => {
      console.error( error );
    } );
</script>	 --> 
	
<script>
$(document).ready(function() {  
	var responseMessage = "${message}";        
	if(responseMessage != ""){
		alert(responseMessage);     
	}
	if($("#email").val() == ''){
		alert('로그인 해주세요.');
		location.href="<%=request.getContextPath()%>/member/login";
	}

    $("#saveProduct").click(function () {
    	if($("#email").val() == ''){
    		alert('로그인 해주세요.');
    		location.href="<%=request.getContextPath()%>/member/login";
    	}
    	
    	var urlStr;
    	
    	if ($("#updateYn").val() == 'Y') {
			urlStr ="<%=request.getContextPath()%>/product/update"; 
		}else{
			urlStr ="<%=request.getContextPath()%>/product/insert";
		}
    	// 오류 수정 밑에 줄 //Failed to convert from type [java.lang.String] to type [java.sql.Timestamp] for value '2022-08-03 14:00'; nested exception is java.lang.IllegalArgumentException: Timestamp format must be yyyy-mm-dd hh:mm:ss[.fffffffff]]]
    	$("#start_day").val($("#start_day").val()+":00");
    	var form = $('#productForm')[0];
    	var formData = new FormData(form);
    	
    	$.ajax({
            type: 'POST',
            enctype: 'multipart/form-data',
    		processData: false,
    		contentType: false,
            url: urlStr,
            dataType: "text",
            data: formData,
            success: function (result) {
                console.log("result : ", result);
                if(result == "success"){
                	alert("Product저장 성공");
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