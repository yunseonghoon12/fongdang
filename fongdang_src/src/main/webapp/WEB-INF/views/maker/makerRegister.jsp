<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/reset.css">  
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/makerRegister.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/font.css">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메이커 정보</title>
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
         <li><a href="#"> 메이커 정보 </a></li>
        <li><a href="#"> 펀딩 상품</a></li>
        <li><a href="#"> 펀딩 옵션</a></li>
        <li><a href="#"> 오픈예정 현황</a></li>
        <li><a href="#"> 펀딩 현황</a></li>
        <!-- <li><a href="#"> 결제 현황</a></li> -->
        <li><a href="#"> 정산관리</a></li>

    </ul>
</nav>
<section>    
    <div id="maker_all">
      
        <form action="<%=request.getContextPath()%>/maker/makerRegister" method="post" enctype="multipart/form-data">
            <!-- <div>
                <p id="maker_title"> 메이커 정보 </p>
            </div> -->
            <table id="maker_Table">
                <tr>
                    <td id="title"><b>메이커 정보</b></td>
                    <td ></td>
                    <td></td>
                </tr>
                <tr>
                    <td id="title">메이커(기업)명<sup>*</sup></td>
                    <td><input type="text" name="maker_name" class="in_box" placeholder="법인사업자: 법인명 / 개인사업자: 상호" ></td>
                    <td></td>
                </tr>
                <tr>
                    <td id="title">사업자구분<sup>*</sup></td>
                    <td >
                        <select name="maker_category"  class="in_box" >
                        <option value="I">개인사업자</option>
                        <option value="B">법인사업자</option>
                        </select></td>
                    <td></td>
                </tr>
                <tr>
                    <td id="title">문의전화번호<sup>*</sup></td>
                    <td ><input type="text" name="maker_phone" id="maker_phone"  class="in_box"  placeholder="전화번호 입력"></td>
                    <td></td>
                </tr>
                <tr>
                    <td id="title">문의 이메일<sup>*</sup></td>
                    <td><input type="email" name="maker_email" id="maker_email" placeholder=" 이메일 입력"  class="in_box" >
                        <font id="checkmEmail_info" size="2"></font></td>
                    <td></td> 
                </tr>
                <tr>
                    <td id="title">주소(사업장 주소)<sup>*</sup></td>
                    <td>
                        <input type="text" name="maker_address1" id="maker_address1"  class="in_box" ><br>
                        <input type="text"  name="maker_address2" id="maker_address2" placeholder="상세주소 입력해 주세요"  class="in_box">
                    </td>
                    <td><input type="button" class="btn1" value="주소검색" class="in_box" id="postcode_button" onclick="open_Postcode()"></td>
                </tr>
                <tr>
                    <td id="title">사업자등록번호<sup>*</sup></td>
                    <td ><input type="text" name="maker_register_num"  class="in_box"></td>
                    <td></td>
                </tr>
                <tr>
                    <td id="title">사업자등록증 사본<sup>*</sup></td>
                    <td ><input type="file" name="maker_license_copy_file"  ></td>
                    <td></td>
                </tr>
                <tr>
                    <td id="title">메이커 프로필 이미지<sup>*</sup></td>
                    <td ><input type="file" name="maker_logo_file"  ></td>
                    <td></td>
                </tr>
                <tr>
                    <td id="title">홈페이지 (선택사항)</td>
                    <td><input type="text" name="maker_homepage" class="in_box" placeholder=" 홈페이지URL 입력"></td>
                    <td></td>
                </tr>
                <tr>
                    <td id="title">카카오채널 (선택사항)</td>
                    <td><input type="text" name="maker_kakao_channel"  class="in_box"  placeholder="검색용 아이디 입력"></td>
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
<footer>
    <P>푸터   아직 모르겠음 </P>
</footer> 

</body>
</html>