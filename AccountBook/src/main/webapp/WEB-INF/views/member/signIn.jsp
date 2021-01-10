<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Jekyll v4.1.1">
    <title>Signin Template · Bootstrap</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/4.5/examples/sign-in/">

    <!-- Bootstrap core CSS -->
<link href="/resources/bootstrap/assets/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>
    <!-- Custom styles for this template -->
    <link href="/resources/bootstrap/signin.css" rel="stylesheet">
  </head>
  <body class="text-center">
<form class="form-signin" method='post' action="/member/signIn">
  <img class="mb-4" src="/resources/images/main.png" alt="" width="72" height="72">
  <h1 class="h3 mb-3 font-weight-normal">Please sign in</h1>
  <label for="inputEmail" class="sr-only">Email address</label>
  <input type="email" id="inputEmail" name="userId" class="form-control" placeholder="Email address" required autofocus>
  <label for="inputPassword" class="sr-only">Password</label>
  <input type="password" id="inputPassword" name="userPw" class="form-control" placeholder="Password" required>
  <div class="checkbox mb-3">
  <label>
    <input type="checkbox" id="customCheck" name="remember-me" value="remember-me"> Remember me
  </label>
  </div>
  <input class="btn btn-lg btn-primary btn-block" type="submit" id="signIn" value="Sign in">
  <a href="/member/signUp" class="btn btn-lg btn-primary btn-block">Sign up</a>
  <p class="mt-5 mb-3 text-muted">&copy; 2017-2020</p>
</form>
</body>
</html>
<!-- JQUERY CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#signIn").on("click", function(){
			const inputEmail = document.getElementById('inputEmail').value;
			const inputPassword = document.getElementById('inputPassword').value;
			if(!inputEmail){
				alert("아이디를 입력하세요!");
				return false;
			}else if(!inputPassword){
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