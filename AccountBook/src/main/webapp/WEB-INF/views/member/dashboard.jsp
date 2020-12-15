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
<div align="center">
	<table border="1">
		<c:forEach items="${annualIncome }"  var="income">
			<tr>
				<td>**<c:out value="${ income.date}"/>년 총 매출</td>
				<td><c:out value="${ income.income}"/></td>
			</tr>
		</c:forEach>
		<c:forEach items="${AnnualIncomeList }"  var="income">
			<tr>
				<td>**<c:out value="${ income.date}"/></td>
				<td><c:out value="${ income.income}"/></td>
			</tr>
		</c:forEach>
		<c:forEach items="${MonthIncome }"  var="income">
			<tr>
				<td>**<c:out value="${ income.date}"/>월 총 매출</td>
				<td><c:out value="${ income.income}"/></td>
			</tr>
		</c:forEach>
		<c:forEach items="${MonthlyIncomeList }"  var="income">
			<tr>
				<td>**<c:out value="${ income.date}"/></td>
				<td><c:out value="${ income.income}"/></td>
			</tr>
		</c:forEach>
		<c:forEach items="${IncomeByReservationRoute }"  var="income">
			<tr>
				<td><c:out value="${ income.reservationRoute}"/>/이번년도 이번달</td>
				<td><c:out value="${ income.income}"/></td>
			</tr>
		</c:forEach>
	</table>
</div>
<%@ include file="../includes/footer.jsp" %>
<script>
var userId = "<c:out value="${sessionScope.userId}"/>";
if(userId == ""){
	alert("로그인이 필요합니다.");
	self.location= "/member/signIn";
}
</script>
</body>
</html>
