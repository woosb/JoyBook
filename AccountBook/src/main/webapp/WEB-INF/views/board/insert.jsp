<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../includes/header.jsp" %>
<main role="main">
	<div class="container">
	<br>
		<h1>게시글 작성 하기</h1>
		<form method="post">
			<input type="text" name="title">
			<textarea id="summernote" name="editordata"></textarea>
		</form>
		<button onclick="test();">테스트</button>
	</div>
</main>
<%@ include file="../includes/commonscript.jsp" %>
<script>
	function test(){
		var markupStr = $('#summernote').summernote('code');
		console.log(markupStr);
	}
	
	$(function(){
		$('#summernote').summernote({
			placeholder: 'Hello Bootstrap 4',
	        tabsize: 2,
	        height: 500,
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