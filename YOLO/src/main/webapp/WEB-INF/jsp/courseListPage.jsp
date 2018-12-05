<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!--  -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link href="https://fonts.googleapis.com/css?family=Baloo+Tamma"
	rel="stylesheet">

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<link href="https://fonts.googleapis.com/css?family=Jua"
	rel="stylesheet">
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