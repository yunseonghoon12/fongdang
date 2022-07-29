<link href="<%=request.getContextPath()%>/resources/css/reset.css" rel="stylesheet">
<link rel="shortcut icon" type="image/x-icon" href="<%=request.getContextPath()%>/resources/images/investor.ico">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/font.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/header.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/myOrderList.css">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>퐁당 - 펀딩 신청한 내역</title>
  <script src="https://code.jquery.com/jquery-3.6.0.js" ></script>
</head>
<body>  
	<jsp:include page="../header.jsp"/>
	
  <div id="title_wrap">
    <p id="title">나의 펀딩</p>        
  </div>
  <div id="page_body">  
    <div id="orderlist_wrap">
<c:if test="${!empty orderlist}">
	<c:forEach items="${orderlist}" var="orderlist">
		<a href="<%=request.getContextPath()%>/funding/info/${orderlist.p_no}">
        <div class="prod_flex">
          <img class="prod_img" src="${orderlist.p_thumbnail}">
          <div class="prod_info_wrap">
            <p class="prod_name">${orderlist.p_name}</p>
            <p class="prod_maker_wrap">
              <span>${orderlist.category_name}</span>｜
              <span>${orderlist.maker_name}</span>
            </p>
            <hr style="border: 1px solid #9bbfd9;">
            <p class="number_wrap">
              <span class="achievement_rate">${orderlist.p_goal_percent}%</span>
              <span class="total_money">${orderlist.total_funding_money}원</span>
              <span class="limit_date">${orderlist.d_day}일 남음</span>
            </p>
          </div>        
        </div>
      </a>
	</c:forEach>
</c:if>    
<c:if test="${empty orderlist }">
		<p id="empty_content">
			펀딩 신청 내역이 없습니다.<br>
		</p>
</c:if>  
    </div>   
    
    <p id="prev_next">    	
<c:if test="${ startPage > 1 }">
		<button onclick="location.href='<%=request.getContextPath()%>/member/orderlist?page=${ startPage-1}';" style="width:50px; height: 30px;">이전</button>
</c:if>
<c:forEach begin="${startPage }" end="${endPage }" var="p">
		<button id="page_btn${p}" value="${p}" onclick="location.href='<%=request.getContextPath()%>/member/orderlist?page=${ p}';">${ p }</button>				
</c:forEach>
<c:if test="${endPage < totalPageCnt }">
		<button onclick="location.href='<%=request.getContextPath()%>/member/orderlist?page=${ endPage+1}';" style="width:50px; height: 30px;">다음</button>				
</c:if>
     </p>  
  </div>
	
  <jsp:include page="../footer.jsp"/>
  <script>
  	// 페이징 처리시 css 설정
  	var page = '${currentPage}';
  	var startPage =  '${startPage}';
  	var endPage =  '${endPage}';
  	
  	for(var i=startPage; i<= endPage;  i++) {  		
  		var page_btn_n = $("#page_btn"+i);
  		console.log("페이지=> " + page_btn_n.val());
  		if(page_btn_n.val() == page) {
  			page_btn_n.css({
  				"background-color": "#444c57",
  				"color" : "white"
  			});
  		}
  	}  	
  </script>
  
</body>
</html>