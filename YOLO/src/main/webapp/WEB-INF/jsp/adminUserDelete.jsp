<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
	
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>관리자 : 사용자 강제 탈퇴</title>
	
	<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

	<!-- 글꼴 -->
	<link href="https://fonts.googleapis.com/css?family=Baloo+Tamma" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet">
	
	<style>
		
		#contentBody {
			background: #F7F7F7 no-repeat center center fixed;
			-webkit-background-size: cover; 
			-moz-background-size: cover; 
			-o-background-size: cover; 
			background-size: cover;
		}
		
		#content {
			text-align: center;
		}
		
	</style>

</head>
<body id="contentBody">

	<jsp:include page="header3.jsp"></jsp:include>
	
	<div id="content">
	
		<h1>회원 강제 탈퇴</h1>
		
		<div id="deleteForm">
			
			<form action="adminUserDelete" method="post">
				
				<input type="hidden" name="userId" value="${user.userId}">
				
				<p>
					<img src="${pageContext.request.contextPath}/images/profileImageBasic.png" style="width: 250px; height: 250px; border-radius: 50%;">
				</p>
				
				<p>
					회원 email : <input type="email" name="email" disabled="disabled" value="${user.email}">
				</p>
			
				<p>
					회원 password : <input type="password" name="u_password" placeholder="User Password">
					<c:if test="${errors.u_password}">
						<span>회원 Password를 입력해주세요.</span>
					</c:if>
					<c:if test="${errors.invalidPassword}">
						<span>잘못된 회원 비밀번호 입니다.</span>
					</c:if>
				</p>
				
				<p>
					<input type="hidden" name="adminId" value="${authUser.userId}">
					관리자  password : <input type="password" name="ad_password" placeholder="Admin Password">
					<c:if test="${errors.ad_password}">
						<span>관리자 Password를 입력해주세요.</span>
					</c:if>
					<c:if test="${errors.adminInvalidPassword}">
						<span>잘못된 관리자 비밀번호 입니다.</span>
					</c:if>
				</p>
				
				<p>
					<input type="submit" value="탈퇴">
				</p>
				
			</form>
		
		</div>
		
	</div>
	
	<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>