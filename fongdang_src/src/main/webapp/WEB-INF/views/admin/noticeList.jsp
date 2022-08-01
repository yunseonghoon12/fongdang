<link rel="shortcut icon" type="image/x-icon" href="<%=request.getContextPath()%>/resources/images/investor.ico"/>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/font.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/reset.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/salesList.css">


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 - 공지 사항</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="http://botmonster.com/jquery-bootpag/jquery.bootpag.js"></script>
<link rel="stylesheet"
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">

<style>
.container{
text-align: center;
width:100%;
height:1150px;
margin-bottom:130px;
}
h1{
	font-size:40px;
	margin-top:60px;
	color:#729bac;
}
.wrap{
margin-top:10px;
display:inline-block;
width:800px;
text-align: center;
}
.title_wrap{
display:inline-block;
width:800px;
height:120px;
text-align: left;

border-bottom:3px solid rgb(200,200,200);
}
.listWrap{

width:700px;
display:inline-block;
position:relative;
border-radius: 5px;


}
#writed{
width:100%;
height:200px;
border:1px solid rgb(212,212,212);
border-radius: 5px;
margin-bottom:30px;
position:relative;
display:block;
}
#titled{
	width:100%;
	height:50px;
	text-align:left;
	padding-left:20px;
	padding-top:12px;
	padding-bottom:20px;
	font-weight:400;
	background-color:#accde4;
	font-size:18px;
	
}
#content{
text-align:left;
paddin-top:10px;
padding-left:20px;
margin-top:20px;
display: inline-blick;
color:rgb(110,110,110);
height:150px;
width:700px;
}
#writer{
text-align:right;
padding-right:20px;
padding-top:13px;
position:absolute;
color:rgb(110,110,110);
height:50px;
right:20px;
bottom:20px;

}
#date{
text-align:right;
padding-right:20px;
padding-top:13px;
position:absolute;
color:rgb(110,110,110);
height:50px;
right:100px;
bottom:20px;

}
#del{
text-align:center;
position:absolute;
color:rgb(110,110,110);
height:25px;
width:40px;
font-size:13px;
right:20px;
top:13px;

}
#insert:hover{
background:#9bbfd9;
}
</style>

</head>
<body>
	<div id="admin_navigator">
		<div id="admin_navigationbar">
			<div id="logo_wrap">
				<!-- TODO: 퐁당 메인 페이지 URL 작성하기 -->
				<a href="<%=request.getContextPath()%>/"> <img
					src="<%=request.getContextPath()%>/resources/images/logo.png"
					id="logo">
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
			<!-- <a>태그 href에 각 기능별로 이동할 url 작성 -->
	<ul>
        <li><a href="<%= request.getContextPath()%>/admin/memberManagement" class="main_menu">회원 관리</a></li>
        <li><a href="<%= request.getContextPath()%>/admin/memberManagement" class="sub_menu">회원 조회</a></li>
        <li><a href="#" class="main_menu">펀딩 관리</a></li>
        <li><a href="<%=request.getContextPath() %>/admin/approval/list" class="sub_menu">승인 요청목록</a></li>
        <li><a href="<%=request.getContextPath() %>/admin/report/list" class="sub_menu">신고 상품목록</a></li>
        <li><a href="<%=request.getContextPath()%>/admin/sales/list" class="sub_menu" >펀딩 매출관리</a></li>
        <li><a href="#" class="main_menu">고객 센터</a></li>
        <li><a href="<%=request.getContextPath()%>/notice/admin" class="sub_menu" style="color:#9bbfd9">공지사항</a></li>
        <li><a href="<%= request.getContextPath()%>/admin/ask" class="sub_menu">1:1문의</a></li>
      </ul>
		</div>
		
			<div id="main_body">
				<section>
					<div id="salesList">
						<p id="title">공지 사항</p>
						<div class="salesList-tableAll">
							<button type="button" id="insert" style="float:right;margin-right:30px;border:1px solid #accde4;border-radius:5px;width:60px;height:30px;background:#accde4;color:white" onclick="location.href='<%= request.getContextPath()%>/notice/admin/write'">글쓰기</button>
							<div class="listWrap">
									<c:forEach items="${noticeList}" var="noticeList">
									
										<dl id="writed">
											<dt id="titled">${noticeList.n_title}<button type="button" id="del" onclick="deleteNotice()">삭제</button></dt>
											<dd id="content">${noticeList.n_content}</dd>
											<dd id="writer">${noticeList.n_writer}</dd>
											<dd id="date">${noticeList.n_date}</dd>
											<input type="hidden" value="${noticeList.n_no}" name="n_no">
										</dl>
								</c:forEach>
							</div>
							
								<p style="margin-top:50px; margin-bottom:50px;">
								<c:if test="${    startPage    >    1    }">
								<a href="<%=request.getContextPath()%>/notice/admin?page=${startPage-1}">이전</a>&nbsp;&nbsp;&nbsp;&nbsp;
								</c:if>
								<c:forEach begin="${startPage}" end="${endPage}" var="p">
									<a href="<%=request.getContextPath()%>/notice/admin?page=${p }">${p }</a>&nbsp;&nbsp;&nbsp;&nbsp;
								</c:forEach>
								<c:if test="${endPage < totalPageCnt}">
								<a href="<%=request.getContextPath()%>/notice/admin?page=${endPage+1}">다음</a>
								</c:if>
							</p>
						</div>
					</div>
				</section>
			</div>
		
	</div>
	<!-- 임시 footer -->
	<!-- <footer style="background-color: #ccc; color: blue; font-size:28px; text-align:center; height: 200px;">푸터 영역</footer> -->
	<script type="text/javascript">
	  $( document ).ready(function() {
		  $("#admin_nav ul li a").click(function() {
		    	console.log("click()");
		        var before_color = '#444c57';
		        var after_color = '#9bbfd9';  
	
		        // 클릭한 이벤트 객체의 폰트색 변경
		        $(this).css('color', after_color);      
		        // 클릭하지 않은 다른 객체들의 폰트색 변경
		        $("#admin_nav > ul> li > a").not(this).css('color', before_color);
		    });
		  console.log(salesList);
	  });
  
	  
	  function deleteNotice(){
			const data={
					n_no : $("input[name='n_no']").val()
					
			}
			$.ajax({
		        type: "GET",
		        url: "<%=request.getContextPath()%>/notice/admin/delete/"+data.n_no,
		        data: data,
		        success: function (result) {
		            console.log(result);
		            if(result == 0){
		            	alert("로그인을 한 후 이용이 가능합니다. 로그인 페이지로 이동합니다.");
						location.href = "<%=request.getContextPath()%>/member/login";
		            }else if(result == -1){
		            alert("연결 실패")
		            }else if(result == 1){
		            	alert("공지사항을 삭제합니다.");
		            	location.href("<%=request.getContextPath()%>/notice/admin");
		            }
		        },
					error : function (result) {
						alert("에러 발생.");
						console.log(result);
					
				}
			});
			
		};
	
  	</script>

</body>
</html>
