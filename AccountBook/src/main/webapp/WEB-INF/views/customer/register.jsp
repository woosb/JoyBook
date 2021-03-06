<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../includes/header.jsp" %>
<main role="main" class="container" style="margin : 10px 0;">
	<div align="center">
		<div class="table-responsive" style="padding:30px 30px;">
		<hr>	
		<h1>고객 등록</h1>
			<form id="registerForm" action="/customer/register" method="post">
				<table class="table table-striped table-sm">
					<tr>
						<td>신규/재방</td>
						<td>
							<input type="radio" name="visitType" value="신규" checked id="jb-radio-1">신규
							<input type="radio" name="visitType" value="재방문" id="jb-radio-1">재방문
						</td>
					</tr>
					<tr>
						<td>
							시술내용
						</td>
						<td>
							<input type="checkbox" name="content" value="커트" checked>커트
							<input type="checkbox" name="content" value="앞머리커트">앞머리커트<br>
							<input type="checkbox" name="content" value="펌">펌
							<input type="checkbox" name="content" value="염색">염색<br>
							<input type="checkbox" name="content" value="샴푸">샴푸
							<input type="checkbox" name="content" value="클리닉(두피)">클리닉(두피)
							<input type="checkbox" name="content" value="클리닉(모발)">클리닉(모발)
						</td>
					</tr>
					<tr>
						<td>성별</td>
						<td>
							<input type="radio" name="sex" value="남자" checked>남자
							<input type="radio" name="sex" value="여자">여자
						</td>
					</tr>
					<tr>
						<td>금액</td>
						<td>
							<input type="text" name="price" id="price"  class="form-control form-control-user"  placeholder="금액">
						</td>
					</tr>
					<tr>
						<td>정액권</td>
						<td>
							<input type="checkbox" name="ticket" value="1">정액권
						</td>
					</tr>
					<tr>
						<td>예약경로</td>
						<td>
							<select name="reservationRoute">
								<option value="네이버">네이버</option>
								<option value="카카오">카카오</option>
								<option value="매장예약">매장예약</option>
							</select>
						</td>
					</tr>
					<tr>
						<td colspan="2" >
							<button type="submit" id="submit" class="btn btn-dark">신규 등록</button>
							<button type="reset" class="btn btn-dark">Reset</button>
						</td>
					</tr>
			</table>
			</form>
			<button class="btn btn-dark" onclick="self.location='/customer/list'">뒤로가기</button>
		</div>
	</div>
</main>
<%@ include file="../includes/commonscript.jsp" %>
</body>
<script type="text/javascript">
	$(document).ready(function(){
		$("#regBtn").on("click", function(){
			self.location = "/customer/register";
		});
		$("#submit").on("click", function(){
			
			const name = document.getElementById('price').value;
			console.log(name);
			if(!name){
				alert("가격을 입력하세요!");
				return false;
			}
		});
	});
</script>
<%@ include file="../includes/footer.jsp" %>
