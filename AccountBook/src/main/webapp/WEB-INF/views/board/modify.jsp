<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../includes/header.jsp" %>
<div align="center">
	<h1>수정하기</h1>
	<form action="/board/modify" method="post">
		<table border="1">
			<tr>
				<th>제목</th>
				<td><input type="text" value="${vo.title}" name="title" style="width:1000px;"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td colspan="7"><textarea name="content" style="width:1000px; height: 100px;">${vo.content }</textarea></td>
			</tr>
		</table>
		<input type="hidden" name="id"	value="${vo.id }">
		<input type="submit" value="수정">
	</form>
	<br><hr>
	<button onclick="self.location='/board/list'">뒤로가기</button>
	<form action="board/recommend" method="post">
		<button type="submit"><c:out value="${userId}"/> 추천하기</button>
	</form>
</div>
<%@ include file="../includes/commonscript.jsp" %>
<%@ include file="../includes/footer.jsp" %>