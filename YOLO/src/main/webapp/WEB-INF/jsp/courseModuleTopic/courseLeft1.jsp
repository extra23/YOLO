<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	
	<style>
	
		#courseLeft1, #courseLeft1 div {
			border: 1px solid black;
			margin: 20px;
		}
		
		#courseLeft1 div {
			padding: 10px;
		}
	
	</style>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script>
		$(function(){
			$(".mTitle").hover(
				function(){
					alert("보이기");
				},
				function(){
					alert("안보이기");
				}
			)
		})
	</script>
	
</head>
<body>

	<div id="courseLeft1">
	
		<div id="userInfo">
			<img src="${pageContext.request.contextPath}/images/profileImageBasic.png" style="width: 50px; height: 50px; border-radius: 50%;"><br>
			<a href="getUser.do?email=${courseAndModule.user.email}">${courseAndModule.user.nickName}</a><br>
			${courseAndModule.user.email}<br>
			<c:if test="${authUser.userId eq courseAndModule.user.userId}">
				<a href="modifyUser?userId=${courseAndUser.user.userId}">프로필 수정</a>
			</c:if>
		</div>
		
		<div id="mTitleList">
			<c:forEach var="moduleAndTopic" items="${courseAndModule.moduleAndTopicList}" varStatus="status">
				<form action="moduleInCoursePage" style="display: inline-block;">
					<input type="submit" value="${moduleAndTopic.module.mTitle}" class="mTitle">
					<input type="hidden" name="courseId" value="${param.courseId}">
					<input type="hidden" name="moduleAndTopicIndex" value="${status.index}">
				</form>
				<div id="tTitle${status.index}" style="display: none;">
					<c:forEach var="topic" items="${moduleAndTopic.topicList}" varStatus="status">
						<form action="topicInCoursePage">
							<input type="submit" value="${topic.tTitle}">
							<input type="hidden" name="courseId" value="${param.courseId}">
							<input type="hidden" name="moduleId" value="${moduleAndTopic.module.moduleId}">
							<input type="hidden" name="topicIndex" value="${status.index}">
						</form>
					</c:forEach>
				</div>
			</c:forEach>
		</div>
	
	</div>

</body>
</html>