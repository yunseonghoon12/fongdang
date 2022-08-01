<link href="<%=request.getContextPath()%>/resources/css/reset.css" rel="stylesheet">
<link rel="shortcut icon" type="image/x-icon" href="<%=request.getContextPath()%>/resources/images/investor.ico">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/font.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/header.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/myfongdang.css">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>퐁당 - 마이퐁당</title>
  <script src="https://code.jquery.com/jquery-3.6.0.js" ></script>
</head>
<style>
    /* 마이페이지 */
    a {
     	text-decoration: none;
      	color: #444c57;
    }    
 </style>
<body>
<script>
	var msg = "${msg}";
	if(msg != '') {
		alert(msg);
	}
</script>
  
  <jsp:include page="../header.jsp"/>
  <div id="container">    
    <div id="myfongdang_page">
    	<div id="myfongdang_page_background"></div>       
    	<div id="myfongdang_page_main_wrap">
      		<div id="myfongdang_member_path">
        	<button type="button" id="supporter_btn">서포터</button>
        	<button type="button" id="maker_btn">메이커</button>
      	</div>
      	<div id="main_body">
	        <div id="profile_wrap">
          		<div style="border-right: 1px solid #ccc; height:100%">
		            <div id="profile_image_wrap">
<c:if test="${!empty member.profile}">
			  			<img src="${member.profile}" id="profile_img">	
</c:if>         
<c:if test="${empty member.profile}">
              			<img src="<%=request.getContextPath()%>/resources/images/user.png" id="profile_img">
</c:if>
            		</div>
            		<p id="member_name">
            			${member.nickname}님            			
            		</p>
            		<p id="member_state">
            			서포터·개인 회원           			
            		</p>          
            		<div id="profile_setting">         		
<c:choose>	
	<c:when test="${!empty kakaoToken}">						
						<p id="kakao_token">
							<span id="kakao_logo"><img src="<%=request.getContextPath()%>/resources/images/kakao_logo.png" style="width: 20px;"></span>
							<span id="state">카카오로 로그인 중</span>
						</p>								
						<button type="button" id="logout_btn" onclick="logoutHandler()">로그아웃</button>
	</c:when>	
	<c:when test="${!empty naverToken}">
						<p id="naver_token">
							<span id="naver_logo"><img src="<%=request.getContextPath()%>/resources/images/naver_logo.png" style="width: 20px;"></span>
							<span id="state">네이버로 로그인 중</span>
						</p>
						<button type="button" id="logout_btn" onclick="logoutHandler()">로그아웃</button>
	</c:when>
	<c:otherwise>
		<button type="button" id="logout_btn" onclick="logoutHandler()">로그아웃</button>
	</c:otherwise>
</c:choose>       
               			<a href="<%=request.getContextPath()%>/member/myProfile">
			              	<p id="profile_btn_wrap">
        	          			프로필 설정
                  				<span id="chevron-right">
				                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-chevron-right" viewBox="0 0 16 13">
                      					<path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/>
                    				</svg>
                  				</span>
              				</p>
               			</a>
            		</div>
          		</div>
        	</div>
		       
        <div id="section_content">
          <!-- 서포터를 눌렀을 경우 -->
          <div id="supportor_section">
            <div id="funding_record">
              <div id="recent_application">나의 펀딩               	
              	<span id="total" style="font-size: 13px; padding-left:30px;"><a href="<%=request.getContextPath()%>/member/orderlist">더 보기</a></span>
              </div>            
            </div>
            <div id="applied_product_wrap">
<c:if test="${!empty orderlist }">
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
                  </div>        
                </div>
              </a>		
	</c:forEach>
</c:if>

<c:if test="${empty orderlist }">
				<p id="empty_content">펀딩 내역이 없습니다.</p>
</c:if>            
            </div>
          </div>
          <!-- 메이커를 눌렀을 경우 -->
          <div id="maker_section">
            <div id="enrolled_funding">
              <p id="enrolled_funding_title">펀딩</p>   
              <p id="title_subcation">
                만든 펀딩 
                <span id="total" style="font-size: 13px; padding-left:30px;"><a href="<%= request.getContextPath()%>/member/myproject">더 보기</a></span>                  
              </p>                   
            </div>

            <div id="enroll_product_wrap">
<c:if test="${!empty makerFunding}">
	<c:forEach items="${makerFunding}" var="maker">
				<a href="<%=request.getContextPath()%>/funding/info/${maker.p_no}">
                <div class="prod_flex">
                  <img class="prod_img" src="${maker.p_thumbnail}">
                  <div class="prod_info_wrap">
                    <p class="prod_name">${maker.p_name}</p>                                     
                  </div>        
                </div>
              </a>
	</c:forEach>
