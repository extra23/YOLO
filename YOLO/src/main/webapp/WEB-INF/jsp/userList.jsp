<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관리자 페이지 - 유저들의 정보를 확인하는 페이지</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

</head>
<body>

<div class="container">
	<h2 class="text-center">사용자 목록</h2>
	<table class="table table-bordered">
		<thead>
			<tr>
				<th>프로필 이미지</th>
				<th>닉네임</th>
				<th>이메일</th>
				<th>password</th>
				<th>password 확인 id</th>
				<th>password 확인 질문 답</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="user" items="${userList}">
			<tr>
				<td>${user.profileImage}</td>
				<td>${user.nickName}</td>
				<td><a href="getUser.do?email=${user.email}"> ${user.email}</a></td>
				<td>${user.password}</td>
				<td>${user.p_qId}</td>
				<td>${user.p_answer }</td>
			</tr>
			</c:forEach>
		</tbody>
		<tr>
			<td colspan="6">
				<a href="addUserForm.do">사용자 등록</a>
			</td>
		</tr>
	</table>
</div>

</body>
</html>