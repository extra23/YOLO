<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
</head>
<body>

	<div id="moduleHeader">
		
		<div id="moduleTitle">
			<a href="modulePage?moduleId=${moduleAndTopic.module.moduleId}"><h1>${moduleAndTopic.module.mTitle}</h1></a>
		</div>
		
		<div id="moduleSummary">${moduleAndTopic.module.mSummary}</div>
		
		<div id="btns">
			<button>공동참여</button>
			<button>새로운 모듈 생성</button>
			<c:if test="${authUser.userId eq moduleAndTopic.user.userId}">
				<button>모듈 수정</button>
			</c:if>
			<c:if test="${not (moduleAndTopic.module.courseId eq 0)}">
				<button>관련 코스 보러가기</button>
			</c:if>
		</div>
		
	</div>

</body>
</html>