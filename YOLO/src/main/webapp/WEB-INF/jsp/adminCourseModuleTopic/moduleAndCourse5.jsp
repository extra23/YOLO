<%@ page language="java" isELIgnored="false" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>moduleAndCourse5 - Course페이지 안에 moduleList 페이지</title>
	<style>
		#mAcdiv{
		    margin-left: 10%;
   			margin-top: 5%;
    		width: 82%;
		}
	
		#courseList{
			float: left;
			border: 1px solid lightgray;
			width: 200px;
			height: 657px;
			
		}
		
		#courseListUl{
			list-style: none;
			
		}
		 
		#courseCreateDiv{
			width: 1000px;
			height: 1000px;
			border: 1px solid black;
			display: inline;
		} 
		
		#moduleListCurver{
			display: inline;
			
		}

		
		
		
	</style>
	

</head>
<body>

	<jsp:include page="../header3.jsp"></jsp:include>
	<div id="mAcdiv">
	<ul class="nav nav-tabs">
			<li role="presentation" ><a href="AdminModuleAndCourse">module</a></li>
			<li role="presentation" class="active"><a href="#">course</a></li>
		</ul>
		<br>
	<div id="courseList">
		<h3 class="text-center">코스 리스트 <a href="AdminCourseAndModule" class="glyphicon glyphicon-plus-sign"> </a> </h3>
		
		<ul id="courseListUl">
		<c:forEach var="course" items="${courseList}">
			<li><a href="courseCurver?courseId=${course.courseId}"> ${course.cTitle}</a></li>
		</c:forEach>
		</ul>
	</div>
	
	
	<div id="moduleListCurver">
	<jsp:include page="ModuleList.jsp"></jsp:include>
	</div>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>