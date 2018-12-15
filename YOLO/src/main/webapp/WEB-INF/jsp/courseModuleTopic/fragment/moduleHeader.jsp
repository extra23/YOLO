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
			<a href="modulePage?moduleId=${moduleAndTopic.module.moduleId}">${moduleAndTopic.module.mTitle}</a>
			<div id="moduleSummary">${moduleAndTopic.module.mSummary}</div>
		</div>
		
		<c:if test="${authUser.userId eq moduleAndTopic.user.userId}">
			<img id="newModule" src="${pageContext.request.contextPath}/images/plus.png" title="새로운 모듈 생성">		
		</c:if>
		
		<%-- <c:if test="${not empty authUser}">
			<c:if test="${costudy_moduleId eq 0}">
				<img id="costudy" src="${pageContext.request.contextPath}/images/outcostudy.png" title="공동공부">
			</c:if>
			<c:if test="${costudy_moduleId > 0}">
				<img id="costudy" src="${pageContext.request.contextPath}/images/incostudy.png" title="공동공부">
			</c:if>
		</c:if> --%>
		
		<img id="costudy" src="${pageContext.request.contextPath}/images/outcostudy.png" title="공동공부" onclick="moduleHeader(${moduleAndTopic.module.moduleId}, ${moduleAndTopic.user.userId})">
		
		<c:if test="${authUser.userId eq moduleAndTopic.user.userId}">
			<img id="edit" src="${pageContext.request.contextPath}/images/edit.png" title="모듈 수정">
		</c:if>
		
		<%-- <div id="btns">
			<button>공동참여</button>
			<button>새로운 모듈 생성</button>
			<c:if test="${authUser.userId eq moduleAndTopic.user.userId}">
				<button>모듈 수정</button>
			</c:if>
			<c:if test="${not (moduleAndTopic.module.courseId eq 0)}">
				<button>관련 코스 보러가기</button>
			</c:if>
		</div> --%>
		
	</div>

</body>
</html>