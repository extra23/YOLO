<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>


<link href="https://fonts.googleapis.com/css?family=Jua"
	rel="stylesheet">


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
.mainContainer {
	width: 100%;
	height: 1000px;
	text-align: center;
	margin-bottom: 20px;
	margin-top: 20px;
}

.mMain {
	width: 85%;
	height: auto;
	display: inline-block;
}

#mTitle{
	margin-top: 20px;
	margin-bottom: 20px;
}

td {
	border: 1px solid white !important
}

.mContent {
	font-family: 'Jua', sans-serif;
	margin-top: 15px;
}

body {
	font-family: 'Jua', sans-serif;
}

#mlist {
	font-size: 80px;
	margin: 0 auto;
	width: 500px;
	text-align: center;
	margin-top: 20px;
	margin-bottom: 20px;
}

.table {
	border: 1px solid gray;
	font-size: 20px;
}

.category {
	background-color: lightgray;
}
</style>
</head>
<body>
	<jsp:include page="header3.jsp"></jsp:include>
	<div class="mainContainer">
		<div class="mMain">
			<div id="mTitle" style="font-family: 'Baloo Tamma', cursive;">
				<h1 id="mlist" style="font-size: 80px;">Module list</h1>
			</div>
			<div class="mContent">
				<form>
					<table class="table table-striped"
						style="border: 1px solid white !important">
						<thead>
							<tr class="category" style="border: 1px solid white !important">
								<td width="10%">번호</td>
								<td width="25%">제목</td>
								<td width="15%">작성자</td>
								<td width="15%">최근 수정 날짜</td>
								<td width="20%">연관 코스</td>
							</tr>
						</thead>
						<tbody class="table-hover">
							<c:forEach var="module" items="${moduleListPage}">
								<tr>
									<td>${module.moduleId}</td>
									<td>${module.mTitle}</td>
									<td>${module.nickName}</td>
									<td>${module.udate}</td>
									<td>${module.cTitle}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</form>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>