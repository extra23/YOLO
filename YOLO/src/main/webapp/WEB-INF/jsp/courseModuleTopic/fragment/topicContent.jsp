<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
</head>
<body>

	<div id="topicContent">
		
		<div id="tTitle"><h2>${topic.tTitle}</h2></div>
		
		<hr>
		
		<div id="tContent">${topic.tContent}</div>
		
		<div id="historyDiv">
			<c:if test="${not empty authUser}">
				<hr>
				<c:if test="${historyId eq 0}">
					<img id="history" src="${pageContext.request.contextPath}/images/notSee.png" title="봤어요" onclick="history(${topic.topicId}, ${authUser.userId})">
				</c:if>
				<c:if test="${historyId > 0}">
					<img id="history" src="${pageContext.request.contextPath}/images/see.png" title="봤어요" onclick="history(${topic.topicId}, ${authUser.userId})">
				</c:if>
			</c:if>
		</div>
		
	</div>

</body>
</html>