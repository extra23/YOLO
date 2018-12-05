<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>deleteUser</title>

	<link href="https://fonts.googleapis.com/css?family=Baloo+Tamma" rel="stylesheet">

<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

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
	
		<h1>회원 탈퇴</h1>
		
		<div id="deleteForm">
			
			<form action="deleteUser" method="post">
				
				<input type="hidden" name="userId" value="${param.userId}">
				
				<p>
					<img src="${pageContext.request.contextPath}/images/profileImageBasic.png" style="width: 250px; height: 250px; border-radius: 50%;">
				</p>
				
				<p>
					email : <input type="email" name="email" readonly="readonly" value="${authUser.email}">
				</p>
			
				<p>
					password : <input type="password" name="password" placeholder="Password">
					<c:if test="${errors.password}">
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