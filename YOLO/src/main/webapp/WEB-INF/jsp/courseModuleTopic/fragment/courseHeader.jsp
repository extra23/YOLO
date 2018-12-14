<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
</head>
<body>

	<div id="courseHeader">
		
		<div id="courseTitle">
			<a href="coursePage?courseId=${courseAndModule.course.courseId}">${courseAndModule.course.cTitle}</a>
			<div id="courseSummary">${courseAndModule.course.cSummary}</div>
		</div>

		<c:if test="${authUser.userId eq courseAndModule.user.userId}">
			<img id="newCourse" src="${pageContext.request.contextPath}/images/plus.png" title="새로운 코스 생성">		
		</c:if>
		<img id="costudy" src="${pageContext.request.contextPath}/images/costudy.png" title="공동공부" onclick="costudyCourse(${courseAndModule.course.courseId}, ${courseAndModule.user.userId})">
		<c:if test="${authUser.userId eq courseAndModule.user.userId}">
			<img id="edit" src="${pageContext.request.contextPath}/images/edit.png" title="코스 수정">
		</c:if>
		
	</div>

</body>
</html>