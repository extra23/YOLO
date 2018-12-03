<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<style>
		
		#moduleLeft, #moduleLeft div {
			border: 1px solid black;
			margin: 20px;
		}
		
		#moduleLeft div {
			padding: 10px;
		}
		
	</style>
</head>
<body>

	<div id="moduleLeft">
		
		<div id="userInfo">
			<img src="${pageContext.request.contextPath}/images/profileImageBasic.png" style="width: 50px; heigth: 50px; border-radius: 50%;"><br>
				${moduleAndTopic.user.nickName}<br>
				${moduleAndTopic.user.email}
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