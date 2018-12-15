<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<link href="https://fonts.googleapis.com/css?family=Gamja+Flower" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet">

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
</head>
<body>

	<div id="courseHeader">
		
		<div id="courseTitle">
			<a href="coursePage?courseId=${courseAndModule.course.courseId}" style="font-family: 'Gamja Flower', cursive;font-weight: bold;color: white;">&lt; ${courseAndModule.course.cTitle} &gt;</a>
			<div id="courseSummary">${courseAndModule.course.cSummary}</div>
		</div>

		<c:if test="${authUser.userId eq courseAndModule.user.userId}">
			<img id="newCourse" src="${pageContext.request.contextPath}/images/plus.png" title="새로운 코스 생성">		
		</c:if>
		
		<c:if test="${not empty authUser}">
			<c:if test="${costudy_courseId eq 0}">
				<img id="costudy" src="${pageContext.request.contextPath}/images/outcostudy.png" title="공동공부" onclick="courseHeader(${courseAndModule.course.courseId}, ${courseAndModule.user.userId})">
			</c:if>
			<c:if test="${costudy_courseId > 0}">
				<img id="costudy" src="${pageContext.request.contextPath}/images/incostudy.png" title="공동공부" onclick="courseHeader(${courseAndModule.course.courseId}, ${courseAndModule.user.userId})">
			</c:if>
		</c:if>
		
		<c:if test="${authUser.userId eq courseAndModule.user.userId}">
			<img id="edit" src="${pageContext.request.contextPath}/images/edit.png" title="코스 수정" onclick="courseHeader(${courseAndModule.course.courseId})">
		</c:if>
		
	</div>

</body>
</html>