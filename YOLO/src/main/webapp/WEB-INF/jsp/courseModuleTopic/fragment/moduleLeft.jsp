<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
</head>
<body>

	<div id="moduleLeft">
		
		<div id="userInfo">
			<img src="${pageContext.request.contextPath}/images/profileImageBasic.png" style="width: 50px; heigth: 50px; border-radius: 50%;"><br>
			<a href="userView?userId=${moduleAndTopic.user.userId}">${moduleAndTopic.user.nickName}</a><br>
			${moduleAndTopic.user.email}<br>
			<c:if test="${authUser.userId eq moduleAndTopic.user.userId}">
				<a href="modifyUser?userId=${moduleAndTopic.user.userId}">프로필 수정</a>
			</c:if>
		</div>
		
		<div id="tTitleList">
			<c:forEach var="topic" items="${moduleAndTopic.topicList}" varStatus="status">
				<form action="topicPage">
					<input type="submit" value="${topic.tTitle}">
					<input type="hidden" name="moduleId" value="${param.moduleId}">
					<input type="hidden" name="topicIndex" value="${status.index}">
				</form>	
			</c:forEach>
		</div>
		
	</div>

</body>
</html>