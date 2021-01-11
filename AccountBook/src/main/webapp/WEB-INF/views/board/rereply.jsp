<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../includes/header.jsp" %>
<div align="center">
	<form action="/board/rereply" method="post">
		<input type="text" name="content">
		<input type="submit">
		<input type="hidden" name="detailId" value=${detailId }>
		<input type="hidden" name="refOrder" value="${vo.refOrder }">
		<input type="hidden" name="parentNum" value="${vo.parentNum }">
		<input type="hidden" name="ref" value="${vo.ref }">
		<input type="hidden" name="step" value="${vo.step }">
	</form>
</div>
<%@ include file="../includes/commonscript.jsp" %>
<%@ include file="../includes/footer.jsp" %>
</body>
</html>