<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/reset.css">
<link rel="shortcut icon" type="image/x-icon" href="<%=request.getContextPath()%>/resources/images/investor.ico">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/font.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/messagebox.css">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>퐁당- 메시지</title>
<script src="https://code.jquery.com/jquery-3.6.0.js" ></script>
</head>
<body>
  <jsp:include page="../header.jsp"/>
  <div id="container">  	
    <div id="main_content">
      <div id=title_content>
      	<div id="title_wrap">
        	<p id="title">메시지</p>
        	<p id="caption">메시지는 실시간 채팅이 아닙니다. 주기적으로 페이지를 새로고침하세요.</p>
        	<div id="btn_wrap"> 
        		<form action="messagebox" id="msgFrm">
        			<input type="hidden" name="message_type" id="message_type" value="${message_type }">
        		</form>       		
        		<button type="button" id="send" class="message_btn">보낸 메시지</button>
				<button type="button" id="receive" class="message_btn">받은 메시지</button>
        	</div> 
      	</div>
      </div>
      <div id="message_content">
<c:if test="${!empty messageList }">
      <table id="message_list">
        <thead>
        <tr>
          <th width="120">보낸 사람</th>          
          <th width="120">답변 여부</th>
          <th width="550">쪽지 내용</th>
          <th width="150">작성일</th>
        </tr>  
        </thead>
        <tbody>
      
	<c:forEach items="${messageList}" var="message">
			<tr>
          		<td>    
        			${message.sender}        	
          		</td>
          		<td>
    	<c:if test="${message.response_chk eq 'Y'}">
    				답변 완료
    	</c:if>
    	<c:if test="${message.response_chk eq 'N'}">
    				답변 예정
    	</c:if>
          		</td>
          		<td>
            		<div class="message_content">
              			상품 관련 문의입니다.
              			<input type="hidden" name="m_no" value="${message.m_no}">
            		</div>
          		</td>
          		<td>${message.m_date}</td>          
        	</tr>
	</c:forEach>  
			        
      </tbody>         
      </table>
      
      
</c:if>
<c:if test="${empty messageList}">
		<div id="empty_content_wrap">
			<div id="icon_wrap">
				<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" id="chat-left" class="bi bi-chat-left" viewBox="0 0 16 16">
  					<path d="M14 1a1 1 0 0 1 1 1v8a1 1 0 0 1-1 1H4.414A2 2 0 0 0 3 11.586l-2 2V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12.793a.5.5 0 0 0 .854.353l2.853-2.853A1 1 0 0 1 4.414 12H14a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
				</svg>
			</div>
			<p id="empty_content">
				메시지가 없습니다.
			</p>		
		</div>
</c:if>

    	 <p id="prev_next">    	
<c:if test="${ startPage > 1 }">
			<button onclick="location.href='<%=request.getContextPath()%>/member/messagebox?message_type=${message_type}&page=${ startPage-1}';" style="width:50px; height: 30px;">이전</button>
</c:if>
<c:forEach begin="${startPage }" end="${endPage }" var="p">
			<button id="page_btn${p}" value="${p}" onclick="location.href='<%=request.getContextPath()%>/member/messagebox?message_type=${message_type}&page=${p}';">${ p }</button>				
</c:forEach>
<c:if test="${endPage < totalPageCnt }">
			<button onclick="location.href='<%=request.getContextPath()%>/member/messagebox?message_type=${message_type}&page=${ endPage+1}';" style="width:50px; height: 30px;">다음</button>				
</c:if>
     	</p>  
      </div>
    </div>    
  </div>
  <jsp:include page="../footer.jsp"/>
  
  <script>
  	var message_type = $("#message_type").val();  	
  	/* console.log("message_type:  " + message_type); */
  	
  	if(message_type == 'send') {
  		$("#send").css({
  			"color" : "#9bbfd9"
  		});
  		$("#receive").css({
  			"color" : "#444c57"
  		});  		
  	} 
  	if(message_type == 'receive') {
  		$("#send").css({
  			"color" : "#444c57"
  		});
  		$("#receive").css({
  			"color" : "#9bbfd9"
  		}); 
  	}  	
  
 	// 페이징 처리시 css 설정
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
    
    $(".message_content").click(function() {
       	var option= "width=500, height=550";
       	var m_no = $(this).children().val();
       	var url = "<%=request.getContextPath()%>/member/messagebox/msg?m_no=";
       	url += m_no;
      	
        window.open(url, "popup", option);
	});
    
    $("#send").click(function() {   
    	$("#message_type").val("send");
    	console.log($("#message_type").val());
    	msgFrm.submit()
    });
    $("#receive").click(function() {    	
    	$("#message_type").val("receive");
    	console.log($("#message_type").val());
    	msgFrm.submit();
    });
  </script>
</body>
</html>