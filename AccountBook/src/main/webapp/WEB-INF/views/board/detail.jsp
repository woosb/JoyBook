<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<sec:authentication var="principal" property="principal" />
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
		<c:forEach var = "reply" items="${reply }" >
		<c:choose>
		<c:when test = "${reply.step eq 1 }">
		<tr>
			<th><c:out value="${reply.userId }"/></th>
			<td>
				<a href="/board/rereply?ref=${reply.ref }&parentNum=${reply.id }&refOrder=${reply.refOrder}&step=${reply.step}&detailId=${detail.id}" onclick="insertReply()">
					<c:out value="${reply.content}"/>
				</a>
			</td>
			<td><c:out value="${reply.regDate}"/></td>
			<td>id : <c:out value="${reply.id}"/></td>
			<td>ref : <c:out value="${reply.ref}"/></td>
			<td>step : <c:out value="${reply.step}"/></td>
			<td>refOrder : <c:out value="${reply.refOrder}"/></td>
			<td>asNum : <c:out value="${reply.answerNum}"/></td>
			<td>prNum : <c:out value="${reply.parentNum}"/></td>
		</tr>
		</c:when>
		<c:when test = "${reply.step > 1 }">
		<tr>
			<th><c:out value="${reply.userId }"/></th>
			<td>
				<c:forEach var="i" begin="1" end="${reply.step-1}">
					->re
				</c:forEach>
			</td>
			
			<td>
				<a href="/board/rereply?ref=${reply.ref }&parentNum=${reply.id }&refOrder=${reply.refOrder}&step=${reply.step}&detailId=${detail.id}" onclick="insertReply()">
					<c:out value="${reply.content}"/>
				</a>
			</td>
			<td><c:out value="${reply.regDate}"/></td>
			<td>id : <c:out value="${reply.id}"/></td>
			<td>ref : <c:out value="${reply.ref}"/></td>
			<td>step : <c:out value="${reply.step}"/></td>
			<td>refOrder : <c:out value="${reply.refOrder}"/></td>
			<td>asNum : <c:out value="${reply.answerNum}"/></td>
			<td>prNum : <c:out value="${reply.parentNum}"/></td>
		</tr>
		</c:when>
		</c:choose>	
		</c:forEach>
	</table>
	<br>
	<button onclick="self.location='/board/delete?id='+${detail.id}">삭제</button>
	<button onclick="self.location='/board/modify?id='+${detail.id}">수정</button>
	<button onclick="self.location='/board/list'">뒤로가기</button>
	<button onclick="self.location='/board/recommend?id=${detail.id}&ref=${detail.ref }'">추천하기</button>
	<form action="/board/reply" method="post">
		댓글달기 : <input type="text" name="content">
		<input type="hidden" value="${detail.id }" name="id">
		<input type="hidden" value="${detail.ref }" name="ref">
		<input type="hidden" value="${detail.step }" name="step">
		<input type="hidden" value="${detail.refOrder }" name="refOrder">
		<input type="hidden" value="${detail.answerNum }" name="answerNum">
		<input type="hidden" value="${detail.parentNum }" name="parentNum">
		<input type="submit">
		<input type='hidden' name="${_csrf.parameterName }" value="${_csrf.token }"/>
	</form>
</div>

<%@ include file="../includes/footer.jsp" %>
</body>
</html>