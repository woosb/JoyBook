<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	thead, tfoot{
		color :  #FFFF00;
		background-color :black;
	}
</style>
</head>
<body>
<%@ include file="../includes/header.jsp" %>
	<div class="container" align="center">
		<h1>고객 리스트</h1>
		<div class="panel panel-default">
			<div class="panel-heading">Panel heading</div>
			<div class="panel-body">
				<p>...</p>
				<table class="table">
					<thead>
						<tr role="row">
						<th>No</th>
						<th>방문종류</th>
						<th>시술내용</th>
						<th>성별</th>
						<th>시술날짜</th>
						<th>가격</th>
						<th>예약경로</th>
						<th>정액권</th>
						</tr>
					</thead>
					<tfoot>
						<tr>
						<th>No</th>
						<th>방문종류</th>
						<th rowspan="1" colspan="1">시술내용</th>
						<th rowspan="1" colspan="1">성별</th>
						<th rowspan="1" colspan="1">시술날짜</th>
						<th rowspan="1" colspan="1">가격</th>
						<th rowspan="1" colspan="1">예약경로</th>
						<th rowspan="1" colspan="1">정액권</th>
						</tr>
					</tfoot>
					<tbody>  
						<c:forEach items="${list }" var="customer">
						<tr>
							<td><c:out value="${customer.cus_no }" /></td>
							<td><c:out value="${customer.visitType }" /></td>
							<td><c:out value="${customer.content}" /></td>
							<td><c:out value="${customer.sex }" /></td>
							<td><fmt:formatDate pattern="yyyy-MM-dd" value="${customer.date}"/></td>
							<td><c:out value="${customer.price}" /></td>
							<td><c:out value="${customer.reservationRoute}" /></td>
							<td><c:if test="${customer.ticket >= 1}"><c:out value="${customer.ticket }"/>원</c:if></td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
				<form id='searchForm' action="/customer/list" method='get' >
					<select name='type'>
					<option value=""<c:out value="${pageMaker.cri.type == null? 'selected ' : ''}"/>>--</option>
					<option value="T"<c:out value="${pageMaker.cri.type eq 'T'? 'selected ' : ''}"/>>방문종류</option>
					<option value="C"<c:out value="${pageMaker.cri.type eq 'C'? 'selected ' : ''}"/>>시술내용</option>
					<option value="W"<c:out value="${pageMaker.cri.type eq 'W'? 'selected ' : ''}"/>>예약경로</option>
					<option value="A"<c:out value="${pageMaker.cri.type eq 'A'? 'selected ' : ''}"/>>성별</option>
					<%-- <option value="TC"<c:out value="${pageMaker.cri.type eq 'TC'? 'selected ' : ''}"/>>방문종류 or 시술내용</option> --%>
					<%-- <option value="TW"<c:out value="${pageMaker.cri.type eq 'TW'? 'selected ' : ''}"/>>방문종류 or 예약경로</option> --%>
					<%-- <option value="TWC"<c:out value="${pageMaker.cri.type eq 'TWC'? 'selected ' : ''}"/>>방문종류 or 예약경로 or 시술내용</option> --%>
					</select>
					<input type='text' name='keyword' value='<c:out value="${pageMaker.cri.keyword }"/>'/>
					<input type="hidden" name="pageNum" value='<c:out value="${pageMaker.cri.pageNum }"/>'/>
					<input type="hidden" name="amount" value='<c:out value="${pageMaker.cri.amount }"/>'/>
					<button class="btn btn-default" type="submit" id="searchBtn">검색하기</button>
				</form>
			</div>
			<div><button class="btn btn-default" onclick="self.location='/customer/register'">신규등록</button></div>
			
			<div>
				<c:if test="${pageMaker.prev}">
					<a href="/customer/list?pageNum=${pageMaker.startPage -1 }">이전</a>
				</c:if>
				<c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage}">
					<a href="/customer/list?pageNum=${num }"><c:out value="${num }"/></a>
				</c:forEach>
				<c:if test="${pageMaker.next }">
					<a href="/customer/list?pageNum=${pageMaker.endPage + 1 }">다음</a>
				</c:if>
			</div>		
			<form id="actionForm" action="/customer/list" method="get">
				<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
				<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
				<input type="hidden" name='type' value='<c:out value="${pageMaker.cri.type }"/>'>
				<input type="hidden" name="keyword" value='<c:out value="${pageMaker.cri.keyword }"/>'>
			</form>
		</div>
	</div>
<%@ include file="../includes/footer.jsp" %>
</body>
<!-- JQUERY CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
var userId = "<c:out value="${sessionScope.userId}"/>";
if(userId == ""){
	alert("로그인이 필요합니다.");
	self.location= "/member/signIn";
}
	$(document).ready(function(){
		
		/*customer 등록*/
		$("#regBtn").on("click", function(){
			
			self.location = "/customer/register";
		});
			
	});
	
	var searchForm = $("#searchForm");
	
	$("#searchBtn").on("click", function(e){
		if(!searchForm.find("option:selected").val()){
			alert("검색 종류를 선택하세요");
			return false;
		}
		
		if(!searchForm.find("input[name='keyword']").val()){
			alert("키워드를 입력하세요");
			return false;
		}
		searchForm.find("input[name='pageNum']").val("1");
		e.preventDefault();
		
		searchForm.submit();
	});
</script>
</html>
