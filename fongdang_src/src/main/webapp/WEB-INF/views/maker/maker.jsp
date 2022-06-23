<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/reset.css">  
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메이커등록</title>
</head>
<body>
<form action="<%=request.getContextPath()%>/maker/insert" method="post" enctype="multipart/form-data">
    <div>
        <h2 id="maker_title"> 메이커등록 </h2>
        </div>
    <table id="maker_Table">
        <tr>
            <td id="title">메이커(기업)명<a id="essential">*</a></td>
            <td id="Contents"><input type="text" name="maker_name" ></td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td id="title">사업자구분<a id="essential">*</a></td>
            <td id="Contents">
                <select name="maker_category" >
                <option value="개인">개인</option>
				<option value="사업자">사업자</option>
                </select></td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td id="title">프로필이미지(로고)<a id="essential">*</a></td>
            <td id="Contents"><input type="file" name="maker_logo_file"></td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td id="title">주소(사업장 주소)<a id="essential">*</a></td>
            <td id="Contents">
                <input type="text" name="maker_address1" id="maker_address1" /> 
				<input type="button" value="주소검색" id="postcode_button" onclick="open_Postcode()"><br> 
                <input type="text"  name="maker_address2" id="maker_address2" placeholder="상세주소 입력해 주세요"/></td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td id="title">문의전화번호<a id="essential">*</a></td>
            <td id="Contents"><input type="text" name="maker_phone" id="maker_phone" ></td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td id="title">계좌번호<a id="essential">*</a></td>
            <td id="Contents"><select >
                <option value="KB국민은행">KB국민은행</option>
				<option value="우리은행">우리은행</option>
                <option value="신한은행">신한은행</option>
                <option value="KEB하나은행">KEB하나은행</option>
                <option value="SC제일은행">SC제일은행</option>
                <option value="한국씨티은행">한국씨티은행</option>
                <option value="농협">농협</option>
                <option value="기업은행">기업은행</option>
                <option value="카카오뱅크">카카오뱅크</option>
                <option value="새마을금고">새마을금고</option>
                <option value="경남은행">경남은행</option>
                <option value="광주은행">광주은행</option>
                <option value="부산은행">부산은행</option>
                <option value="수협은행">수협은행</option>
            </select> <input type="text" name="maker_account"></td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td id="title">은행계좌(사본)<a id="essential">*</a></td>
            <td id="Contents"><input type="file" name="maker_bankbook_copy_file"></td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td id="title">사업자등록번호(주민번호)<a id="essential">*</a></td>
            <td id="Contents"><input type="text" name="maker_register_num"></td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td id="title">등록증(사본)<a id="essential">*</a></td>
            <td id="Contents"><input type="file" name="maker_license_copy_file"></td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td id="title">정산서 받을 이메일<a id="essential">*</a></td>
            <td id="Contents"><input type="email" name="maker_email" id="maker_email" placeholder="ex)abc@naver.com" ><font id="checkmEmail_info" size="2"></font></td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td id="title">홈페이지(선택사항)</td>
            <td id="Contents"><input type="text" name="maker_homepage"></td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td id="title">카카오채널(선택사항)</td>
            <td id="Contents"><input type="text" name="maker_kakao_channel"></td>
            <td></td>
            <td></td>
        </tr>
    </table>
    <div>
        <button type="submit"  value="등록하기">등록</button>
    
    </div>
</form>

</body>
</html>