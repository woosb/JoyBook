<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../includes/header.jsp" %>
<main role="main">
	<div align="center">
		<div class="table-responsive" style="padding:30px 30px;">
		<h1>프로그래밍 갤러리</h1>
		<hr>
		<article>
			<div class="blog-post">
			<header>
				<div class="content_head_left">
					<h3>${detail.title}</h3>
					<div class="writer">
						<span>${detail.userId}</span>
						<span>${detail.regDate}</span>
						<span>${detail.updateDate}</span>
					</div>
				</div>
				<div class="content_head_right">
					<div class="content">
						<span>조회 ${detail.hit}</span>
						<span>추천 ${detail.recommend}</span>
						<span>댓글 </span>
					</div>
				</div>
			</header>
			<hr>
			<div class="contents">
				<p>${detail.content }</p>	
			</div>
			</div>
		</article>
		<hr>
		<ul id="replyUL"></ul>
		<br>
		<button onclick="self.location='/board/delete?ref='+${detail.ref}">삭제</button>
		<button onclick="self.location='/board/modify?id='+${detail.id}">수정</button>
		<button onclick="self.location='/board/list'">뒤로가기</button>
		<button onclick="self.location='/board/recommend?id=${detail.id}'">추천하기</button>
		<form id="replyForm">
			댓글달기 : <input type="text" name="content" id="replyContent">
			<input type="button" id="replyBtn" value="댓글작성">
		</form>
		</div>
	</div>
</main>
<%@ include file="../includes/commonscript.jsp" %>
<script type="text/javascript" src="/resources/js/reply.js"></script>
<script>
	$(document).ready(function() {
		var id = "${detail.id}";
		var userId = "${sessionScope.userId}";
		var ref = "${detail.ref}";
		var step = "${detail.step}";
		var refOrder = "${detail.refOrder}";
		var answerNum = "${detail.answerNum}";
		var parentNum = "${detail.parentNum}";
		
		$("#replyBtn").on("click",function(){
			var content = $("#replyContent").val();
			replyService.add(
				{	"content":content, 
					"id":id, 
					"userId":userId,
					"ref":ref, 
					"step":step, 
					"refOrder":refOrder, 
					"answerNum":answerNum, 
					"parentNum":parentNum},
				function(result){
					alert("RESULT : " + result);
				}
			);
			$('#replyContent').val('');
			replyList();
		});
		
		var replyUL = $("#replyUL");
		replyList();
		function replyList(){
			replyService.getList({id : id}, function(list){
				console.log("getList......");
				if(list == null || list.length == 0){
					replyUL.html("");
					return;
				}
				var str = "";
				for(var i = 0, len = list.length ||0; i < len; i++){
					str += "<li>"+list[i].id;
					str += " 작성자 : "+list[i].userId
					str += " 내용 : "+list[i].content
					str += " regDate : "+ replyService.displayTime(list[i].regDate)
					str += " ref : "+ list[i].ref
					str += " refOrder : "+ list[i].refOrder
					str += " parentNum : "+ list[i].parentNum
					str += " step : "+ list[i].step
					str += "</li>";
				}
				replyUL.html(str);
			});
		}
	});
</script>
<%@ include file="../includes/footer.jsp" %>