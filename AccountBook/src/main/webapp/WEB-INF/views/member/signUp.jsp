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
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
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
	<form class="user form-signin" action="/member/signUp" method="post" id="loginForm">
		<img class="mb-4" src="/resources/images/main.png" alt="" width="72" height="72">
		<h1 class="h3 mb-3 font-weight-normal">Please sign in</h1>
		<label for="firstName" class="sr-only">First Name</label>
		<input type="text" id="firstName"  placeholder="First Name" class="form-control" required autofocus>
		
		<label for="lastName" class="sr-only">Last Name</label>
		<input type="text"  id="lastName" placeholder="Last Name" class="form-control" required>
		
		<label for="email" class="sr-only">Email Address</label>
		<input type="email"  placeholder="Email Address" name ="userId" id="id" class="form-control" required>
		
		<label for="inputPassword" class="sr-only">Password</label>
		<input style="margin:0px;" type="password"  name="userPw" id="pw" onchange="check_pw()" placeholder="Password" class="form-control"  required>
		
		<label for="inputPassword" class="sr-only">Repeat Password</label>
		<input type="password"   name="userPw2" id="pw2" onchange="check_pw()" placeholder="Repeat Password" class="form-control" required>
		
		<span id="check"></span>
		
		<div class="checkbox mb-3">
		<label>
		<input type="checkbox" id="customCheck" name="remember-me" value="remember-me"> Remember me
		</label>
		</div>
		<button type="submit" id="signUp" class="btn btn-lg btn-primary btn-block">Register Account</button>
		<button type="reset" id="reset" class="btn btn-lg btn-primary btn-block">cancel</button>
		<a class="small" href="/member/signin">Already have an account? Login!</a>
		
		<p class="mt-5 mb-3 text-muted">&copy; 2017-2020</p>
		<input type="hidden" name="userName" id="userName">
	</form>

<!-- JQUERY CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
		function check_pw(){
            var pw = document.getElementById('pw').value;
            var SC = ["!","@","#","$","%"];
            var check_SC = 0;
            
            for(var i=0;i<SC.length;i++){
                if(pw.indexOf(SC[i]) != -1){
                    check_SC = 1;
                }
            }
            if(pw.length < 6 || pw.length > 16 || check_SC == 0){
            	document.getElementById('check').innerHTML='비밀번호는 6글자 이상, 16글자 이하(특수문자 포함 !,@,#,$,%)만 이용 가능합니다.';
                document.getElementById('check').style.color='red';
                document.getElementById('pw').value='';
            }
            if(document.getElementById('pw').value != ""  && document.getElementById('pw2').value!=""){
                if(document.getElementById('pw').value == document.getElementById('pw2').value){
                    document.getElementById('check').innerHTML='비밀번호가 일치합니다.'
                    document.getElementById('check').style.color='blue';
                }
                else{
                    document.getElementById('check').innerHTML='비밀번호가 일치하지 않습니다.';
                    document.getElementById('check').style.color='red';
                }
            }
        }
		
		$(document).ready(function(){
			$("#signUp").on("click", function(){
				const firstName = document.getElementById('firstName').value
				const lastName = document.getElementById('lastName').value
				document.getElementById('userName').value = firstName + " " + lastName;
				
				console.log(firstName + lastName);
				
				const member_id = document.getElementById('id').value;
				const member_pw = document.getElementById('pw').value;
				if(!member_id){
					alert("아이디를 입력하세요!");
					return false;
				}else if(!member_pw){
					alert("비밀번호를 입력하세요!");
					return false;
				}else if(document.getElementById('pw').value != document.getElementById('pw2').value){
					alert("비밀번호가 일치하지 않습니다!");
					return false;
				}
				
				const userName = document.getElementById('userName').value;
				if(!userName){
					alert("이름을 입력하세요!");
					return false;
				}
			});
		});
	</script>
</body>
</html>