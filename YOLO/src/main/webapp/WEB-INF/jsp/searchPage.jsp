<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>searchPage</title>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 


<style type="text/css">
#navi{
	font-family: 'Baloo Tamma', cursive;
	font-size: 2em;
}

.panel-heading {
	font-family: 'Jua';
	font-size: 1.5em;
}

.badge{
	margin-left: 10px;
	margin-top: -5px;
	width: 30px;
}

th {
	font-family: 'Jua';
	font-size: 1.2em;
}

tr {
	font-family: 'Jua';
	font-size: 1.3em;
}

#a,#am {
	font-family: 'Jua';
	font-size: 1em;
}

#a:hover {
	color: skyblue;
	font-weight: bold;
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
		<ul class="nav nav-tabs" id="navi">
			<li role="presentation" class="active"><a href="#user">User Email</a></li>
			<li role="presentation"><a href="#topic">Topic</a></li>
			<li role="presentation"><a href="#module">Module</a></li>
			<li role="presentation"><a href="#course">Course</a></li>
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
							<td><a id="finds" href="getUser.do?email=${user.email}">${user.nickName}</a></td>
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
					</tr>
				</thead>
				<tbody>

					<!-- mTitle에 a태그 넣어서 해당 module로 이동할 수 있게 하기  -->
					<c:forEach var="topic" items="${topicSearchList}">
						<tr>
							<td><a id="finds" href="getUser.do?email=${topic.email}">${topic.nickName}</a></td>
							<td><a id="finds" href="topicPage?moduleId=${topic.moduleId}&topicId=${topic.topicId}">${topic.tTitle}</a></td>
							<td>${topic.tContent}</td>
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
						<th>모듈 제목</th>
						<th>모듈 요약</th>
					</tr>
				</thead>
				<tbody>


					<c:forEach var="module" items="${moduleSearchList}">
						<tr>
							<td><a id="finds" href="getUser.do?email=${module.email}">${module.nickName}</a></td>
							<td><a id="finds" href="modulePage?moduleId=${module.moduleId}">${module.mTitle}</a></td>
							<td>${module.mSummary}</td>
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
			<div class="panel-heading" id="course">
				Course 제목 검색 <span class="badge">${courseSearchCount}</span>
			</div>

			<table class="table table-bordered">
				<thead>
					<tr>
						<th>작성자 닉네임</th>
						<th>코스 제목</th>
						<th>코스 요약</th>
					</tr>
				</thead>
				<tbody>


					<c:forEach var="course" items="${courseSearchList}">
						<tr>
							<td><a id="finds" href="getUser.do?email=${course.email}">${course.nickName}</a></td>
							<td><a id="finds" href="coursePage?courseId=${course.courseId}">${course.cTitle}</a></td>
							<td>${course.cSummary}</td>
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