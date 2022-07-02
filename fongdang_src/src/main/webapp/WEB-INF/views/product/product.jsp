<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/reset.css">  
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/makerRegister.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/font.css">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PRODCUT</title>
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
        <form action="<%=request.getContextPath()%>/product/product.pag" method="post" enctype="multipart/form-data">
            <!-- <div>
                <p id="maker_title"> 펀딩상품등록 </p>
            </div> -->
            <table id="maker_Table">
                <tr>
                    <td id="title"><b>펀딩상품등록</b></td>
                    <td ></td>
                    <td></td>
                </tr>
                <tr>
                    <td id="title">프로젝트 제목<sup>*</sup></td>
                    <td><input type="text" name="p_name" class="in_box" placeholder="프로젝트 제목입력" ></td>
                    <td></td>
                </tr>
                <tr>
                    <td id="title">목표금액<sup>*</sup></td>
                    <td ><input type="text" name="p_goal" id="p_goal"  class="in_box"  placeholder="전화번호 입력"></td>
                    <td></td>
                </tr>
                <tr>
                    <td id="title">카테고리<sup>*</sup></td>
                    <td >
                        <select name="category_id"  class="in_box" >
                        <option value="C1">반려동물</option>
                        <option value="C2">캠핑</option>
						<option value="C3">식품</option>
				        <option value="C4">테크 ⠂가전</option>
				        <option value="C5">뷰티</option>
				        <option value="C6">기타</option>
                        </select></td>
                    <td></td>
                </tr>
                  <tr>
                    <td id="title">기간설정<sup>*</sup></td>
                    <td></td>
                    <td></td> 
                </tr>
                 <tr>
                    <td id="title">펀딩시작일<sup>*</sup></td>
                    <td><input type="text" name="start_day" class="in_box" ></td>
                    <td></td> 
                </tr>
                <tr>
                    <td id="title">펀딩종료일<sup>*</sup></td>
                    <td><input type="text" name="end_day" class="in_box" ></td>
                    <td></td> 
                </tr>
                 <tr>
                    <td id="title">결제예정일<sup>*</sup></td>
                    <td><input type="text" name="payment_plan" class="in_box" ></td>
                    <td></td> 
                </tr>
                   <tr>
                    <td id="title">발송예정일<sup>*</sup></td>
                    <td><input type="text" name="delivery_date" class="in_box" ></td>
                    <td></td> 
                </tr>
                <tr>
                    <td id="title">상품요약<sup>*</sup></td>
                    <td><input type="text" name="p_summary" id=""  class="in_box"></td>
                    <td></td>
                </tr>
                  <tr>
                    <td id="title">상품 상세정보<sup>*</sup></td>
                    <td ><input type="text" name="p_story"  class="in_box" ></td>
                    <td></td>
                </tr>
                <tr>
                    <td id="title">상품 대표이미지<sup>*</sup></td>
                    <td ><input type="file" name="p_thumbnail"  ></td>
                    <td></td>
                </tr>
              
                <tr>
                    <td id="title">상품관련 인증증명서</td>
                    <td><input type="file" name="p_certification"></td>
                    <td></td>
                </tr>
                <tr>
                    <td id="title"> 정책사항</td>
                    <td>설명 설명 - 모달창으로 진행 ? 여부 </td>
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