<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
</head>
<body>

	<div id="courseLeft1">

		<c:forEach var="moduleAndTopic" items="${courseAndModule.moduleAndTopicList}" varStatus="status">
		
			<div class="mTitle">
				<form action="moduleInCoursePage">
					<input type="submit" value="${moduleAndTopic.module.mTitle}" class="mTitle">
					<input type="hidden" name="courseId" value="${param.courseId}">
					<input type="hidden" name="moduleIndex" value="${status.index}">
				</form>
			</div>
			
			<div class="tTitleList">
				<c:forEach var="topic" items="${moduleAndTopic.topicList}" varStatus="status2">
					<form action="topicInCoursePage">
						<input type="submit" value="${topic.tTitle}">
						<input type="hidden" name="courseId" value="${param.courseId}">
						<input type="hidden" name="moduleIndex" value="${status.index}">
						<input type="hidden" name="topicIndex" value="${status2.index}">
					</form>
				</c:forEach>
			</div>
		
		</c:forEach>
	
	</div>

</body>
</html>