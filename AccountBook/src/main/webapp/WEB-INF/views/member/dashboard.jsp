<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
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
				<td>**<c:out value="${ income.date}"/>**</td>
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
				<td>**<c:out value="${ income.date}"/>**</td>
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
				<td>IncomeByReservationRoute</td>
				<td><c:out value="${ income.income}"/><c:out value="${ income.reservationRoute}"/>**<c:out value="${ income.date}"/>  </td>
			</tr>
		</c:forEach>
	</table>
</div>
<%@ include file="../includes/footer.jsp" %>
</body>
</html>
