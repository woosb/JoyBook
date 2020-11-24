<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
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
  
	<sec:authorize access="isAnonymous()">
	<!-- 	<P>로그인하세요 !</P>
		<button id="signInBtn">로그인</button>
		<button id="signUpBtn">회원가입</button> -->
		<c:out value="${ serverTime}"/>
	</sec:authorize>
			
	<sec:authorize access="isAuthenticated()">
	 	<sec:authentication property="principal.username" var="user_id" />
	       <div id="user_id"> ${user_id }님 안녕하세요.</div>
	</sec:authorize>
<%@ include file="includes/footer.jsp" %>
</body>
</html>
