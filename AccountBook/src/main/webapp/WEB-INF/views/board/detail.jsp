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
	<h1>글 내용</h1>
	<table border="1">
		<tr>
			<th>제목</th>
			<td>${detail.title}</td>
			<th>글쓴이</th>
			<td>${detail.userId}</td>
			<th>조회수</th>
			<td>${detail.hit}</td>
			<th>추천</th>
			<td>${detail.recommend}</td>
		</tr>
		<tr>
			<th>내용</th>
			<td colspan="7"><textarea name="content"  style="width: 1000px;height: 100px;" readonly>${detail.content }</textarea></td>
		</tr>
		<tr>
			<th>작성일</th>
			<td colspan="7">${detail.regDate}</td>
		</tr>
		<tr>
			<th>수정일</th>
			<td colspan="7">${detail.updateDate}</td>
		</tr>
		<tr>
			<th colspan="8">댓글</th>
		</tr>
		<tr>
			<td colspan="8">
				<ul id="replyUL"></ul>
			</td>
		</tr>
	</table>
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

<%@ include file="../includes/footer.jsp" %>
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
</body>
</html>