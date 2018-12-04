<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관리자 : 사용자 리스트</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

		<!-- 부가적인 테마 -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

		<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

		<link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet">
		
		<style type="text/css">
		
		body {background: url("images/background2.jpg") no-repeat center center fixed; -webkit-background-size: cover; -moz-background-size: cover; -o-background-size: cover; background-size: cover;}
	
		#container {background-color: rgb(250, 250, 250); border-radius: 20px; width: calc(100% - 260px); float: right; padding: 30px; margin: 20px; margin-left: -10px; margin-right: 25px;}
		#container * {font-family: a찐빵M;}
	
		#userListTable {width: 90%; margin: auto;}
		#userListTable, #userListTable tr, th, td {border: 1px solid black; border-collapse: collapse;}
		#userListTable td, #userListTable th, #userListTable tr {padding: 10px; text-align: center;}
		#userListTable thead {background-color: gainsboro;}
		
		#pagination {text-align: center; margin: 10px; margin-top: 30px; font-size: 18px;}
		</style>
</head>
<div class="container">

	<jsp:include page="header3.jsp"></jsp:include>
	
	<h2 class="text-center">사용자 목록</h2>
	<table id="userListTable">
		<thead>
			<tr>
				<th>번호</th>
				<th>프로필 이미지</th>
				<th>닉네임</th>
				<th>이메일</th>
				<th>password</th>
				<th>password 확인 id</th>
				<th>password 확인 질문 답</th>
				<th>수정</th>
				<th>삭제</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="user" items="${userList}" varStatus="status">
			<tr>
				<td>
					<c:if test="${empty param.pageNo}">${status.count}</c:if>
					<c:if test="${not empty param.pageNo}">${(20 * (param.pageNo-1))+status.count}</c:if>
				</td>
				<td>${user.profileImage}</td>
				<td>${user.nickName}</td>
				<td>${user.email}</a></td>
				<td>${user.password}</td>
				<td>${user.p_qId}</td>
				<td>${user.p_answer }</td>
				<td><a href="adminUserListModify?pageNo=${param.pageNo}&userId=${user.email}">[수정]</a></td>
				<td><a href="adminUserListDelete?pageNo=${param.pageNo}&userId=${user.email}">[삭제]</a></td>
			</tr>
			</c:forEach>
		</tbody>	
	</table>
	
	<div id="pagination">
		<c:if test="${userPage.totalPages > 10 && not(userPage.currentPage eq 1)}">
			<a href="mUserList?pageNo=1">&lt;&lt;</a>
		</c:if>
		<c:if test="${userPage.startPage > 5}">
			<a href="mUserList?pageNo=${userPage.startPage - 5}">&lt;</a>
		</c:if>
		<c:forEach var="pageNo" begin="${userPage.startPage}" end="${userPage.endPage}">
			<a href="mUserList?pageNo=${pageNo}">[${pageNo}]</a>
		</c:forEach>
		<c:if test="${userPage.endPage > 5}">
			<a href="${userPage.startPage + 5}">&gt;</a>
		</c:if>
		<c:if test="${userPage.totalPages > 10 && not(userPage.currentPage eq userPage.endPage)}">
			<a href="mUserList?pageNo=${userPage.totalPages}">&gt;&gt;</a>
		</c:if>
	</div>
	<jsp:include page="header3.jsp"></jsp:include>

</body>
</html>