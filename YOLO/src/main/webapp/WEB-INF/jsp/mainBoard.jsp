<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
	
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>YOLO :: mainBoard</title>

	<!-- 공통 : bootstrap & jQuery -->
	<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

	<!-- 글꼴 -->
	<link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet">

	<style>
	
		#contentBody {
			background: #F7F7F7 no-repeat center center fixed;
			-webkit-background-size: cover; 
			-moz-background-size: cover; 
			-o-background-size: cover; 
			background-size: cover;
		}
	
		#mainContent {
			width: 100%;
			font-family: 'Jua', sans-serif;
			text-align: center;
		}

		.menu {
			width: 93%;
			align-content: center;
			margin: 0 auto;
			margin-top: 55px;
			margin-bottom: 55px;
		}

		.course {
			width: 32%;
			height: 850px;
			border-radius: 10px;
			background-color: white;
			float: left;
		}

		.module {
			width: 32%;
			height: 850px;
			border-radius: 10px;
			background-color: white;
			margin: 0 auto;
			display: inline-block;
		}

		.help {
			width: 32%;
			height: 850px;
			border-radius: 10px;
			background-color: white;
			float: right;
		}

		.title {
			font-size: 30px;
			padding-top: 20px;
			padding-bottom: 20px;
			text-align: center;
			text-align: center;
		}

		.box {
			width: 45%;
			height: 200px;
			border: 1px solid lightgray;
			background-color: gainsboro;
			border-radius: 10px;
			float: left;
			margin-left: 16px;
			margin-bottom: 20px;
		}

		.card {
			width: 100%;
			height: 70px;
			background-color: gray;
			border-top-left-radius: 8px;
			border-top-right-radius: 8px;
		}

		.helpBox {
			width: 93%;
			height: 702px;
			background-color: gainsboro;
			border-radius: 10px;
			margin-left: 20px;
			font-size: 18px;
			text-align: center;
		}

		#mainContent h3 {
			margin-top: 0px !important;
		}
		.nameCard {
			float: left;
			text-align: left;
			font-size: 22px;	
			margin-top: 10px;
			margin-left: 10px;
			width: 90%;
		}

		.proImg{
			border-radius: 5px;
		}

		.plus {
			text-decoration: none !important;
			color: #d6d6d6;
			font-size: 50px;
			margin-top: 25%;
		}
	
		.plus:hover {
			text-decoration: none !important;
			color: #3a3a3a;
		}

		.profileLink {
			text-decoration: none!important; 
			color: #d6d6d6;
		}

		.profileLink:hover{
			text-decoration: none !important; color: #3a3a3a;
		}

		.moduleSum {
			padding: 15px;
		}

		.moduleSum a {
			/* margin-top: 20px;
			margin-left: 10px; */
			font-size: 25px;
			/* text-align: left; */
		}
	
		.mSummary {
			/* text-decoration: none !important; */
			color: #3a3a3a;
		}

		.mSummary:hover {
			color: #757575;
		}

		.courseSum {
			padding: 15px;
		}

		.courseSum a {
			/* margin-top: 20px;
			margin-left: 10px; */
			font-size: 25px;
			/* text-align: left; */
		}

		.cSummary {
			/* text-decoration: none !important; */
			color: #3a3a3a;
		}

		.cSummary:hover {
			color: #757575;
		}
		
	</style>
	
</head>
<body id="contentBody" style="-ms-overflow-style: none;">
	
	<jsp:include page="header3.jsp"></jsp:include>
	
	<div id="mainContent">
		
		<div class="menu">
			
			<div class="course">
				
				<p class="title">
					코스<br>
					<small>Course</small>
				</p>
				
				<c:forEach var="courseBox" items="${courseBoxView}" begin="0" end="4">
					<div class="box">
						<div class="card">
							<c:forEach var="user" items="${userList}">
								<c:if test="${courseBox.userId eq user.userId}">
									<div class="nameCard">
										<img class="proImg" src="${pageContext.request.contextPath}/images/${user.thumbnail}" width="45px" height="45px" style="border-radius: 50%;" >
										<a class="profileLink" href="userView?userId=${user.userId}">${user.nickName}</a>
									</div>
								</c:if>
							</c:forEach>
						</div>
						<div class="courseSum">
							<a href="coursePage?courseId=${courseBox.courseId}" class="cSummary">${courseBox.cTitle}</a><br>
							${courseBox.cSummary}
						</div>
					</div>
				</c:forEach>
				<div class="box" style="background-color: gray">
					<div class="card" title="목록보기">
						<a class="plus glyphicon glyphicon-plus" href="${pageContext.request.contextPath}/courseListPage"></a>
					</div>
				</div>
			</div>
			<div class="module">
				<p class="title">
					모듈<br>
					<small>Module</small>
				</p>
				<c:forEach var="moduleBox" items="${moduleBoxView}" begin="0" end="4">
					<div class="box">
						<div class="card">
							<c:forEach var="user" items="${userList}">
								<c:if test="${moduleBox.userId eq user.userId}">
									<div class="nameCard">
										<img class="proImg" src="${pageContext.request.contextPath}/images/${user.thumbnail}" width="45px" height="45px"  style="border-radius: 50%;">
										<a class="profileLink" href="${pageContext.request.contextPath}/userView?userId=${user.userId}">${user.nickName}</a>
									</div>
								</c:if>
							</c:forEach>
						</div>
						<div class="moduleSum">
							<a href="modulePage?moduleId=${moduleBox.moduleId}" class="mSummary">${moduleBox.mTitle}</a><br>
							${moduleBox.mSummary}
						</div>
					</div>
				</c:forEach>
				<div class="box" style="background-color: gray">
					<div class="card" title="목록보기">
						<a class="plus glyphicon glyphicon-plus" href="${pageContext.request.contextPath}/moduleListPage"></a>
					</div>
				</div>
			</div>
			<div class="help">
				<p class="title">YOLO의 도움말</p>
				<div class="helpBox">
					<br>
					<div>
						<h3>컨텐츠 소비</h3>
						<hr>
						<p>
							컨텐츠 소비 토픽에서는 YOLO에서 지식을 얻는 방법에 대해서 설명드립니다.<br> 공동공부를 통해서 함께
							공부하는 법, 알림을 통해서 관심있는 컨텐츠가<br>만들어졌을 때 소식을 받거나, 자주 방문하는 컨텐츠로
							빠르게 이동<br> 할 수 있습니다.
						</p>
					</div>


					<div>
						<br>
						<h3>컨텐츠 생산</h3>
						<hr>
						<p>
							컨텐츠 생산 토픽에서는 YOLO에 지식을 담는 방법을 알려드립니다.<br> 토픽과 모듈 그리고 코스의
							개념이나 효과적으로 컨텐츠를 조직화 할 수<br> 있습니다.
						</p>
					</div>


					<div>
						<br>
						<h3>토픽 모듈 코스에 대하여</h3>
						<hr>
						<p>
							모듈 그리고 크스라고 하는 개념에 대해서 도움을 드리겠습니다.<br> 토픽이라고 하는 것은 한평의 글입니다.<br>
							만약 블로그 일가 익숙하신 분들은 포스트 하나가 토픽 하나라고 생각하시면<br> 되겠습니다. 토픽들이 모이면
							하나의 모듈이라고 할 수 있습니다.<br> 그리고 모듈이 모이면 코스가 됩니다.
						</p>
						<br>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<jsp:include page="footer.jsp"></jsp:include>
	
</body>
</html>