</c:if>         

 				<!-- 메이커가 오픈한 펀딩 상품이 없는 경우 -->
<c:if test="${empty makerFunding}">
            	<p id="maker_guide">
              		펀딩한 서포터에게 제품이나<br> 
              		서비스를 제공합니다<br> 
              		<span style="font-size:14px; font-weight: normal; color:#ccc">퐁당 펀딩으로 처음을 만들어보세요</span> 
	            </p>
</c:if>                      
            </div>
                        
            <div id="enroll_wrap">
              <button type="button" onclick="location.href='<%=request.getContextPath()%>/maker/view';" id="fundingEnroll_btn">펀딩 프로젝트 오픈신청하기</button>
            </div>
          </div>

          <div id="my_activity_wrap">
            <p id="my_activity_title">나의 활동</p>
              <ul id="my_activity_content">
                <li>
                  <a href="<%=request.getContextPath()%>/member/messagebox">
                    <svg xmlns="http://www.w3.org/2000/svg" width="22" height="20" fill="currentColor" class="bi bi-envelope" viewBox="0 0 17 12">
                      <path d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V4Zm2-1a1 1 0 0 0-1 1v.217l7 4.2 7-4.2V4a1 1 0 0 0-1-1H2Zm13 2.383-4.708 2.825L15 11.105V5.383Zm-.034 6.876-5.64-3.471L8 9.583l-1.326-.795-5.64 3.47A1 1 0 0 0 2 13h12a1 1 0 0 0 .966-.741ZM1 11.105l4.708-2.897L1 5.383v5.722Z"/>
                    </svg>
                    메시지
                    <span class="chevron">
                      <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-chevron-right" viewBox="0 0 17 12">
                        <path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/>
                      </svg>
                    </span>
                  </a>
                </li>
                <li>
                  <a href="<%=request.getContextPath()%>/member/likelist">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="20" fill="currentColor" class="bi bi-heart" viewBox="0 0 16 15">
                      <path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z"/>
                    </svg>
                    좋아요
                    <span class="chevron">
                      <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-chevron-right" viewBox="0 0 17 12">
                        <path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/>
                      </svg>
                    </span>
                  </a>
                </li>
              </ul>                          
          </div>
          <div id="support_tip_wrap">
            <p id="support_tip_title">서포터 팁</p>
              <ul id="support_tip_content">
                <li>                  
                    <a href="<%=request.getContextPath()%>/notice/insertList/1">                     
                        공지사항
                        <span class="chevron">
                          <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-chevron-right" viewBox="0 0 17 12">
                            <path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/>
                          </svg>
                        </span>                    
                    </a>                 
                </li>
                <li>
                  <a href="<%=request.getContextPath()%>/guide/book">                    
                    이용 가이드
                    <span class="chevron">
                      <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-chevron-right" viewBox="0 0 17 12">
                        <path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/>
                      </svg>
                    </span>
                  </a>
                </li>
              </ul> 
          </div>
        </div>
      </div>
    </div>           
  </div>  
  </div> 
	<p style="clear: both"></p>       	
  	<jsp:include page="../footer.jsp"/>
  
  <script>
    memberPath();
    
    function memberPath() {
      $("#supporter_btn").click(function() {
        $("#supporter_btn").css({
          "z-index" : "10",
          "color" : "#9bbfd9"
        });
        $("#maker_btn").css({
          "z-index" : "9",
          "color" : "#444c57"
        });
        $("#supportor_section").show();
        $("#maker_section").hide();
      });
      $("#maker_btn").click(function() {    	  
        $("#supporter_btn").css({
          "z-index" : "9",
          "color" : "#444c57"
        });
        $("#maker_btn").css({
          "z-index" : "10",
          "color" : "#9bbfd9"
        });                
        $("#supportor_section").hide();
        $("#maker_section").show();
      });
    } 
    
    function logoutHandler() {
    	var kakaoToken =  '${kakaoToken}';
    	if(kakaoToken != null) {    		
    		var url = 'https://kauth.kakao.com/oauth/logout?client_id=' + '<spring:eval expression="@property['kakao.api_key']"/>'
    				+ '&logout_redirect_uri=' + '<spring:eval expression="@property['kakao.logout_redirect_uri']"/>';
    		location.href= url;
    	} else {
    		location.href='<%=request.getContextPath()%>/member/logout';
    	}
    }    
   
  </script>
</body>
</html>