<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
	
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>

	<link href="https://fonts.googleapis.com/css?family=Baloo+Tamma" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet">

	<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

	<style type="text/css">
		.mainContainer{width: 100%; height: 1000px; background-color: #F7F7F7; text-align: center;}
		.cMain{width: 85%; height: auto; display: inline-block;}
		body{font-family: 'Jua', sans-serif;}
		.cTitle{margin-top: 100px; margin-bottom: 80px;}
		.table{border: 1px solid gray; font-size: 20px;}
		.category{background-color: lightgray; }
	</style>
	
</head>
<body>
	
	<jsp:include page="header3.jsp"></jsp:include>
	
	<div class="mainContainer">
<div class="cMain">
	<div class="cTitle"><h1>모듈 목록</h1></div>
	<div class="cContent">
		<table class="table table-bordered">
			<thead>
			<tr class="category">
				<td width="30%">제목</td>
				<td width="12%">코스 이름</td>
				<td width="10%">관리자</td>
				<td width="40%">모듈 제목</td>
			</tr>
			</thead>
			<tbody class="table-hover">
				<c:forEach var="course" items="${courseListPage}">
				<tr>
					<td>${course.courseId}</td>
					<td>${course.cTitle}</td>
					<td>${course.nickName}</td>
					<td>${course.mTitle}</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>
</div>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>