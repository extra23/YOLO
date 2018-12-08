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
		
		<div id="courseTitleDiv">
			<a href="coursePage?courseId=${courseAndModule.course.courseId}" id="courseTitle">${courseAndModule.course.cTitle}</a>
			<img id="costudy" src="${pageContext.request.contextPath}/images/costudy.png" title="공동공부">
			<img id="newCourse" src="${pageContext.request.contextPath}/images/plus.png" title="새로운 코스 생성">
		</div>
		
		<div id="courseSummary">${courseAndModule.course.cSummary}</div>
		
		<div id="btns">
			<c:if test="${authUser.userId eq courseAndModule.user.userId}">
				<button>코스 수정</button>
			</c:if>
		</div>
		
	</div>

</body>
</html>