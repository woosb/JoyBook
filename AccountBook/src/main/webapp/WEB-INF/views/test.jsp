<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:th="http://www.thymeleaf.org">
<head>
<meta name="_csrf" th:content="${_csrf.token}"/>
<meta name="_csrf_header" th:content="${_csrf.headerName}"/>
<title>CSRF TEST</title>
</head>
<body>
<div>
	<form id="testForm">
		id : <input type="text" name="userId">	
		pw : <input type="text" name="userPw">	
		name : <input type="text" name="userName">
		<input type="button" id="inputBtn" value="제출하기">	
	</form>
</div>
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<script>
$(document).ready(function(){
	$("#inputBtn").on("click", function(){
		
		var token = $("meta[name='_csrf']").attr("content");
		var header = $("meta[name='_csrf_header']").attr("content");
		var name = $("#userName").val();
		var userId = $("#userId").val();
		var userPw = $("#userPw").val();
		
		var jsonData = {
				"name" : name,
				"userId" : userId,
				"userPw" : userPw,
		}
		
		console.log("inputBtn clicked");
		if(token && header) {
			$.ajax({
				url: "/test",
				type: "post",
				contentType: "application/json",
				data: JSON.stringify(jsonData),
				beforeSend : function(xhr){   
					/*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
					xhr.setRequestHeader(header, token);
	            },
	            dataType: 'json',
				success: function(data){
					alert(data);	
				}
				
			});
		}
		
	});
});
</script>
</body>
</html>