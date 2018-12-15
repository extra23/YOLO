<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<!--  -->
<link href="https://fonts.googleapis.com/css?family=Jua"
	rel="stylesheet">


<link href="https://fonts.googleapis.com/css?family=Baloo+Tamma"
	rel="stylesheet">

<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

		<link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet">
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
.mTitle{color: black;}
.mTitle:hover{text-decoration: none; color: #5a5a5a;}
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
					<table class="table table-striped table-hover"
						style="border: 1px solid white !important">
						<thead>
							<tr class="category" style="border: 1px solid white !important">
								<td width="5%">번호</td>
								<td width="30%">제목</td>
								<td width="30%">연관 코스</td>
								<td width="5%">공개/비공개</td>
							</tr>
						</thead>
						<tbody class="table-hover">
							<c:forEach var="module" items="${moduleMap.values()}"
								varStatus="status">
								<tr>
									
									<td>${status.count}</td>
									<td><a class="mTitle" href="${pageContext.request.contextPath}/modulePage?moduleId=${module.moduleId}">${module.mTitle}</a></td>
									<td>
									<c:forEach var="cTitle" items="${module.cTitleList}">
										${cTitle} 
									</c:forEach></td>
									<td>체크박스</td>
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