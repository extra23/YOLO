<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="dt" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>


<link href="https://fonts.googleapis.com/css?family=Jua"
	rel="stylesheet">
<!--  -->

<link href="https://fonts.googleapis.com/css?family=Baloo+Tamma"
	rel="stylesheet">

	<!-- 공통 : bootstrap & jQuery -->
	<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

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
.text_de{color: black;}
.text_de:hover{text-decoration: none!important; color: #5a5a5a!important;}
</style>
</head>
<body>
	<jsp:include page="header3.jsp"></jsp:include>
	<div class="mainContainer">
		<div class="mMain">
			<div id="mTitle" style="font-family: 'Baloo Tamma', cursive;">
				<h1 id="mlist" style="font-size: 80px;">Course list</h1>
			</div>
			<div class="mContent">
				<form>
					<table class="table table-striped table-hover"
						style="border: 1px solid white !important">
						<thead>
							<tr class="category" style="border: 1px solid white !important">
								<td width="5%">번호</td>
								<td width="20%">제목</td>
								<td width="10%">작성자</td>
								<td width="10%">마지막 수정일</td>
								<td width="30%">연관 모듈</td>
							</tr>
						</thead>
						<tbody class="table-hover">
							<c:forEach var="course" items="${courseListPage}">
								<tr>
									<td>${course.courseId}</td>
									<td><a class="text_de" href="${pageContext.request.contextPath}/coursePage?courseId=${course.courseId}">${course.cTitle}</a></td>
									<td><a class="text_de" href="${pageContext.request.contextPath}/userView?userId=${course.userId}">${course.nickName}</a></td>
									<td>
									<dt:formatDateTime value="${course.udate}" pattern="YYYY-MM-dd HH:mm"/>
									</td>
									<td>
									<c:forEach var="module" items="${module}">
										<c:if test="${course.courseId eq module.courseId}">
										<a class="text_de" href="${pageContext.request.contextPath}/modulePage?moduleId=${module.moduleId}">${module.mTitle}</a>
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