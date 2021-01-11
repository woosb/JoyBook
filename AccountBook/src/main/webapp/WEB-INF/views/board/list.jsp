<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../includes/header.jsp" %>
<main role="main">
<div class="container" style="margin: 20px 0px;">
<h1>게 시 판</h1>
	<div class="row">
        <div class="col-md-4">
          <div class="card mb-4 shadow-sm">
            <img src="/resources/images/main.png" width="100%" height="100%"/>
            <div class="card-body">
              <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
                  <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
                </div>
                <small class="text-muted">9 mins</small>
              </div>
            </div>
          </div>
        </div>
        <div class="col-md-4">
          <div class="card mb-4 shadow-sm">
            <img src="/resources/images/main.png" width="100%" height="100%"/>
            <div class="card-body">
              <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
                  <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
                </div>
                <small class="text-muted">9 mins</small>
              </div>
            </div>
          </div>
        </div>
        <div class="col-md-4">
          <div class="card mb-4 shadow-sm">
            <img src="/resources/images/main.png" width="100%" height="100%"/>
            <div class="card-body">
              <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
                  <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
                </div>
                <small class="text-muted">9 mins</small>
              </div>
            </div>
          </div>
        </div>
        <div class="col-md-4">
          <div class="card mb-4 shadow-sm">
            <img src="/resources/images/main.png" width="100%" height="100%"/>
            <div class="card-body">
              <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
                  <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
                </div>
                <small class="text-muted">9 mins</small>
              </div>
            </div>
          </div>
        </div>
      </div>  

<table class="table">
	<tr>
		<th>번호</th>	
		<th>제목</th>	
		<th>글쓴이	</th>	
		<th>작성일</th>	
		<th>조회수</th>	
		<th>추천</th>	
		<th>ref</th>	
		<th>step</th>	
		<th>refOrder</th>	
		<th>answerNum</th>	
		<th>parentNum</th>	
	</tr>
	<c:forEach var="list" items="${list }">
		<tr>
			<td><c:out value="${list.id }"/></td>
			<td><a href="/board/detail?id=${list.id }"><c:out value="${list.title }"/></a></td>
			<td><c:out value="${list.userId }"/></td>
			<td><c:out value="${list.regDate }"/></td>
			<td><c:out value="${list.hit }"/></td>
			<td><c:out value="${list.recommend }"/></td>
			<td><c:out value="${list.ref }"/></td>
			<td><c:out value="${list.step }"/></td>
			<td><c:out value="${list.refOrder }"/></td>
			<td><c:out value="${list.answerNum }"/></td>
			<td><c:out value="${list.parentNum }"/></td>
		</tr>
	</c:forEach>
</table>
<div>
	<c:if test="${pageMaker.prev}">
		<li class="paginate_button"><a href="${pageMaker.startPage -1 }">Previous</a></li>
	</c:if>
	<c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage}">
<%-- 		<li class="paginate_button"><a href="${num }" >${num }</a></li> --%>
		<a href="/board/list?pageNum=${num }"><c:out value="${num }"/></a>
	</c:forEach>
	<c:if test="${pageMaker.next }">
		<li class="paginate_button"><a href="${pageMaker.endPage + 1 }">Next</a></li>
	</c:if>
</div>
<form id="actionForm" action="/board/list" method="get">
	<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
	<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
	<input type="hidden" name='type' value='<c:out value="${pageMaker.cri.type }"/>'>
	<input type="hidden" name="keyword" value='<c:out value="${pageMaker.cri.keyword }"/>'>
</form>
<br>
<input class="btn btn-default" type="button" value="글쓰기" onclick="self.location='/board/insert'">

</div>
</main>
<%@ include file="../includes/commonscript.jsp" %>
<script>
var actionForm = $("#actionForm");
$(".paginate_button a").on("click", function(e){
	
	e.preventDefault(); // <a href="${num }">${num }</a> 태그를 클릭해도 이동이 없도록 하는 메소드
	
	// 여기서 this 는 .pagination_button a 이다 이 태그의 href의 속성 value 를  가져와서 input에 값에 추가해 준다.
	actionForm.find("input[name='pageNum']").val($(this).attr("href")); 
	actionForm.submit();
});
</script>
<%@ include file="../includes/footer.jsp" %>