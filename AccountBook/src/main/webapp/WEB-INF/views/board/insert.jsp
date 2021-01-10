<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="../includes/header.jsp" %>
<main role="main" class="container">
<h1>글 쓰 기 </h1>
<form action="/board/insert" method="post">
	<table border="1">
		<tr>
			<th>제목</th>
			<td><input type="text" name="title"></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea rows="10" name="content" class="summernote"></textarea></td>
		</tr>
	</table>
	
	<input type="submit" id="uploadBtn" value="제출하기">
	
</form>
<img src="/download?imageFileName=ㅎ로.gif" width="100px">
	<span>파일첨부</span>
	<input type="file" name="uploadFile" multiple>
	<button id="uploadBtn" onclick="uploadFile();">Upload</button>
</div>
<%@ include file="../includes/footer.jsp" %>
<script>
function uploadFile(){
	var formData = new FormData();
	var inputFile = $("input[name='uploadFile']");
	
	var files = inputFile[0].files;
	
	console.log(files);
	
	for(var i = 0; i <files.length; i++){
		formData.append("uploadFile", files[i]);
	}
	
	$.ajax({
		url: '/uploadAjax',
		processData: false,
		contentType: false,
		data: formData,
		type:'post',
		success: function(result){
			alert(result);
		}
	});
}
</script>
<script>
$(document).ready(function(){
	
});
</script>
</body>
</html>