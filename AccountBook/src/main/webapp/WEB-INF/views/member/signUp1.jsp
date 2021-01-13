<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../includes/header.jsp" %>
    <div align="center">
    	<h1>회원가입</h1>
	    <form class="user" action="/member/signUp" method="post" id="loginForm">
		    <table border="1">
		    	<tr>
		    		<td>First Name</td>
		    		<td><input type="text" id="firstName"  placeholder="First Name"></td>
		    	</tr>
		    	<tr>
		    		<td>Last Name</td>
		    		<td><input type="text"  id="lastName" placeholder="Last Name"></td>
		    	</tr>
		    	<tr>
		    		<td>Email</td>
		    		<td><input type="email"  placeholder="Email Address" name ="userId" id="id"></td>
		    	</tr>
		    	<tr>
		    		<td>Password</td>
		    		<td><input type="password"  name="userPw" id="pw" onchange="check_pw()" placeholder="Password"></td>
		    	</tr>
		    	<tr>
		    		<td>Password Check</td>
		    		<td><input type="password"   name="userPw2" id="pw2" onchange="check_pw()" placeholder="Repeat Password"></td>
		    	</tr>
		    	<tr>
		    		<td colspan="2"><span id="check"></span></td>
		    	</tr>
		    	<tr>
		    		<td><button type="submit" id="signUp" >Register Account</button></td>
		    		<td><button type="reset" id="reset" >cancel</button></td>
		    	</tr>
		    </table>
			<input type="hidden" name="userName" id="userName">
	    </form>
	<div class="text-center">
	    <a class="small" href="/member/signin">Already have an account? Login!</a>
	</div>
	</div>
	<%@ include file="../includes/commonscript.jsp" %>
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
<%@ include file="../includes/footer.jsp" %>