<link rel="shortcut icon" type="image/x-icon" href="<%=request.getContextPath()%>/resources/images/investor.ico"/>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/font.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/reset.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/header.css">
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
<jsp:include page="../header.jsp"/>
<div id="section_page">  
	<nav id="nav_funding"  >
	    <div style="border-right: 1px solid #ccc; height:100%">
		    <div id="nav_fundingmeber">
		
		         <p id="member_name">${loginInfo.name} 님</p> 
		     </div>
		     <ul>
		        <li><a href="<%=request.getContextPath()%>/maker/Register"> 메이커 정보 </a></li>
		        <li><a href="<%= request.getContextPath()%>/product/product.pag"> 펀딩 상품</a></li>
		        <li><a href="<%= request.getContextPath()%>/option/option.pag"> 펀딩 옵션</a></li>
		        <li><a href="#"> 오픈예정 현황</a></li>
		        <li><a href="#"> 펀딩 현황</a></li>
		        <!-- <li><a href="#"> 결제 현황</a></li> -->
		        <li><a href="#"> 정산관리</a></li>
		      </ul>
	      </div>
	  </nav>
<section id="maker"> 
  <div id="maker_all">
        <form action="<%=request.getContextPath()%>/option/option.pag" method="post" enctype="multipart/form-data">
            <!-- <div>
                <p id="maker_title"> 펀딩상품등록 </p>
            </div> -->
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
                    <td ><input type="text" name="option_name"  class="in_box"  placeholder=""></td>
                    <td></td>
                </tr>
                <tr>
                    <td id="title">옵션가격<sup>*</sup></td>
                    <td><input type="text" name="option_price" class="in_box" placeholder="" ></td>
                    <td></td>
                </tr>
                <tr>
                    <td id="title">옵션 정보<sup>*</sup></td>
                    <td><input type="text" name="option_info" class="in_box" placeholder="" ></td>
                    <td></td>
                </tr>
 
                 <tr>
                    <td id="title">제한수량<sup>*</sup></td>
                    <td><input type="text" name="option_limit" class="in_box" ></td>
                    <td></td> 
                </tr>
                <tr>
                    <td></td>
                    <td><button type="submit" class="btn2" value="저장하기" >저장하기</button></td>
                    <td></td>
                </tr>
            </table>
        </form>
     </div>
 </section>
</div>

</body>
</html>