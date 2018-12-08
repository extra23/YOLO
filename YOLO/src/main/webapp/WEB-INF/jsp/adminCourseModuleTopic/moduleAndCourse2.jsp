<%@ page language="java" isELIgnored="false" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
	<title>Insert title here</title>
	<style>
		#moduleList{
			float: left;
			border: 1px solid lightgray;
			width: 200px;
			height: 500px;
		}
		
		#moduleListUl{
			list-style: none;
		}
		 
		#topicModifyDelete{
			display: inline;
			
		}
		
	</style>
</head>
<body>

	<jsp:include page="../header3.jsp"></jsp:include>
	<ul class="nav nav-tabs">
			<li role="presentation" class="active"><a href="#">module</a></li>
			<li role="presentation"><a href="#">course</a></li>
		</ul>
		<br>
	<div id="moduleList">
		<h3 class="text-center">모듈리스트 <a href="#"> <i class="glyphicon glyphicon-plus-sign
		"></i></a> </h3>
		
		<ul id="moduleListUl">
		<c:forEach var="module" items="${moduleList}">
			<li><a href="moduleCurver.do?moduleId=${module.moduleId}"> ${module.mTitle}</a></li>
		</c:forEach>
		</ul>
	</div>
	<div id="topicModifyDelete">
	<jsp:include page="topicModifyDelete.jsp"></jsp:include>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>