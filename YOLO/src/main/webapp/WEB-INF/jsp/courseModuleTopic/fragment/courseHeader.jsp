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
			<a href="coursePage?courseId=${courseAndModule.course.courseId}"><h1>${courseAndModule.course.cTitle}</h1></a>
		</div>
		
		<div id="courseSummary">${courseAndModule.course.cSummary}</div>
		
		<div id="btns">
			<button>공동참여</button>
			<button>새로운 코스 생성</button>
			<c:if test="${authUser.userId eq courseAndModule.user.userId}">
				<button>코스 수정</button>
			</c:if>
		</div>
		
	</div>

</body>
</html>