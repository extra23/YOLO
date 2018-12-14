<%@ page language="java" isELIgnored="false" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
	<title>모듈의 커버 보여주는 페이지</title>
	<style>
		#mAcdiv{
		    margin-left: 10%;
   			margin-top: 5%;
    		width: 82%;
		}
	
		#moduleList{
			float: left;
			border: 1px solid lightgray;
			width: 200px;
			height: 657px;
		}
		
		#moduleListUl{
			list-style: none;
		}
		 
		#moduleCurver{
			display: inline;
			
		}
		
	</style>
</head>
<body>

	<jsp:include page="../header3.jsp"></jsp:include>
	
	<div id="mAcdiv">
	<ul class="nav nav-tabs">
			<li role="presentation" class="active"><a href="#">module</a></li>
			<li role="presentation"><a href="AdminCourseAndModule">course</a></li>
		</ul>
		<br>
	<div id="moduleList">
		<h3 class="text-center">모듈리스트 <a href="AdminModuleAndCourse" class="glyphicon glyphicon-plus-sign"></a> </h3>
		
		<ul id="moduleListUl">
		<c:forEach var="module" items="${moduleList}">
			<li><a href="moduleCurver.do?moduleId=${module.moduleId}"> ${module.mTitle}</a></li>
		</c:forEach>
		</ul>
	</div>
	<div id="moduleCurver">
	<jsp:include page="moduleCurver.jsp"></jsp:include>
	</div>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>