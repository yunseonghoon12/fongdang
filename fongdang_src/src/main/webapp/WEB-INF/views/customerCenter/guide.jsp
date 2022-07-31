<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/reset.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/font.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/header.css">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.title{
	text-align:center;
	position:relative;
}
h1{
	font-size:40px;
	margin-top:80px;

}
h3{
font-size:22px;
margin:30px;
}
.container{
width:100%;
height:100%;
display:inline-block;
text-align:center;
}
.wrap{
margin-top:70px;
display:inline-block;
width:900px;
position:relative;

}
.senetence{
padding-top:50px;
padding-bottom:50px;
border-top: 1px solid rgb(220,220,220);
text-align:left;
position:relative;
}
.senetence>h2{
font-size:35px;
color:gray;
float:left;
}
.senetence>p{
display:inline-block;

}
</style>
</head>
<body>
<jsp:include page="../header.jsp" />
<div class="container">
<h1>리워드/펀딩이란?</h1>
	<div class="wrap">
		<div class="title">
			<div class="senetence">
				<h2>크라우드 펀딩</h2><br><br><br><br>
				<br><p>크라우드펀딩(CROWDFUNDING) 이라는 단어는 영어의 의미대로 말하자면, 대중(CROWD)에게 자금을 모은다(FUNDING)는 의미입니다.</p><br>
				<p  style="margin-top:5px">이러한 크라우드펀딩은 전세계적으로 온라인상에서 많은 대중들이 모여 십시일반으로 기부, 후원, 또는 투자 등 다양한 형태로 발전되어 왔습니다.</p>
			</div>	
		</div>
		<div class="title">
			<div class="senetence">
				<h2>리워드형 크라우드 펀딩</h2><br><br><br><br>
				<br><p style="margin-top:5px">리워드형 크라우드펀딩은 아이디어나 제품이 있는
					사람이 대중의 펀딩을 통해 자금을 모집하거나 수익을
					내는 크라우드 펀딩입니다.</p><p><br>수익금으로 시제품(서비스)
					단계의 제품을 발전시켜 리워드로 제공하는 형태부터,</p><p  style="margin-top:5px">
					수익금의 전액 또는 일부를 기부하는 형태까지 다양한
					형태의 크라우드펀딩이 이에 포함됩니다.
					</p><br>
					<p  style="margin-top:7px">제작자들은 자신의 아이디어를 세상에 소개하고 실현화
					시켜보는 경험을 할 수 있고,</p><p  style="margin-top:7px"> 후원자들은 세상에 없던 참신한
					제품 또는 세상을 따뜻하게 만드는 다양하고 새로운
					프로젝트에 동참할 수 있습니다. 또한 <p  style="margin-top:7px">크라우드펀딩은 누구나
					참여, 소통이 가능하기에 차별없이 참여하며 자신이 펀딩하는
					프로젝트에 대해 언제든지 물어보고 응원할 수 있습니다.</p><p  style="margin-top:7px">
					제작자 또한 자신이 제작하는 프로젝트에 대해 개방적으로
					소통 하기에 타 온라인 플랫폼보다 참여자간의 거리가
					가깝습니다. </p><p  style="margin-top:7px">이를 통해 제작자와 후원자 모두 함께 꿈꾸는
					세상을 만드는데 한걸음 다가갈 수 있습니다.
					</p>
			</div>	
		</div>
		<div class="title">
			<div class="senetence">
			<h2>펀딩이 쇼핑과 다른 점은 뭔가요?</h2><br><br><br><br>
					<h3>1. 펀딩 즉시, 결제가 진행되지 않아요.</h3>
				
				<p style="margin-left:70px;margin-top:7px">구매 후 바로 결제되는 쇼핑과 달리, 펀딩에는 프로젝트의 목표금액과 종료일이 있어요. </p><p style="margin-left:70px;margin-top:7px">프로젝트가 목표금액을 달성했을 때만 종료 후 한번에 결제가 진행돼요.</p>
				
				 
				
				<h3>2. 배송이 바로 되지 않아요.</h3>
				
				<p style="margin-left:70px;margin-top:7px">리워드가 결제 후 바로 발송되는 경우는 드물어요.</p><p style="margin-left:70px;margin-top:7px"> 리워드를 제작하는 데 펀딩으로 모든 금액이 필요하기 때문에 결제 후 리워드를 완성해서 배송하는데까지 시간이 걸려요. </p><p style="margin-left:70px;margin-top:7px">메이커가 약속한 리워드 배송일은 프로젝트 페이지에서 확인할 수 있어요.</p>
				
				 
				
				<h3>3. 메이커의 사정으로 리워드 발송이 지연될 수 있어요.</h3>
				
				<p style="margin-left:70px;margin-top:7px">펀딩 금액을 전달받아 리워드 제작을 시작하는 펀딩 특성 상, </p><p style="margin-left:70px;margin-top:7px">제작 과정에서 예기치 못한 문제가 발생할 경우 리워드 발송이 늦어질 수 있어요.</p><p style="margin-left:70px;margin-top:7px"> 프로젝트 페이지의 스토리 하단에 메이커가 약속한 리워드 발송 지연 시 대처방법과 교환 및 환불 정책이 작성되어 있으니</p><p style="margin-left:70px;margin-top:7px"> 펀딩 참여 전 꼭 읽어주세요.</p>
				
				
			</div>
		</div>
	</div>
	<div style="margin-top: 65px;">
	<jsp:include page="../footer.jsp" />
</div>
</div>
</body>
</html>