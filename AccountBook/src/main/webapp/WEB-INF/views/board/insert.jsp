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
<div class="container">
<h1>글 쓰 기 </h1>
<form action="/board/insert" method="post" enctype="multipart/form-data">
	<table border="1">
		<tr>
			<th>제목</th>
			<td><input type="text" name="title"></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea rows="10" name="content" class="summernote"></textarea></td>
		</tr>
		<tr>
			<th>파일첨부</th>
			<td><input type="file" name="uploadFile" multiple></td>
		</tr>
	</table>
	<input type="submit" id="uploadBtn" value="제출하기">
</form>
<script>
	var userId = "<c:out value="${sessionScope.userId}"/>";
	if(userId == ""){
		alert("로그인이 필요합니다.");
		self.location= "/member/signIn";
	}
</script>
<script>
      $('.summernote').summernote({
        placeholder: 'Hello Bootstrap 4',
        tabsize: 2,
        height: 100
      });
</script>
</div>
<%@ include file="../includes/footer.jsp" %>
</body>
</html>