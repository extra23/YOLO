<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
.mMain{width: 85%; height: auto; display: inline-block;}
body{font-family: 'Jua', sans-serif;}
.mTitle{margin-top: 100px; margin-bottom: 80px;}
.table{border: 1px solid gray; font-size: 20px;}
.category{background-color: lightgray; }
</style>
</head>
<body><%-- 
<jsp:include page="header3.jsp"></jsp:include> --%>
<div class="mainContainer">
<div class="mMain">
	<div class="mTitle"><h1>모듈 목록</h1></div>
	<div class="mContent">
	<form>
		<table class="table table-bordered">
			<thead>
			<tr class="category">
				<td width="30%">제목</td>
				<td width="12%">관리자</td>
				<td width="10%">토픽수</td>
				<td width="15%">마지막 저장날짜</td>
				<td width="40%">사용중인 코스</td>
			</tr>
			</thead>
			<tbody class="table-hover">
				<c:forEach var="module" items="${moduleList}">
				<tr>
					<td>${module.mTitle}</td>
					<td>${module.nickName}</td>
					<td></td>
					<td>${module.mdate}</td>
					<td></td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
		</form>
	</div>
</div>
</div>
<%-- 
<jsp:include page="footer.jsp"></jsp:include> --%>
</body>
</html>