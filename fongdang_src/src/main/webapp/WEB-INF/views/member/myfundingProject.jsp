<link href="<%=request.getContextPath()%>/resources/css/reset.css" rel="stylesheet">
<link rel="shortcut icon" type="image/x-icon" href="<%=request.getContextPath()%>/resources/images/investor.ico">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/font.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/header.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/myproject.css">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>퐁당 - 펀딩프로젝트</title>
  <script src="https://code.jquery.com/jquery-3.6.0.js" ></script>  
</head>
<body>  
	<jsp:include page="../header.jsp"/>
	
  <div id="title_wrap">
    <p id="title">펀딩 프로젝트</p>        
  </div>
  <div id="page_body">  
    <div id="orderlist_wrap">
<c:if test="${!empty project}">
	<c:forEach items="${project}" var="project">
		<a href="<%=request.getContextPath()%>/funding/info/${project.p_no}">
        <div class="prod_flex">
          <img class="prod_img" src="${project.p_thumbnail}">
          <div class="prod_info_wrap">
            <p class="prod_name">${project.p_name}</p>
            <p class="prod_maker_wrap">
              <span>${project.category_name}</span>｜
              <span>${project.maker_name}</span>
            </p>           
          </div>        
        </div>
      </a>
	</c:forEach>
</c:if>    
<c:if test="${empty project }">
		<div id="empty_content">			
			<p style="margin-bottom: 40px;">오픈한 펀딩 프로젝트가 없습니다</p>
			<div>
				<button type="button" onclick="location.href='<%=request.getContextPath()%>/maker/view';" id="fundingEnroll_btn">펀딩 오픈 신청하러 가기</button>				
			</div>		
		</div>
</c:if>    
      
    </div> 
    
      <p id="prev_next">    	
<c:if test="${ startPage > 1 }">
		<button onclick="location.href='<%=request.getContextPath()%>/member/myproject?page=${ startPage-1}';" style="width:50px; height: 30px;">이전</button>
</c:if>
<c:forEach begin="${startPage }" end="${endPage }" var="p">
		<button id="page_btn${p}" value="${p}" onclick="location.href='<%=request.getContextPath()%>/member/myproject?page=${ p}';">${ p }</button>				
</c:forEach>
<c:if test="${endPage < totalPageCnt }">
		<button onclick="location.href='<%=request.getContextPath()%>/member/myproject?page=${ endPage+1}';" style="width:50px; height: 30px;">다음</button>				
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