<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>SB Admin 2 - Login</title>
</head>
<body>
<%@ include file="../includes/header.jsp" %>
	<div align="center">
		<h1>로그인</h1>
		<form method='post' action="/member/signIn">
			<table border="1">
				<tr>
					<td>아이디</td>
					<td><input type="email" name="userId"  id="mb_id"  placeholder="Enter Email Address..."></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="userPw" id="mb_pw" placeholder="Password"></td>
				</tr>
				<tr>
					<td>자동로그인</td>
					<td><input type="checkbox"  id="customCheck" name="remember-me"></td>
				</tr>
				<tr>
					<td colspan="2"><c:out value= "${loginFailMsg}"/></td>
			    </tr>
				<tr>
			    	<td colspan="2">
			    		<input type="submit"  id="signIn"  value='Login'/>
			    		<a href="/member/signUp">회원가입</a>
			    	</td>
			    </tr>
			</table>
		</form>
	</div>
<%@ include file="../includes/footer.jsp" %>
</body>
	<!-- JQUERY CDN -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#signIn").on("click", function(){
				const mb_id = document.getElementById('mb_id').value;
				const mb_pw = document.getElementById('mb_pw').value;
				if(!mb_id){
					alert("아이디를 입력하세요!");
					return false;
				}else if(!mb_pw){
					alert("비밀번호를 입력하세요!");
					return false;
				}
			});
			$("#reset").on("click", function(){
				history.back();
			});

		});
	</script>
</html>