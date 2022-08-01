<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/ckeditor.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js" ></script>
<script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/ckeditor.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/translations/ko.js"></script>
<style>
  .ck-editor__editable { height: 400px; }
  .ck-content { font-size: 12px; }
  #title{
  width:300px;
  height:30px;
  margin-bottom:10px;
  }
  #content{
  	display:block;
  	width:700px;
  	height:400px;
  
  }
</style>
</head>
<body>
<h1>공지사항</h1>
    <form method="POST">
    <input type="text" id="title" name="n_title"value="" placeholder="제목">
      <textarea name="text" id="content" name="n_content" placeholder="내용"></textarea>
    
    <button type="button" onclick="insert()">전송</button>
    </form>
    
<script>
  ClassicEditor.create( document.querySelector( '#editor' ), {
    removePlugins: [ 'Heading' ],
    language: "ko"
  } );
  function insert(){
	 const data={
			  n_title:$('#title').val(),
			  n_content: $("#content").val()
			  
	  }
		$.ajax({
			type : "POST",
			url :"<%=request.getContextPath()%>/notice/admin/insert",
			data : data,
			success: function (result){
				console.log(result);
	            if(result == 0){
	            	alert("로그인을 한 후에 주문이 가능합니다. 로그인 페이지로 이동합니다.");
					location.href = "<%=request.getContextPath()%>/member/login";
	            }else {
	            	alert("글 등록 완료");
	        		console.log(result);
	            	location.href = "<%=request.getContextPath()%>/notice/admin";
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