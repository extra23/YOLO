<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>searchPage</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<!-- jQuery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- 폰트 -->
<link href="https://fonts.googleapis.com/css?family=Cute+Font|Hi+Melody"
	rel="stylesheet">

<style type="text/css">
.panel-heading {
	font-family: 'Cute Font', cursive;
	font-size: 1.5em;
}

th {
	font-family: 'Cute Font', cursive;
	font-size: 1.5em;
}

tr {
	font-family: 'Hi Melody';
	font-size: 1.3em;
}

#a {
	font-family: 'Hi Melody';
	font-size: 1em;
}

#a:hover {
	color: skyblue;
	font-weight: bold;
}

#am {
	font-family: 'Cute Font', cursive;
	font-size: 1.5em;
}

#am:hover {
	color: #a840ff;
	font-weight: bold;
}
</style>


<script type="text/javascript">
	//네비게이션바 설정
	$(function() {
		$("ul>li").click(function() {
			$("li").removeClass("active")
			$(this).addClass("active")
		})
	})
</script>

</head>
<body>

	<jsp:include page="header3.jsp"></jsp:include>
	<br>
	<div class="container">
		<ul class="nav nav-tabs">
			<li role="presentation"><a href="#user">사용자 이메일</a></li>
			<li role="presentation"><a href="#topic">토픽</a></li>
			<li role="presentation"><a href="#module">모듈</a></li>
			<li role="presentation"><a href="#course">코스</a></li>
		</ul>
		<br>
		<div class="panel panel-default">
			<div class="panel-heading" id="user">
				사용자 이메일 검색 <span class="badge">${userSearchCount}</span>
			</div>

			<table class="table table-bordered">

				<thead>
					<tr>
						<th>프로필 이미지</th>
						<th>닉네임</th>
						<th>이메일</th>
					</tr>
				</thead>
				<tbody>


					<c:forEach var="user" items="${userSearchList}">
						<tr>
							<td>${user.profileImage}</td>
							<td><a id="a" href="getUser.do?email=${user.email}">${user.nickName}</a></td>
							<td>${user.email}</td>
						</tr>
					</c:forEach>
				</tbody>
				<tr>
					<td colspan="3"><a id="am" href="mainBoard">메인으로 돌아가기</a></td>
				</tr>
			</table>
		</div>
		<hr>
		<div class="panel panel-default">
			<div class="panel-heading" id="topic">
				Topic 제목 검색 <span class="badge">${topicSearchCount}</span>
			</div>
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>작성자 닉네임</th>
						<th>토픽 제목</th>
						<th>토픽 내용</th>
						<th>모듈 내용</th>
					</tr>
				</thead>
				<tbody>

					<!-- mTitle에 a태그 넣어서 해당 module로 이동할 수 있게 하기  -->
					<c:forEach var="topic" items="${topicSearchList}">
						<tr>
							<td><a id="a" href="getUser.do?email=${topic.email}">${topic.nickName}</a></td>
							<td>${topic.email}</td>
							<td>${topic.tTitle}</td>
							<td>${topic.mTitle}</td>
						</tr>
					</c:forEach>
				</tbody>
				<tr>
					<td colspan="3"><a id="am" href="mainBoard">메인으로 돌아가기</a></td>
				</tr>
			</table>
		</div>
		<hr>
 		<div class="panel panel-default">
			<div class="panel-heading" id="module">
				Module 제목 검색 <span class="badge">${moduleSearchCount}</span>
			</div>
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>작성자 닉네임</th>
						<th>작성자 이메일</th>
						<th>모듈 제목</th>
					</tr>
				</thead>
				<tbody>


					<c:forEach var="module" items="${moduleSearchList}">
						<tr>
							<td><a id="a" href="getUser.do?email=${module.email}">${module.nickName}</a></td>
							<td>${module.email}</td>
							<td>${module.mTitle}</td>
						</tr>
					</c:forEach>
				</tbody>
				<tr>
					<td colspan="3"><a id="am" href="mainBoard">메인으로 돌아가기</a></td>
				</tr>
			</table>

			<hr>
		</div>

		<div class="panel panel-default">
			<div class="panel-heading" id="course">
				Course 제목 검색 <span class="badge">${courseSearchCount}</span>
			</div>

			<table class="table table-bordered">
				<thead>
					<tr>
						<th>작성자 닉네임</th>
						<th>작성자 이메일</th>
						<th>코스 제목</th>
					</tr>
				</thead>
				<tbody>


					<c:forEach var="course" items="${courseSearchList}">
						<tr>
							<td><a id="a" href="getUser.do?email=${course.email}">${course.nickName}</a></td>
							<td>${course.email}</td>
							<td>${course.cTitle}</td>
						</tr>
					</c:forEach>
				</tbody>
				<tr>
					<td colspan="3"><a id="am" href="mainBoard">메인으로 돌아가기</a></td>
				</tr>
			</table>
		</div>
	</div> 

	<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>