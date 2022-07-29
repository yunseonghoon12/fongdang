<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/reset.css">
<link rel="shortcut icon" type="image/x-icon" href="<%=request.getContextPath()%>/resources/images/investor.ico">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/font.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/header.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/likelist.css">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>퐁당 - 좋아요</title>
  <script src="https://code.jquery.com/jquery-3.6.0.js" ></script>
  <style>    
  
</style>
</head>
<body>  
	<jsp:include page="../header.jsp"/>
	
  <div id="title_wrap">
    <p id="title">좋아요</p>        
  </div>
  <div id="page_body">  
    <div id="favorite_product_wrap">
<c:if test="${!empty likelist}">
	<c:forEach items="${likelist}" var="likelist">
		<a href="<%=request.getContextPath()%>/funding/info/${likelist.p_no}">
        <div class="prod_flex">
          <img class="prod_img" src="${likelist.p_thumbnail}">
          <div class="prod_info_wrap">
            <p class="prod_name">${likelist.p_name}</p>
            <p class="prod_maker_wrap">
              <span>${likelist.category_name}</span>｜
              <span>${likelist.maker_name}</span>
            </p>
            <hr style="border: 1px solid #9bbfd9;">
            <p class="number_wrap">
              <span class="achievement_rate">${likelist.p_goal_percent}%</span>              
              <span class="total_money">${likelist.total_funding_money}원</span>
              <span class="limit_date">${likelist.d_day}일 남음</span>
            </p>
          </div>        
        </div>
      </a>
	</c:forEach>
</c:if>    
<c:if test="${empty likelist }">
		<p id="empty_content">
			좋아하는 펀딩 프로젝트가 없습니다.<br>
			프로젝트를 좋아해보실래요? <br>			
			<button type="button" onclick="location.href='<%=request.getContextPath()%>/funding/list';" id="funding_root">
				펀딩 프로젝트 바로가기
			</button>
		</p>
</c:if>
    </div>   
    
     <p id="prev_next">    	
<c:if test="${ startPage > 1 }">
		<button onclick="location.href='<%=request.getContextPath()%>/member/likelist?page=${ startPage-1}';" style="width:50px; height:30px;">이전</button>
</c:if>
<c:forEach begin="${startPage }" end="${endPage }" var="p">
		<button id="page_btn${p}" value="${p}" onclick="location.href='<%=request.getContextPath()%>/member/likelist?page=${ p}';">${ p }</button>				
</c:forEach>
<c:if test="${endPage < totalPageCnt }">
		<button onclick="location.href='<%=request.getContextPath()%>/member/likelist?page=${ endPage+1}';" style="width:50px; height:30px;">다음</button>				
</c:if>
     </p>   
  </div>
	
  <jsp:include page="../footer.jsp"/>
  
  <script>
	//페이징 처리시 css 설정
	var page = '${currentPage}';
	var startPage =  '${startPage}';
	var endPage =  '${endPage}';
	
	for(var i=startPage; i<= endPage;  i++) {  		
		var page_btn_n = $("#page_btn"+i);
		
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