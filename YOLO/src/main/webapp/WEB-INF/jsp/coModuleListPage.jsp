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

<!-- 공통 : bootstrap & jQuery -->
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>

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

#mTitle {
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
				<h1 id="mlist" style="font-size: 80px;">Co-Study : Module</h1>
			</div>
			<div class="mContent">
				<form>
					<table class="table table-striped"
						style="border: 1px solid white !important">
						<thead>
							<tr class="category" style="border: 1px solid white !important">
								<td width="5%">번호</td>
								<td width="20%">모듈 이름</td>
								<td width="10%">작성자</td>
								<td width="30%">연관 코스</td>

							</tr>
						</thead>
						<tbody class="table-hover">
							<c:forEach var="module" items="${coModuleList}" varStatus="state">
								<tr>
									<td>${state.count}</td>
									<td><a href="${pageContext.request.contextPath}/modulePage?moduleId=${module.moduleId}" style="color: black;">${module.mTitle}</a></td>
									<td>${module.nickname}</td>
									<td>
										<c:forEach var="coLink" items="${module.coLinks}" varStatus="states">
												
										<a href="${pageContext.request.contextPath}/coursePage?courseId=${coLink.courseId}" style="color: black;">${coLink.cTitle}</a>
												
											<c:if test="${coLink.cTitle eq null}">
												-
											</c:if> 
										</c:forEach>
									</td>
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