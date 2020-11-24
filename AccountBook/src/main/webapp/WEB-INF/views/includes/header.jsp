<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div align="center" >
<h1 style="color:burlywood; font-size:60px; font-family:Gabriola;">
CARE &nbsp; LAB
</h1>
	<hr>
		<div style="float:left; margin-right: 10px;">
			<a href="/">HOME</a>
		</div>	
		<div style="float:right; display: flex;">
			<div style="margin-right : 10px;">
				<a href="/member/signIn" >SIGN IN</a>
			</div>
			<div style="margin-right : 10px;">
				<form method='post' action="/customLogout" id="logOutForm" >
					<a href="#"  onclick="signOut()">SIGN OUT</a>
					<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
				</form>
			</div>
			<div style="margin-right : 10px;">
				<a href="/member/signUp">SIGN UP</a>
			</div>
		</div>
		<div style="display:flex;">
			<div style="margin-right : 10px;">
				<a href="/customer/list">Customer List</a>
			</div>
			<div style="margin-right : 10px;">
				<a href="/member/dashboard">member dashboard</a>
			</div>
			<div style="margin-right : 10px;">
				<a href="/board/list">boardList</a>
			</div>
		</div>
	<hr>
</div>
</body>
<script>
	function signOut(){
		document.getElementById("logOutForm").submit();
	}
</script>
</html>