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
<%@ include file="includes/header.jsp" %>
  <h1>index.jsp</h1>
  <c:out value="${name }"/>
  ${serverTime }
		<c:out value="${ serverTime}"/>
			
       <div> ${sessionScope.userId }님 안녕하세요.</div>

<%@ include file="includes/footer.jsp" %>
</body>
</html>
