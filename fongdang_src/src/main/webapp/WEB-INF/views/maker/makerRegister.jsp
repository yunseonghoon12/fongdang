<link rel="shortcut icon" type="image/x-icon" href="<%=request.getContextPath()%>/resources/images/investor.ico"/>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/reset.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/font.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/makerRegister.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/maker_header.css">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<title>메이커 정보 등록</title>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script src="https://code.jquery.com/jquery-3.6.0.js" ></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
    
    //다음 카카오 주소찾기 (src="http://dmaps.daum.net/map_js_init/postcode.v2.js) 같이 추가
$(document).ready(function() {    
	
    $("#postcode_button").click(function () {
        new daum.Postcode({
            oncomplete : function(data) {
                console.log(data);
                // 우편번호와 주소 정보를 해당 필드에 넣는다.  
                document.getElementById("maker_address1").value = data.roadAddress;
            }
        }).open();
	});
    
    //API 사업자등록 번호 확인
   	$("#license_button").click(function () {
	   	var form = {
	   		bNo: $("#b_no").val()
	    }
    	$.ajax({
            type: "POST"
            ,url: "<%=request.getContextPath()%>/maker/licenseCheck"
            ,data : form
			,dataType:"JSON"
           	,success: function (result) {
               console.log("result : ", result);
               let str = result;
               let strArr = str.data;
               alert(strArr[0].tax_type);
               if (strArr[0].b_stt_cd != '' ) {
            	   $("#maker_register_num_yn").val("Y");
				}else{
					$("#maker_register_num_yn").val("N");	
				}
            }
  			,error : function (result) {
  				console.log(result);
   			}
    	});
   	});
   	$("#b_no").on("onchange", function() {
   		$("#maker_register_num_yn").val("N");
   	});
   	
  //이메일 형식 확인
	$("#maker_email").on("input",function() {
						//
		var EmailRegEx = /^[A-Za-z0-9_]+[A-Za-z0-9]*[@]{1}[A-Za-z0-9]+[A-Za-z0-9]*[.]{1}[A-Za-z]{1,3}$/;// 이메일 정규식 
		var EmailVal = $("#maker_email").val();
		if (!EmailRegEx.test(EmailVal)) { // mEmail 이메일 정규식 맞는지 체크
			console.log("이메일 형식을 바르게 입력해주세요. console");
			emailChk = true;
			$("#checkmEmail_info").html("이메일 형식이 맞지 않습니다.");
			$("#checkmEmail_info").attr('color', 'red');

		} else {
			emailChk = false;
			$("#checkmEmail_info").html("");
		}
	});
	//전화번호 형식확인 
	$("#maker_phone").on("input", function() {
		var phoneRegEx = /^[0][0-9]{2,3}-[0-9]{3,4}-[0-9]{4}$/;
		var phoneVal = $("#maker_phone").val();

		if (!phoneRegEx.test(phoneVal)) {
			console.log("전화번호 형식을 바르게 입력해주세요.console");
			phoneChk = true;
			$("#phone_info").html("전화번호 형식을 바르게 입력해주세요.");
			$("#phone_info").attr('color', 'red');
		} else {
			$("#phone_info").html("");
			console.log("전화번호 형식 OK");
			phoneChk = false;
		}
	});
	//사업자등록번호 형식확인  ex) 사업자번호: 123-45-67891 사업자 번호는 10자리
	$("#b_no").on("input", function() {
		var phoneRegEx = /^[0-9]{3}-[0-9]{2}-[0-9]{5}$/;
		var phoneVal = $("#b_no").val();

		if (!phoneRegEx.test(phoneVal)) {
			console.log("사업자등록번호 바르게 입력해주세요.console");
			phoneChk = true;
			$("#b_no_info").html("사업자등록번호  형식을 바르게 입력해주세요.");
			$("#b_no_info").attr('color', 'red');
		} else {
			$("#b_no_info").html("");
			console.log("사업자등록번호 형식 OK");
			phoneChk = false;
		}
	});
	
	$('#maker_category option').each(function(){

	    if($(this).val()=="${maker.maker_category}"){
	    	$(this).attr("selected","selected"); // attr적용안될경우 prop으로 
	    }
	});	
	
});  
</script> 
</head>
<body>
   <jsp:include page="../maker_header.jsp"/>
<div id="section_page"> 
  <nav id="nav_funding">
    <div style="border-right: 1px solid #ccc; height:100%" class="ulWrap">
	    <div id="nav_fundingmeber">
	         <b id="member_name">${loginInfo.name}님</b> 
	     </div>
	     <ul> 
	        <li><a href="<%=request.getContextPath()%>/maker/view"> 메이커 정보 </a></li>
	        <li><a href="<%= request.getContextPath()%>/product/view"> 펀딩 상품</a></li>
	        <li><a href="<%= request.getContextPath()%>/option/viewList"> 펀딩 옵션</a></li>
	        <!-- <li><a href="#"> 오픈예정 현황</a></li>
		        <li><a href="#"> 펀딩 현황</a></li>
		        <li><a href="#"> 결제 현황</a></li> 
		        <li><a href="#"> 정산관리</a></li>-->
	      </ul>
      </div>
   </nav>
