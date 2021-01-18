<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../includes/header.jsp" %>
<main role="main">
	<div class="container" style="margin:20px 0;">
		<h1> 고객 매출 통계</h1>
		<div class="row my-2">
			<div class="col-md-6 py-1">
	            <div class="card">
	                <div class="card-body">
	                	<h3>월별 매출액</h3>
	                    <canvas id="chLine"></canvas>
	                </div>
	            </div>
        	</div>
			<div class="col-md-6 py-1">
	            <div class="card">
	                <div class="card-body">
	                <div align="center">
	                	<h4>
	                		<span style="color:#007bff"><b>신규</b></span>
	                		<span style="color:#28a745"><b>재방문</b></span>
	                	</h4>
	                </div>
	                    <canvas id="chBar"></canvas>
	                </div>
	            </div>
     		</div>
     	</div>
		<div class="table-responsive" style="padding:30px 30px;">
			<h2>올해 총 매출</h2>
			<table class="table table-striped table-sm">
				<c:forEach items="${annualIncome }"  var="income">
					<tr>
						<th><c:out value="${ income.date}"/>년 총 매출</th>
						<th><c:out value="${ income.income}"/>원</th>
					</tr>
				</c:forEach>
			</table>
			<h4>연도별 매출</h4>
			<table class="table table-striped table-sm">
				<tr>
					<c:forEach items="${AnnualIncomeList }"  var="income">
						<th><c:out value="${ income.date}"/>년</th>
					</c:forEach>
				</tr>
				<tr>
					<c:forEach items="${AnnualIncomeList }"  var="income">
						<td><c:out value="${ income.income}"/>원</td>
					</c:forEach>
				</tr>
			</table>
			<hr>
			<h2>이번달 총 매출</h2>
			<table class="table table-striped table-sm">
				<c:forEach items="${MonthIncome }"  var="income">
					<tr>
						<th><c:out value="${ income.date}"/>월 총 매출</th>
						<td><c:out value="${ income.income}"/></td>
					</tr>
				</c:forEach>
			</table>
			<h4>월별 매출</h4>
			<table class="table table-striped table-sm">
				<c:forEach items="${MonthlyIncomeList }"  var="income">
					<tr>
						<td><c:out value="${ income.date}"/></td>
						<td><c:out value="${ income.income}"/>원</td>
					</tr>
				</c:forEach>
			</table>
			<hr>
			<h2>플랫폼별 매출</h2>
			<table class="table table-striped table-sm">
				<c:forEach items="${IncomeByReservationRoute }"  var="income">
					<tr>
						<td><c:out value="${ income.reservationRoute}"/>/이번년도 이번달</td>
						<td><c:out value="${ income.income}"/>원</td>
					</tr>
				</c:forEach>
			</table>
			<h2>신규/재방문 매출</h2>
			<table class="table table-striped table-sm">
				<tr>
					<td></td>
					<c:forEach items="${getNewCus }"  var="income">
						<td><c:out value="${ income.date}"/></td>
					</c:forEach>
				</tr>
				<tr>
					<td>신규</td>
					<c:forEach items="${getNewCus }"  var="income">
						<td><c:out value="${ income.income}"/>원</td>
					</c:forEach>
				</tr>
				<tr>
					<td>재방문</td>
					<c:forEach items="${getOldCus }"  var="income">
						<td><c:out value="${ income.income}"/>원</td>
					</c:forEach>
				</tr>
			</table>
		</div>
	</div>
</main>
<%@ include file="../includes/commonscript.jsp" %>
<!-- chart.js -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.js" integrity="sha512-d9xgZrVZpmmQlfonhQUvTR7lMPtO7NkZMkA0ABN3PHCbKA5nqylQ/yWlFAyY6hYgdF1Qh6nYiuADWwKB4C2WSw==" crossorigin="anonymous"></script> 
<script>
/* bar chart */
var colors = ['#007bff', '#28a745', '#333333', '#c3e6cb', '#dc3545', '#6c757d'];
var chBar = document.getElementById("chBar");

var getNewCus = [];
var getOldCus = [];

<c:forEach items="${getNewCus }"  var="income">
	getNewCus.push(<c:out value="${ income.income}"/>);
</c:forEach>
<c:forEach items="${getOldCus }"  var="income">
	getOldCus.push(<c:out value="${ income.income}"/>);
</c:forEach>
console.log(getNewCus);
console.log(getOldCus);

if (chBar) {
  new Chart(chBar, {
  type: 'bar',
  data: {
    labels: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
    datasets: [
    {
      label : '신규',
      data: getNewCus,
      backgroundColor: colors[0]
    },
    {
      label : '재방문',
      data: getOldCus,
      backgroundColor: colors[1]
    }
    ]
  },
  options: {
    legend: {
      display: false
    },
    scales: {
      xAxes: [{
        barPercentage: 0.4,
        categoryPercentage: 0.5
      }]
    }
  }
  });
}
</script>
<script>
/* large line chart */

	var income = [];
	<c:forEach items="${MonthlyIncomeList }"  var="income">
		income.push(<c:out value="${ income.income}"/>);
	</c:forEach>	
var chLine = document.getElementById("chLine");
var chartData = {
	labels: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
    datasets: [{
            data: income,
            backgroundColor: colors[3],
//          backgroundColor: 'transparent',
            borderColor: colors[0],
            borderWidth: 4,
            pointBackgroundColor: colors[0]
        },
//           {
//             data: income,
//             backgroundColor: colors[3],
//             borderColor: colors[1],
//             borderWidth: 4,
//             pointBackgroundColor: colors[1]
//           }
    ]
};
if (chLine) {
    new Chart(chLine, {
        type: 'line',
        data: chartData,
        options: {
            scales: {
                xAxes: [{
                    ticks: {
                        beginAtZero: false
                    }
                }]
            },
            legend: {
                display: false
            },
            responsive: true
        }
    });
}

</script>
<%@ include file="../includes/footer.jsp" %>