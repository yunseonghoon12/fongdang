<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/reset.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/font.css">
<link rel="shortcut icon" type="image/x-icon" href="<%=request.getContextPath()%>/resources/images/investor.ico">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/adminMemberManagement.css">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 - 회원 관리</title>
<script src="https://code.jquery.com/jquery-3.6.0.js" ></script> 	 
</head>

<body>
	<script>
	var msg = "${msg}";
	if(msg !='') {
		alert(msg);
	}
	
	var member=  '${loginInfo.email}';
	console.log("접근한회원정보: " + member);	
	
	// 관리자 권한을 가진 계정인지 확인
	if(member == 'admin') {
		console.log("안녕하세요 관리자님!");
	} else {
		alert("관리자 권한이 필요한 페이지입니다.");
		location.href='<%=request.getContextPath()%>/';
	}
	
	</script>

	<div id="admin_navigator">    
    <div id="admin_navigationbar">
      <div id="logo_wrap">
      	<!-- TODO: 퐁당 메인 페이지 URL 작성하기 -->
      	<a href="<%=request.getContextPath()%>/">
        	<img src="<%=request.getContextPath()%>/resources/images/logo.png" id="logo">
      	</a>
      </div>
      <div id="admin_header_title">
        <p>관리자 페이지</p>
      </div>
    </div>
  </div>
  <div id="container">
    <div id="admin_nav">
      <!-- 관리자 메뉴 -->
      <ul>
        <li><a href="<%= request.getContextPath()%>/admin/memberManagement" class="main_menu">회원 관리</a></li>
        <li><a href="<%= request.getContextPath()%>/admin/memberManagement" class="sub_menu" style="color: #9bbfd9;">회원 조회</a></li>
        <li><a href="#" class="main_menu">펀딩 관리</a></li>
        <li><a href="<%=request.getContextPath() %>/admin/approval/list" class="sub_menu">승인 요청목록</a></li>
        <li><a href="<%=request.getContextPath() %>/admin/report/list" class="sub_menu">신고 상품목록</a></li>
        <li><a href="<%=request.getContextPath()%>/admin/sales/list" class="sub_menu">펀딩매출관리</a></li>
        <li><a href="#" class="main_menu">고객 센터</a></li>
        <li><a href="<%=request.getContextPath()%>/notice/admin" class="sub_menu">공지사항</a></li>
        <li><a href="<%= request.getContextPath()%>/admin/ask" class="sub_menu">1:1문의</a></li>
      </ul>
    </div>   
    
    <div id="main_body">     
        <div id="main_content">
        	<div id="title_wrap">
        		<p id="title">회원 관리</p>
        		<div id="title_content">
        			<p id="sub_title">
        				전체 회원 &nbsp;${totalCnt}명    				        				
        			</p>
         			
        			<form id="related_search_frm">        				
        				<input type="text" name="related_search" id="related_search" value="${related_search}" placeholder="이름/이메일/닉네임을 입력하세요.">     				
        				<span>
        					<button id="search_btn" onclick="memberSearchHandler()">조회</button>
        				</span>        			
        			</form>
        			<div id="withdraw_btn_wrap">
       					<button id="withdraw_btn" onclick="memberWithDrawHandler()">탈퇴</button>
       				</div> 

        		</div>
        	</div>
        	
        	<div id="member_content">
        		<form id="memberListFrm">
        			<table id="member_list">
	        			<thead>
	        				<tr>
        						<th width="50"></th>
	          					<th width="150">가입일자</th>          
          						<th width="80">이름</th>
          						<th width="170">이메일</th>
          						<th width="130">닉네임</th>
          						<th width="150">탈퇴상태</th>
        					</tr>
        				</thead>	
        				<tbody>
<c:forEach items="${memberList }" var="member">		        					
        					<tr>
	        					<td><input type="checkbox" name="chk_box" value="${member.email }"></td>
        						<td>${member.enroll_date }</td>
        						<td>${member.name }</td>
        						<td>${member.email }</td>	
        						<td>${member.nickname}</td>
        						<td>${member.withdraw}</td>
        					</tr>
</c:forEach>        					
        				</tbody>
        			</table> 
        		</form>       		
        		
       			<p id="prev_next">    	
<c:if test="${ startPage > 1 }">
					<button onclick="location.href='<%=request.getContextPath()%>/admin/memberManagement?related_search=${related_search}&page=${ startPage-1}';" style="width:50px; height: 30px;">이전</button>
</c:if>
<c:forEach begin="${startPage }" end="${endPage }" var="p">
					<button id="page_btn${p}" value="${p}" onclick="location.href='<%=request.getContextPath()%>/admin/memberManagement?related_search=${related_search}&page=${ p}';">${ p }</button>				
</c:forEach>
<c:if test="${endPage < totalPageCnt }">
					<button onclick="location.href='<%=request.getContextPath()%>/admin/memberManagement?related_search=${related_search}&page=${ endPage+1}';" style="width:50px; height: 30px;">다음</button>				
</c:if>
     			</p>
        	</div>
        </div>
    </div>           
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
    
    function memberWithDrawHandler() {
    	var cnf = confirm("해당 회원을 탈퇴상태로 변경하겠습니까?"); 
    	if(cnf) {
    		$("#memberListFrm").prop("action", "memberWithdraw");
    		$("#memberListFrm").prop("method", "post");
    		memberListFrm.submit();
    	} else { }
    }    
    function memberSearchHandler() {   
    	$("#related_search_frm").prop("action", "memberManagement");
    	related_search_frm.submit();
    } 
    
  </script>
</body>
</html>