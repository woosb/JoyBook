<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../includes/header.jsp" %>
<main role="main">
<div class="container" style="margin: 20px 0px;">
<h1>검색 결과</h1>
		<input class="btn btn-secondary" type="button" value="Add More" onclick="self.location='/board/insert'">
<hr>
	<div class="row" id="contents">
        
    </div>  
<div>
	<ul class="pagination justify-content-center">
		<c:if test="${pageMaker.prev}">
			<li class="page-item"><a class="page-link" href="${pageMaker.startPage -1 }">Previous</a></li>
		</c:if>
		<c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage}">
			<li class="page-item"><a class="page-link" href="/board/list?pageNum=${num }"><c:out value="${num }"/></a><li>
		</c:forEach>
		<c:if test="${pageMaker.next }">
			<li class="page-item"><a class="page-link" href="${pageMaker.endPage + 1 }">Next</a></li>
		</c:if>
	</ul>
</div>
<form id="actionForm" action="/board/list" method="get">
	<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
	<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
	<input type="hidden" name='type' value='<c:out value="${pageMaker.cri.type }"/>'>
	<input type="hidden" name="keyword" value='<c:out value="${pageMaker.cri.keyword }"/>'>
</form>
<br>
</div>
</main>
<%@ include file="../includes/commonscript.jsp" %>
<%-- <jsp:include page="/WEB-INF/views/includes/commonscript.jsp"/> --%>

<script>
getContents();
function getContents(){
	$.ajax({
		url:"/board/search/"+"${keyword }",
		contentType:"JSON"		
	}).done(function(result){
		console.log(result);
		var contents = document.getElementById("contents");
		for(var i = 0; i < result.length; i ++){
			var str = "";
			var card = document.createElement("div");
			card.setAttribute("class", "col-md-4");
			str += '<div class="card mb-4 shadow-sm">';
			if(result[i].thumbnail == ""){
				str += '<img src="/download/default/default.png" width="100%" height="100%"/>';
			}else{
				str += '<img src="'+ result[i].thumbnail+'" width="100%" height="100%"/>';
			}
			str += ' <div class="card-body">';
			str += '<p class="card-text">'+result[i].cardText
			str += '<br><small class="text-muted"> 조회수 '+ result[i].hit + '&nbsp;';
			str += '<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-emoji-heart-eyes" viewBox="0 0 16 16"><path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/><path d="M11.315 10.014a.5.5 0 0 1 .548.736A4.498 4.498 0 0 1 7.965 13a4.498 4.498 0 0 1-3.898-2.25.5.5 0 0 1 .548-.736h.005l.017.005.067.015.252.055c.215.046.515.108.857.169.693.124 1.522.242 2.152.242.63 0 1.46-.118 2.152-.242a26.58 26.58 0 0 0 1.109-.224l.067-.015.017-.004.005-.002zM4.756 4.566c.763-1.424 4.02-.12.952 3.434-4.496-1.596-2.35-4.298-.952-3.434zm6.488 0c1.398-.864 3.544 1.838-.952 3.434-3.067-3.554.19-4.858.952-3.434z"/></svg>';
			str += '&nbsp;'+result[i].recommend+'&nbsp;'
			str += '댓글 '+result[i].answerNum+'</small></p>'
			str += '<div class="d-flex justify-content-between align-items-center">';
			str += '<div class="btn-group">';
			str += '<a href="/board/detail/'+result[i].id+'"class="btn btn-sm btn-outline-secondary">View</a>';
			str += '<a href="/board/modify/'+result[i].id+'" class="btn btn-sm btn-outline-secondary">Edit</a>';
			str += '</div>';
			str += '<small class="text-muted">'+displayTime(result[i].regDate)+'</small>';
			str +='</div></div></div>';
			card.innerHTML = str;
			contents.appendChild(card);
		}
	});
}

</script>
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