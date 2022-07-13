<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/reset.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/font.css">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sales</title>
<script src="https://code.jquery.com/jquery-3.6.0.js" ></script> 
	<style>
    /* header */
    #admin_navigator {
      border-bottom: 1px solid #ccc;      
      box-sizing: border-box;      
      height: 130px;
      color: #444c57;           
      padding-top: 20px;      
    }
    #admin_navigationbar {      
      position: relative;
      width: 1280px;      
      height: 100px;
      margin: 0 auto;
    }
    #logo_wrap {
      position: absolute;
      top: 0;      
      width: 100px;      
    }
    #logo {   
      width: 95px;
      height: 65px;
    }
    #admin_header_title {
      position: absolute;
      top: 30%;
      left: 150px;
      font-family: SUIT-SemiBold;
      font-size: 28px;
    }
  </style>  
  <style>
    /* main section */
    a {
      text-decoration: none;
    }
    #container {
      display: flex;
      flex-flow: row wrap;
      margin: 0 auto;
      width: 1200px;
      height: 800px;
    }    
    #admin_nav {
      /* float: left; */
      width: 20%;
      height: 100%;
    }
    #admin_nav ul { 
      border-right: 1px solid #ccc;
      width: 180px;     
      height: 600px; 
      padding-top: 50px;          
    }
    #admin_nav li { 	
    	 margin: 25px;
    }
    #admin_nav li a {
      color: #444c57;
    }   
    .main_menu {      
      font-family: SUIT-SemiBold;
      font-size: 20px;
      font-weight: bold;      
    }
    .sub_menu {
      padding-left: 30px;
      font-family: SUIT-Regular;
      font-size: 14px;
    }
    #main_body {
      /* float: right; */
      width: 80%;
      height: 100%;
    }     
  </style>
 <style type="text/css">
 section{
 padding: 10px;
 font-family: SUIT-Regular;
}
 #sales_Table table{
    width: 100%;
    width: 1000px;
	border-top: 1px solid #444444;
	border-collapse: collapse;
	text-align: center;
	font-family: SUIT-Regular;
  }

  .sales-title{
  font-size: 20px;
  padding: 30px 30px;
  font-family: SUIT-Regular;
  }
  
 .sales_Table{
  padding: 10px;
  }
  #title{
 padding:15px;
 font-family: SUIT-Regular;
  }     
  
  </style> 
  
</head>
<body>
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
      <!-- <a>태그 href에 각 기능별로 이동할 url 작성 -->
      <ul>
        <li><a href="#">회원 관리</a></li>
        <li><a href="#" class="sub_menu">회원 조회</a></li>
        <li><a href="#" class="main_menu">펀딩 관리</a></li>
        <li><a href="#" class="sub_menu">승인 요청목록</a></li>
        <li><a href="#" class="sub_menu">펀딩 일정 관리</a></li>
        <li><a href="#" class="sub_menu">신고 상품</a></li>
        <li><a href="<%=request.getContextPath()%>/admin/sales/list"" class="sub_menu">펀딩매출관리</a></li>
        <li><a href="#" class="main_menu">고객 센터</a></li>
        <li><a href="#" class="sub_menu">공지사항</a></li>
        <li><a href="#" class="sub_menu">1:1문의</a></li>
      </ul>
    </div>   
    
    <div id="main_body">
            <section>
	                <div id="sales">
	               	   <p class="sales-title">펀딩매출관리 상세페이지</p>
			                 <div class="sales-tableAll">
			                     <table id="sales_Table">
						                <tr>
						                    <td id="title">상품번호 : </td>
						                    <td > ${sales.p_no}</td>
						                </tr>
						                 <tr>
						                    <td id="title">메이커명 : </td>
						                    <td >${sales.maker_name}</td>
						                </tr>
						                 <tr>
						                    <td id="title">카테고리 : </td>
						                    <td >${sales.category_id}</td>
						                </tr>
						                <tr>
						                    <td id="title">상품명 : </td>
						                    <td >${sales.p_name}</td>
						                </tr>
						                <tr>
						                    <td id="title">펀딩예정일 : </td>
						                    <td >${sales.start_day}</td>
						                </tr>
						                 <tr>
						                    <td id="title">펀딩마감일 : </td>
						                    <td >${sales.end_day}</td>
						                </tr>
						                 <tr>
						                    <td id="title">목표금액 : </td>
						                    <td >${sales.p_goal}</td>
						                </tr>
						                <tr>
						                    <td id="title">달성율 : </td>
						                    <td >${sales.p_goal_percent}</td>
						                </tr>
						                <tr>
						                    <td id="title">총 펀딩금액 : </td>
						                    <td >${sales.total_funding_money}</td>
						                </tr>
						                 <tr>
						                    <td id="title">수수료 : </td>
						                    <td >${sales.commission}</td>
						                </tr>
						                 <tr>
						                    <td id="title">정산금액 : </td>
						                    <td >${sales.sales_funding_money}</td>
						                </tr>
					              </table>
								
			                 </div>
	                    </div>
	              </section>

         </div>           
   </div>  
  <!-- 임시 footer -->
  <!-- <footer style="background-color: #ccc; color: blue; font-size:28px; text-align:center; height: 200px;">푸터 영역</footer> --> 
  <jsp:include page="../footer.jsp"/>
  <script>
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
  });
   
  </script>


             

           

</body>
</html>