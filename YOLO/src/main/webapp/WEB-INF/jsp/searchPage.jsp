<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>searchPage</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

</head>
<body>
<jsp:include page="header2.jsp"></jsp:include>

<div class="container">
	<h2 class="text-center">검색 목록</h2>
	
	<br>
		<h3>사용자 이메일 검색</h3>
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
				<td>${user.nickName}</td>
				<td><a href="getUser.do?email=${user.email}"> ${user.email}</a></td>
			</tr>
			</c:forEach>
		</tbody>
		<tr>
			<td colspan="3">
				<a href="mainBoard">메인으로 돌아가기</a>
			</td>
		</tr>
	</table> 
	
	<hr>
		
		<h3>Topic 제목 검색</h3>
	 <table class="table table-bordered">
		<thead>
			<tr>
				<th>작성자 닉네임</th>
				<th>토픽 제목</th>
				<th>토픽 내용</th>
			</tr>
		</thead>
		<tbody>
		
		
			<c:forEach var="topic" items="${topicSearchList}">
			<tr>
				<td>${topic.nickName}</td>
				<td>${topic.tTitle}</td>
				<td>${topic.tContent}</td>
			</tr>
			</c:forEach>
		</tbody>
		<tr>
			<td colspan="3">
				<a href="mainBoard">메인으로 돌아가기</a>
			</td>
		</tr>
	</table> 
	
	<hr>
	
<%-- 	<h5>Module 제목 검색</h5>
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
				<td>${module}</td>
				<td>${}</td>
				<td>${}</td>
			</tr>
			</c:forEach>
		</tbody>
		<tr>
			<td colspan="3">
				<a href="mainBoard">메인으로 돌아가기</a>
			</td>
		</tr>
	</table> 
	
	<hr>
	
	<h5>Module 제목 검색</h5>
	 <table class="table table-bordered">
		<thead>
			<tr>
				<th>작성자 닉네임</th>
				<th>작성자 이메일</th>
				<th>모듈 제목</th>
			</tr>
		</thead>
		<tbody>
		
		
			<c:forEach var="course" items="${courseSearchList}">
			<tr>
				<td>${module}</td>
				<td>${}</td>
				<td>${}</td>
			</tr>
			</c:forEach>
		</tbody>
		<tr>
			<td colspan="3">
				<a href="mainBoard">메인으로 돌아가기</a>
			</td>
		</tr>
	</table>  --%>
	
</div>

<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>