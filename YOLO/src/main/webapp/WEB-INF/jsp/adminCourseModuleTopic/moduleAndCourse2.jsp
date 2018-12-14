<%@ page language="java" isELIgnored="false" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
	<title>토픽의 수정과 삭제를 담당하는 페이지</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/moduleAndCourseCss.css">
</head>
<body>

	<jsp:include page="../header3.jsp"></jsp:include>
	<div id="mAcdiv">
	<ul id="mAcUl" class="nav nav-tabs">
			<li role="presentation" class="active"><a href="#">module</a></li>
			<li role="presentation"><a href="AdminCourseAndModule">course</a></li>
		</ul>
		<br>
	<div id="MorCList">
		<div class="list-group">
		<div class="list-group-item active"><h3 class="text-center">모듈리스트 <a href="AdminModuleAndCourse">
		<img id="writeImg" src="${pageContext.request.contextPath}/images/plus.png" title="새로운 모듈 커버 만들기"></a></h3> </div>
		<c:forEach var="module" items="${moduleList}">
			<a href="moduleCurver.do?moduleId=${module.moduleId}" class="list-group-item"> ${module.mTitle}</a>
		</c:forEach>
		</div>
	</div>
	<div id="Curver">
	<jsp:include page="topicModifyDelete.jsp"></jsp:include>
	</div>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>