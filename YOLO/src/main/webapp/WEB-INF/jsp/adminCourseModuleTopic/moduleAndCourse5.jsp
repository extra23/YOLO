<%@ page language="java" isELIgnored="false" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>moduleAndCourse5 - Course페이지 안에 moduleList 페이지</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/moduleAndCourseCss.css">

</head>
<body>

	<jsp:include page="../header3.jsp"></jsp:include>
	<div id="mAcdiv">
	<ul id="mAcUl" class="nav nav-tabs">
			<li role="presentation" ><a href="AdminModuleAndCourse">module</a></li>
			<li role="presentation" class="active"><a href="#">course</a></li>
		</ul>
		<br>
	<div id="MorCList">
		<div class="list-group">
			<div class="list-group-item active"><h3 class="text-center">코스리스트 <a href="AdminCourseAndModule"> 
			<img id="writeImg" src="${pageContext.request.contextPath}/images/plus.png" title="새로운 코스 커버 만들기"></a> </h3></div>
		<c:forEach var="course" items="${courseList}">
			<a href="courseCurver?courseId=${course.courseId}" class="list-group-item"> ${course.cTitle}</a>
		</c:forEach>
		</div>
	</div>
	
	
	<div id="Curver">
	<jsp:include page="ModuleList.jsp"></jsp:include>
	</div>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>