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
<title>option</title>

<script src="https://code.jquery.com/jquery-3.6.0.js" ></script>

</head>
<body>
<jsp:include page="../maker_header.jsp"/>
<div id="section_page">  
	<nav id="nav_funding"  >
	    <div style="border-right: 1px solid #ccc; height:100%" class="ulWrap">
		    <div id="nav_fundingmeber">
		
		         <p id="member_name">${loginInfo.name} 님</p> 
		     </div>
		     <ul>
		        <li><a href="<%=request.getContextPath()%>/maker/view"> 메이커 정보 </a></li>
		        <li><a href="<%= request.getContextPath()%>/product/view"> 펀딩 상품</a></li>
		        <li><a href="<%= request.getContextPath()%>/option/view"> 펀딩 옵션</a></li>
		        <li><a href="#"> 오픈예정 현황</a></li>
		        <li><a href="#"> 펀딩 현황</a></li>
		        <!-- <li><a href="#"> 결제 현황</a></li> -->
		        <li><a href="#"> 정산관리</a></li>
		      </ul>
	      </div>
	  </nav>
<section id="maker"> 
  <div id="maker_all">
        <form method="post" name="optionForm" enctype="multipart/form-data">
           
            <table id="maker_Table">
                <tr>
                    <td id="title"><b>옵션등록</b>
                    <br><small id="small_txt">최대 5개까지 설정가능합니다.</small>
                    </td>
                    <td ></td>
                    <td></td>
                </tr>
                   <tr>
                    <td id="title">옵션이름<sup>*</sup></td>
                    <td ><input type="text" name="option_name"  class="in_box"  placeholder="" value="${option.option_name}"  ></td>
                    <td></td>
                </tr>
                <tr>
                    <td id="title">옵션가격<sup>*</sup></td>
                    <td><input type="text" name="option_price" class="in_box" placeholder=""  value="${option.option_price}"  >원</td>
                    <td></td>
                </tr>
                <tr>
                    <td id="title">옵션 정보<sup>*</sup></td>
                    <td><input type="text" name="option_info" class="in_box" placeholder="" value="${option.option_info}" ></td>
                    <td></td>
                </tr>
 
                 <tr>
                    <td id="title">제한수량<sup>*</sup></td>
                    <td><input type="text" name="option_limit" class="in_box" value="${option.option_limit}" ></td>
                    <td></td> 
                </tr>
                <tr>
                    <td></td>
                    <td>
                    <input type="hidden" name="p_no"  value="${p_no}"/>
                    <input type="hidden" name="update" id="update" value=""/>
                    <input type="button" class="btn2" value="저장하기" id="save"  /></td>
                    <td></td>
                </tr>
            </table>
        </form>
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
</html>