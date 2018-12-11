<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
</head>
<body>

	<div id="courseLeft">
	
		<h4>Module & Topic Menu</h4>
		
		<hr>

		<ul class="nav">

			<c:forEach var="moduleAndTopic" items="${courseAndModule.moduleAndTopicList}" varStatus="status">
			
				<li>
					<a href="moduleInCoursePage?courseId=${param.courseId}&moduleIndex=${status.index}">${moduleAndTopic.module.mTitle}</a>
					<a href="#" class="toggle-custom" id="btn-${status.index}" data-toggle="collapse" data-target="#submenu${status.index}" aria-expanded="false"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span></a>
					<ul class="nav collapse" id="submenu${status.index}" role="menu" aria-labelledby="btn-${status.index}">
						<c:forEach var="topic" items="${moduleAndTopic.topicList}" varStatus="status2">
							<li><a href="topicInCoursePage?courseId=${param.courseId}&moduleIndex=${status.index}&topicIndex=${status2.index}">${status.index}-${topic.tTitle}</a></li>
						</c:forEach>
					</ul>
				</li>
			
			</c:forEach>
		
		</ul>
	
	</div>

</body>
</html>