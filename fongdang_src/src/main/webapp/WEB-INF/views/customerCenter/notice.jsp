<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/reset.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/font.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/header.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js" ></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
padding-top:50px;
width:700px;
display:inline-block;
position:relative;
border-radius: 5px;


}
#writed{
width:100%;
height:270px;
border:1px solid #accde4;
border-radius: 5px;
margin-bottom:30px;
position:relative;
display:block;
}
#title{
background-color:#accde4;
	width:100%;
	height:50px;
	text-align:left;
	padding-left:20px;
	padding-top:17px;
	padding-bottom:20px;
	font-weight:800;
	
	font-size:18px;
	border-bottom: 1px solid #accde4;
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
border-top:1px solid #accde4;
color:rgb(110,110,110);
height:50px;
right:20px;
bottom:20px;

}
#writedate{
float:right;
margin-right:80px;
margin-bottom:10px;
display: inline-blick;

}
</style>
</head>
<body>
<jsp:include page="../header.jsp" />
<div class="container">
	<div class="wrap">
		<div class="title_wrap">
			<h1>공지사항</h1>
		</div>
		
		<div class="listWrap">
			<c:forEach items="${noticeList}" var="noticeList">
			
				<dl id="writed">
					<dt id="title">${noticeList.n_title}</dt>
					<dd id="content">${noticeList.n_content}</dd>
					<dd id="writer">${noticeList.n_writer}</dd>
					<input type="hidden" value="${noticeList.n_no}" name="n_no">
				</dl>
		
		
		
			
		</c:forEach>
	</div>
	</div>
		<p style="margin-top:50px; margin-bottom:50px;">
			<c:if test="${    startPage    >    1    }">
			<a href="<%=request.getContextPath()%>/notice/insertList/${startPage-1}">이전</a>&nbsp;&nbsp;&nbsp;&nbsp;
			</c:if>
			<c:forEach begin="${startPage}" end="${endPage}" var="p">
				<a href="<%=request.getContextPath()%>/notice/insertList/${p }">${p }</a>&nbsp;&nbsp;&nbsp;&nbsp;
			</c:forEach>
			<c:if test="${endPage < totalPageCnt}">
			<a href="<%=request.getContextPath()%>/notice/insertList/${endPage+1}">다음</a>
			</c:if>
		</p>
</div>
<div style="margin-top: 65px;">
	<jsp:include page="../footer.jsp" />
</div>
</body>
<script>
function deleteNotice(){
	const data={
			n_no : $("input[name='n_no']").val()
			
	}
	$.ajax({
        type: "GET",
        url: "<%=request.getContextPath()%>/notice/delete",
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
            	location.href("<%=request.getContextPath()%>/notice/insertList/1");
            }
        },
			error : function (result) {
				alert("에러 발생.");
				console.log(result);
		}
	});
	
};
</script>
</html>