<link rel="shortcut icon" type="image/x-icon" href="<%=request.getContextPath()%>/resources/images/investor.ico"/>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/reset.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/font.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/maker_header.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/makerRegister.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/optionList.css">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
		        <li><a href="<%= request.getContextPath()%>/option/viewList"> 펀딩 옵션</a></li>
		       <!-- <li><a href="#"> 오픈예정 현황</a></li>
			        <li><a href="#"> 펀딩 현황</a></li>
			        <li><a href="#"> 결제 현황</a></li> 
			        <li><a href="#"> 정산관리</a></li>-->
		      </ul>
	      </div>
	  </nav>
		<section id="makmain_bodyer">
			<div id="optionList_all">
		
					<div id="optionList">
						  <!--<p class="optionList-title">옵션리스트</p>-->
						<div class="optionList-tableAll">

							<table class="optionList-tableAll" id="optionTable">
							    
							    <tr>
							    <th><p id="optionList-title">옵션 리스트</p></th>
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
										<td><a href="<%=request.getContextPath() %>/option/view?option_no=${options.option_no }&p_no=${options.p_no }">${options.option_no }</a></td>
										<td>${options.option_name}</td>
										<td>${options.option_price}</td>
										 <!--<td>${options.option_info}</td>-->
										<td>${options.option_limit}</td>
									</tr>
								</c:forEach>
							</table>
							
						</div>
					</div>
				
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
                }else if (result == "fail"){
                	alert("저장에 실패했습니다 \n 관리자에게 문의해주세요.");	
                }else if (result == "over"){
                	alert("옵션은 5개 까지 등록할 수 있습니다.");
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