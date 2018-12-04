<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>관리자 : 사용자 강제 탈퇴</title>

	<link href="https://fonts.googleapis.com/css?family=Baloo+Tamma" rel="stylesheet">

	<!-- 합쳐지고 최소화된 최신 CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

	<!-- 부가적인 테마 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

	<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

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
			
			<form action="adminUserListDelete" method="post">
				
				<input type="hidden" name="userId" value="${authUser.userId}">
				
				<p>
					<img src="${pageContext.request.contextPath}/images/profileImageBasic.png" style="width: 250px; height: 250px; border-radius: 50%;">
				</p>
				
				<p>
					회원 email : <input type="email" name="email" readonly="readonly" value="${authUser.email}">
				</p>
			
				<p>
					회원 password : <input type="password" name="password" placeholder="Password">
					<c:if test="${errors.password}">
						<span>Password를 입력해주세요.</span>
					</c:if>
					<c:if test="${errors.invalidPassword}">
						<span>잘못된 비밀번호 입니다.</span>
					</c:if>
				</p>
				
				<p>
					관리자  password : <input type="password" name="ad_password" placeholder="Password">
					<c:if test="${errors.ad_password}">
						<span>Password를 입력해주세요.</span>
					</c:if>
					<c:if test="${errors.invalidPassword}">
						<span>잘못된 비밀번호 입니다.</span>
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