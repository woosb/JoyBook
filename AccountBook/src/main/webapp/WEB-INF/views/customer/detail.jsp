<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../includes/header.jsp" %>
<main role="main">
	<div align="center">
		<div class="table-responsive" style="padding:30px 30px;">
		<h1>Detail</h1>
			<table class="table table-striped table-sm">
				<tbody>
					<tr role="row">
						<th>No</th>
						<td id="no"></td>
					</tr>
					<tr role="row">
						<th>Designer</th>
						<td id="designer_id"></td>
					</tr>
					<tr role="row">
						<th>방문종류</th>
						<td id="visitType"></td>
					</tr>
					<tr role="row">
						<th>시술내용</th>
						<td id="content"></td>
					</tr>
					<tr role="row">
						<th>성별</th>
						<td id="sex"></td>
					</tr>
					<tr role="row">
						<th>시술날짜</th>
						<td id="date"></td>
					</tr>
					<tr role="row">
						<th>가격</th>
						<td id="price"></td>
					</tr>
					<tr role="row">
						<th>예약경로</th>
						<td id="reservationRoute"></td>
					</tr>
					<tr role="row">
						<th>정액권</th>
						<td id="ticket"></td>
					</tr>
				</tbody>
			</table>
			<button class="btn btn-dark" onclick="self.location='/customer/list'">뒤로가기</button>
		</div>
	</div>
</main>
<script>
getDetail();
function getDetail(){
	var cus_no = "${cus_no}";
	console.log(cus_no);
	
	$.ajax({
		url:"/customer/getCus/"+cus_no,
		type:"GET"
	}).done(function(result){
		console.log(result);
		var no = document.getElementById("no").innerHTML=result.cus_no;
		var designer_id = document.getElementById("designer_id").innerHTML=result.designer_id;
		var visitType = document.getElementById("visitType").innerHTML=result.visitType;
		var content = document.getElementById("content").innerHTML=result.content;
		var sex = document.getElementById("sex").innerHTML=result.sex;
		var date = document.getElementById("date").innerHTML=displayTime(result.date);
		var price = document.getElementById("price").innerHTML=result.price;
		var reservationRoute = document.getElementById("reservationRoute").innerHTML=result.reservationRoute;
	});
}
</script>
<%@ include file="../includes/commonscript.jsp" %>
<%@ include file="../includes/footer.jsp" %>
