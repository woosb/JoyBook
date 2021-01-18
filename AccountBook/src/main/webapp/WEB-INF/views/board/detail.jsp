<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../includes/header.jsp" %>
<main role="main">
	<div class="container" align="center" style="margin:20px 0px;">
		<div id="detail">
			
		</div>
		<div class="col-md-12" style="margin:0 auto;">
			<div class="card mb-4 shadow-sm">
				<div class="card-body">
					댓글 : <input type="text" style="width:400px;" name="content" id="content">
					<input type="button" id="replyBtn" onclick="reply();" value="reply">
					<input type="hidden" id="id" name="id" value="${id }">
					<br><hr>
					<div class="col-md-12" style="margin:0 auto;">
						<div class="card mb-4 shadow-sm">
							<div class="card-body" id="detail2" style="text-align:left; padding:20px;">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<button class="btn btn-dark" onclick="self.location='/board/list'">뒤로가기</button>
	</div>
</main>
<%@ include file="../includes/commonscript.jsp" %>
<script>
function reply(){
	var content = document.getElementById("content").value;	
	var vo = {"content" :content, "id" : "${id }"};
	console.log(vo);
	$.ajax({
		url:"/board/reply",
		type:"post",
		data:JSON.stringify(vo),
		dataType:"json",
		contentType:"application/json; charset=utf-8"
	}).done(function(result){
		$("#content").val("");
		reset();
	});
}

reset();
function reset(){
	$.ajax({
		url:"/board/detailContents/"+'${id}'
	}).done(function(result){
		var detail = document.getElementById("detail");
		var str = "";
		str += '<div class="col-md-12" style="margin:0 auto;">'
		str += '<div class="card mb-4 shadow-sm">';
		if(result.thumbnail == ""){
			str += '<img src="/download/default/default.png" width="70%" height="70%" style="margin:0 auto;"/>';
		}else{
			str += '<img src="'+ result.thumbnail+'" width="70%" height="70%" style="margin:0 auto;"/>';
		}
		str += '<div class="card-body">';
		str += '<p class="card-text">'+result.cardText + '<br><hr>'
		str += '<h1>'+result.title+'</h1><hr>'+ result.content
		str += '<br><small class="text-muted"> 조회수 '+ result.hit + '&nbsp;';
		str += '<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-emoji-heart-eyes" viewBox="0 0 16 16"><path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/><path d="M11.315 10.014a.5.5 0 0 1 .548.736A4.498 4.498 0 0 1 7.965 13a4.498 4.498 0 0 1-3.898-2.25.5.5 0 0 1 .548-.736h.005l.017.005.067.015.252.055c.215.046.515.108.857.169.693.124 1.522.242 2.152.242.63 0 1.46-.118 2.152-.242a26.58 26.58 0 0 0 1.109-.224l.067-.015.017-.004.005-.002zM4.756 4.566c.763-1.424 4.02-.12.952 3.434-4.496-1.596-2.35-4.298-.952-3.434zm6.488 0c1.398-.864 3.544 1.838-.952 3.434-3.067-3.554.19-4.858.952-3.434z"/></svg>';
		str += '&nbsp;'+result.recommend+'&nbsp;'
		str += '댓글 '+result.answerNum+'</small></p>'
		str += '<div class="d-flex justify-content-between align-items-center">';
		str += '<div class="btn-group">';
		str += '<a href="/board/detail/'+result.id+'"class="btn btn-sm btn-outline-secondary">View</button>';
		str += '<a href="/board/modify/'+result.id+'" class="btn btn-sm btn-outline-secondary">Edit</a>';
		str += '<button onclick="recommend('+${id}+')" class="btn btn-sm btn-outline-secondary">Like  ';
		str += '<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-heart" viewBox="0 0 16 16"><path d="M8 2.748l-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z"/></svg>';
		str += '</button>';
		str += '</div>';
		str += '<small class="text-muted">'+displayTime(result.regDate)+'</small>';
		str += '</div></div></div></div>';
		detail.innerHTML = str;
		console.log(result);
		console.log(displayTime(result.regDate));
	});
	
	$.ajax({
		url:"/board/reply/"+'${id}'
	}).done(function(result){
		var detail2 = document.getElementById("detail2");
		var str = "";
		for(var i = 0; i < result.length; i ++){
			str += '<div style="margin:10px 0;">'
			str += '<span>'+result[i].userId+'</span>'
			str += '&nbsp;&nbsp;<span>'+result[i].content+'</span>'
			str += '<button onclick="removeReply('+result[i].id+')" style="float:right; margin: 0 5px;">x</button>'
			str += '<span style="float:right;">'+displayTime(result[i].regDate)+'</span>'
			str += '</div>'
		}
		detail2.innerHTML = str;
		console.log(result);	
	});
}
</script>
<script>
	function removeReply(id){
		$.ajax({
			url:"/board/reply/"+id,
			type:"delete",
		}).done(function(){
			reset();
		});
	}
	
	function recommend(id){
		$.ajax({
			url:"/board/recommend/"+id,
			type:"put"
		}).done(function(result){
			reset();
		});
	}
</script>

<%@ include file="../includes/footer.jsp" %>