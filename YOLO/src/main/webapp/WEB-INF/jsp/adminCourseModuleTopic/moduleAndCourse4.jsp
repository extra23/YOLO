<%@ page language="java" isELIgnored="false" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>moduleAndCourse4 - Course페이지 안에 커버 페이지</title>
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
		<h3 class="text-center">코스리스트 <a href="AdminCourseAndModule" class="glyphicon glyphicon-plus-sign"> </a> </h3>
		
		<ul id="ListUl">
		<c:forEach var="course" items="${courseList}">
			<li><a href="courseCurver?courseId=${course.courseId}"> ${course.cTitle}</a></li>
		</c:forEach>
		</ul>
	</div>
	
	
	<div id="Curver">
	<jsp:include page="courseCurver.jsp"></jsp:include>
	</div>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>