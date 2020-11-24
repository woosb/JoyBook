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
		<h1>고객 리스트</h1>
		<form id='searchForm' action="/customer/list" method='get' >
			<select name='type'>
			<option value=""<c:out value="${pageMaker.cri.type == null? 'selected ' : ''}"/>>--</option>
			<option value="T"<c:out value="${pageMaker.cri.type eq 'T'? 'selected ' : ''}"/>>방문종류</option>
			<option value="C"<c:out value="${pageMaker.cri.type eq 'C'? 'selected ' : ''}"/>>시술내용</option>
			<option value="W"<c:out value="${pageMaker.cri.type eq 'W'? 'selected ' : ''}"/>>예약경로</option>
			<option value="A"<c:out value="${pageMaker.cri.type eq 'A'? 'selected ' : ''}"/>>성별</option>
			<%-- 								<option value="TC"<c:out value="${pageMaker.cri.type eq 'TC'? 'selected ' : ''}"/>>방문종류 or 시술내용</option> --%>
			<%-- 								<option value="TW"<c:out value="${pageMaker.cri.type eq 'TW'? 'selected ' : ''}"/>>방문종류 or 예약경로</option> --%>
			<%-- 								<option value="TWC"<c:out value="${pageMaker.cri.type eq 'TWC'? 'selected ' : ''}"/>>방문종류 or 예약경로 or 시술내용</option> --%>
			</select>
			<input type='text' name='keyword' value='<c:out value="${pageMaker.cri.keyword }"/>'/>
			<input type="hidden" name="pageNum" value='<c:out value="${pageMaker.cri.pageNum }"/>'/>
			<input type="hidden" name="amount" value='<c:out value="${pageMaker.cri.amount }"/>'/>
			<input type="button" id="searchBtn"  class="form-control form-control-sm" aria-controls="dataTable" value="Search">
		</form>
		<a href="/customer/register">Register</a>
		<table border="">
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

		<div>
			<c:if test="${pageMaker.prev}">
				<li class="paginate_button page-item previous" id="dataTable_previous"><a href="${pageMaker.startPage -1 }" class="page-link">Previous</a></li>
			</c:if>
			<c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage}">
				<li class="paginate_button page-item active">
				<a href="${num }" aria-controls="dataTable" data-dt-idx="${num }" tabindex="0" class="page-link">${num }</a></li>
			</c:forEach>
			<c:if test="${pageMaker.next }">
				<li class="paginate_button page-item next" id="dataTable_next"><a href="${pageMaker.endPage + 1 }" class="page-link">Next</a></li>
			</c:if>
		</div>		
		<form id="actionForm" action="/customer/list" method="get">
			<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
			<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
			<input type="hidden" name='type' value='<c:out value="${pageMaker.cri.type }"/>'>
			<input type="hidden" name="keyword" value='<c:out value="${pageMaker.cri.keyword }"/>'>
		</form>
	</div>
<%@ include file="../includes/footer.jsp" %>
</body>
<!-- JQUERY CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		
		/* var result = '<c:out value="${result}"/>';
		
		checkModal(result);
		
		history.replaceState({}, null, null);
		
		function checkModal(result){
			
			if(result ==='' || history.state){
				return;
			}
			
			if(parseInt(result) >0){
				$(".modal-body").html("게시글 " + parseInt(result) + "번이 등록되었습니다.");
			}
			
			$("#myModal").modal("show");
		} */
		
		/*customer 등록*/
		$("#regBtn").on("click", function(){
			
			self.location = "/customer/register";
		});
		
		var actionForm = $("#actionForm");
		
		$(".paginate_button a").on("click", function(e){
			
			e.preventDefault(); // <a href="${num }">${num }</a> 태그를 클릭해도 이동이 없도록 하는 메소드
			console.log('click');
			
			// 여기서 this 는 .pagination_button a 이다 이 태그의 href의 속성 value 를  가져와서 input에 값에 추가해 준다.
			actionForm.find("input[name='pageNum']").val($(this).attr("href")); 
			actionForm.submit();
		});
		
		/* 게시판 클릭시 세부정보
		$(".move").on("click", function(e){
			
			e.preventDefault();
			actionForm.append("<input type='hidden' name ='bno' value='"+$(this).attr("href")+"'>");
			actionForm.attr("action", "/board/get");
			actionForm.submit();
		}); */
		
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