<section id="maker">    
    <div id="maker_all">
        <form  method="post"  name="makerForm" id="makerForm" enctype="multipart/form-data">
            <table id="maker_Table">
                <tr>
                    <td id="title"><b>메이커 정보</b></td>
                    <td > <input type="hidden" name="email" id="email" value="${loginInfo.email}"/>
                    <input type="hidden" name="updateYn" id="updateYn" value="${updateYn}"/>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td id="title">메이커(기업)명<sup>*</sup></td>
                    <td><input type="text" name="maker_name" class="in_box" placeholder="법인사업자: 법인명 / 개인사업자: 상호" value="${maker.maker_name}" id="maker_name" required></td>
                    <td></td>
                </tr>
                <tr>
                    <td id="title">사업자구분<sup>*</sup></td>
                    <td >
                        <select name="maker_category"  class="in_box" id="maker_category" required >
                        <option value="I">개인사업자</option>
                        <option value="B">법인사업자</option>
                        </select></td>
                    <td></td>
                </tr>
                <tr>
                    <td id="title">문의전화번호<sup>*</sup></td>
                    <td ><input type="text" name="maker_phone" id="maker_phone"  class="in_box"  placeholder="전화번호 입력" value="${maker.maker_phone}" required></td>
                    <td><font id="phone_info" size="2"></font></td>
                </tr>
                <tr>
                    <td id="title">문의 이메일<sup>*</sup></td>
                    <td><input type="email" name="maker_email" id="maker_email" placeholder=" 이메일 입력"  class="in_box"  value="${maker.maker_email}"  required >
                        </td>
                    <td><font id="checkmEmail_info" size="2"></font></td> 
                </tr>
                <tr>
                    <td id="title">주소(사업장 주소)<sup>*</sup></td>
                    <td>
                        <input type="text" name="maker_address1" id="maker_address1"  class="in_box" value="${maker.maker_address1}" required ><br>
                        <input type="text"  name="maker_address2" id="maker_address2" placeholder="상세주소 입력해 주세요"  class="in_box" value="${maker.maker_address2}"  required >
                    </td>
                    <td><input type="button" class="btn1" value="주소검색" class="in_box" id="postcode_button" ></td>
                </tr>
                <tr>
                    <td id="title">사업자등록번호<sup>*</sup></td>
                    <td><input type="text" name="maker_register_num" id="b_no"  class="in_box" value="${maker.maker_register_num}" required>
                    	<input type="hidden" name="maker_register_num_yn" id="maker_register_num_yn">
                    </td>
                    <td><input type="button" class="btn1" value="확인" class="in_box" id="license_button" >
                         <font id="phone_info" size="2"></td>
                </tr>
                <tr>
                    <td id="title">사업자등록증 사본<sup>*</sup></td>
                    <td ><input type="file" name="license_copy_file" >
                    <c:if test ="${maker.maker_license_copy ne null}">
                    <br/><input type="text" name="maker_license_copy" value="${maker.maker_license_copy}" class="in_box" readonly> 
                    </c:if>
                    
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td id="title">메이커 프로필 이미지<sup>*</sup></td>
                    <td ><input type="file" name="logo_file" >
                    <c:if test ="${maker.maker_logo ne null}">
                    <br/><input type="text" name="maker_license_copy" value="${maker.maker_logo}" class="in_box" readonly> 
                    </c:if>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td id="title">홈페이지 (선택사항)</td>
                    <td><input type="text" name="maker_homepage" class="in_box" value="${maker.maker_homepage}"  placeholder=" 홈페이지 URL 입력"></td>
                    <td></td>
                </tr>
                <tr>
                    <td id="title">카카오채널 (선택사항)</td>
                    <td><input type="text" name="maker_kakao_channel"  class="in_box" value="${maker.maker_kakao_channel}"  placeholder="검색용 아이디 입력"></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                    <input type="button" class="btn2" value="저장하기" id="save_maker" />
                    </td>
                    <td></td>
                </tr>
            </table>
        </form>
    </div>  
</section>  
</div> 
<script>
$(document).ready(function() {    
	console.log('dddd');
	console.log("${message}");
	var responseMessage = "${message}";        
	console.log(responseMessage);
	if(responseMessage != ""){
		alert(responseMessage);     
	}
	if($("#email").val() == ''){
		alert('로그인 해주세요.');
		location.href="<%=request.getContextPath()%>/member/login";
	}
    $("#save_maker").click(function () {
    	
    	if($("#email").val() == ''){
    		alert('로그인 해주세요.');
    		location.href="<%=request.getContextPath()%>/member/login";
    	}
    	var urlStr;
    	
    	if ($("#updateYn").val() == 'Y') {
			urlStr ="<%=request.getContextPath()%>/maker/update"; 
		}else{
			urlStr ="<%=request.getContextPath()%>/maker/insert";
		}
    	var form = $('#makerForm')[0];
    	var formData = new FormData(form);

    	$.ajax({
    		type : 'POST',
    		enctype: 'multipart/form-data',
    		processData: false,
    		contentType: false,
            url: urlStr,
            dataType: "text",
            data: formData,
            success: function (result) {
                console.log("result : ", result);
                if(result == "success"){
                	alert("maker저장 성공");
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