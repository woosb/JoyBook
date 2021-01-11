<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../includes/header.jsp" %>
<main role="main">
	<div class="container">
	<br>
		<h1>스타일 등록하기</h1>
		
		<div>
			Thumnail : <input type="file" name="uploadFile">
			<button id="uploadBtn">Upload</button><br>
		</div>
		
		<form action="/board/insert" method="post">
			썸네일 설명 : <input type="text" name="cardText" id="cardText">
			<input type="text" name="title" class="form-control" placeholder="title" style="margin : 10px 0px; ">
			<div id="contents">
				<textarea class="summernote" id="summernote" name="content"></textarea>
			</div>
			<input type="hidden" name="thumbnail" id="thumbnail">
			<div style="margin:20px 0px;" align="center">
				<input type="submit" class="btn btn-secondary btn-lg btn-primary" value="제출하기">
			</div>
		</form>	
	</div>
	<button onclick="test();">test</button>
</main>
<%@ include file="../includes/commonscript.jsp" %>
<script>
function test(){
	var content = $("#summernote").val();
	console.log(content);
}
</script>
<script>
$("#uploadBtn").on("click", function(e){
	var formData = new FormData();
	var inputFile = $("input[name='uploadFile']");
	
	var files = inputFile[0].files;
	
	console.log(files);
	
	formData.append("uploadFile", files[0]);
	$.ajax({
		url: '/uploadAjaxAction',
		processData: false,
		contentType: false,
		data: formData,
		type:'post',
		success: function(img_name){
		 	console.log(img_name);
		 	$("#thumbnail").val(img_name);
		}
	});
});
</script>
<script>
	$(function(){
		$('.summernote').summernote({
			placeholder: '내용 입력!',
	        tabsize: 2,
	        height: 250,
	        minHeight : null,
	        maxHeight : null,
	        focus : true,
	        callbacks: {
				onImageUpload: function(files, editor, welEditable) {
					for (var i = 0; i < files.length; i++) {
						sendFile(files[i], this);
					}
		        }
			}
		});
		
		function sendFile(file, el) {
			var form_data = new FormData();
	      	form_data.append('file', file);
	      	$.ajax({
	        	data: form_data,
	        	type: "POST",
	        	url: '/summernoteUpload',
	        	cache: false,
	        	contentType: false,
	        	enctype: 'multipart/form-data',
	        	processData: false,
	        	success: function(img_name) {
	        		console.log(img_name);
	          		$(el).summernote('editor.insertImage', img_name);
	        	}
	      	});
	    }
	});
</script>
<%@ include file="../includes/footer.jsp" %>