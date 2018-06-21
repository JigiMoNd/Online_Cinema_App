<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<c:choose>
	<c:when test="${ title == null }">
		<tiles:putAttribute name="title" value="App Title"></tiles:putAttribute>
	</c:when>
	
	<c:otherwise>
		<tiles:putAttribute name="title" value="${ title }"></tiles:putAttribute>
	</c:otherwise>
	
</c:choose>

<title>
	<tiles:getAsString name="title"/>
</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
</head>
<body>
	
	<script src="${pageContext.request.contextPath}/resources/js/vue.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/axios.min.js"></script>
	

	<tiles:insertAttribute name="header"/>
		<div class="container">
			
			<tiles:insertAttribute name="body"/>
				
		</div>
	<tiles:insertAttribute name="footer"/>

</body>
</html>