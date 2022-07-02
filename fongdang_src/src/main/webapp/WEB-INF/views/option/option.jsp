<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/reset.css">  
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/makerRegister.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/font.css">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>option</title>
</head>
<body>
<header>
    <div id="header_funding">
        <div id="logo_inclusion">
            <a href="">
             <img src="<%= request.getContextPath()%>/resources/images/logo.png" alt="logo" id="logo">
            </a>
        </div>
        <div id="funding_center_title">
           <p>펀딩 프로젝트</p>
        </div>
        <div id="header_right_txt">
            <ul id="right_bar">
                <li><a  href="#">나가기</a></li>
            </ul>
        </div>
    </div>
</header>   
<nav id="nav_funding" >
    <div id="nav_fundingname">
         <p >펀딩 준비 작성 중</p>
         <p >펀딩 완료 </p>
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
</nav>
<section>
  <div id="maker_all">
        <form action="<%=request.getContextPath()%>/option/option.pag" method="post" enctype="multipart/form-data">
            <!-- <div>
                <p id="maker_title"> 펀딩상품등록 </p>
            </div> -->
            <table id="maker_Table">
                <tr>
                    <td id="title"><b>옵션등록</b></td>
                    <td >최대 5개까지 설정가능합니다.</td>
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
                
            </table>
            <hr>
            <div id="maker_in_bnt">
                <button type="submit" class="btn2" value="저장하기" >저장하기</button>
            </div>
        </form>
     </div>
 </section>


</body>
</html>