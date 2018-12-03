<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>YOLO :: login</title>

	<!-- 합쳐지고 최소화된 최신 CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

	<!-- 부가적인 테마. -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

	<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

	<link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet">

	<style>
	
		body {
			background: #F7F7F7 no-repeat center center fixed;
			-webkit-background-size: cover; 
			-moz-background-size: cover; 
			-o-background-size: cover; 
			background-size: cover;
		}
		
		.form-horizontal {
			margin-left: 50px;
			margin-top: 70px;
		}
		
		.mainForm {
			width: 100%;
			font-family: 'Jua', sans-serif;
			text-align: center;
			margin-top: 180px;
		}
		
		.loginForm {
			width: 40%;
			margin: 0 auto;
			background-color: lightgray;
			border: 1px solid black;
			border-radius: 10px;
			padding-bottom : 20px;
		}
		
		.form-group-lg {
			margin-right: 20px !important;
		}
		
		.btn {
			margin-bottom: 10px;
		}
		
		.loginForm p {
			font-size: 50px;
			margin-top: 40px;
		}
		
	</style>

</head>
<body>

	<div class="mainForm">
		<div class="loginForm">
			<p>LOGIN</p>
			<form class="form-horizontal" action="login" method="post">
				<div class="form-group form-group-lg">
					<label for="inputEmail3" class="col-sm-3 control-label">Email</label>
					<div class="col-sm-6">
						<input type="email" class="form-control" id="inputEmail3" placeholder="Email" name="email" value="${param.email}">
						<c:if test="${errors.email}">
							<span>Email을 입력해주세요.</span>
						</c:if>
						<c:if test="${errors.UserNotFound}">
							<span>Email이 일치하지 않습니다.</span>
						</c:if>
					</div>
				</div>
				<div class="form-group form-group-lg">
					<label for="inputPassword3" class="col-sm-3 control-label">Password</label>
					<div class="col-sm-6">
						<input type="password" class="form-control" id="inputPassword3" placeholder="Password" name="password">
						<c:if test="${errors.password}">
							<span>Password를 입력해주세요.</span>
						</c:if>
						<c:if test="${errors.InvalidPassword}">
							<span>Password가 일치하지 않습니다.</span>
						</c:if>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-7">
						<!-- <button type="submit" class="btn btn-default btn-block btn-lg">Login</button> -->
						<input type="submit" class="btn btn-default btn-block btn-lg"
							value="Login">
					</div>
					<div class="col-sm-offset-2 col-sm-7">
						<!-- <button type="submit" class="btn btn-default btn-block btn-lg">Cancel</button> -->
						<a href="mainBoard" class="btn btn-default btn-block btn-lg">Cancel</a>
					</div>
					<div class="col-sm-offset-2 col-sm-7">
						<a href="join" class="btn btn-default btn-block btn-lg">Join</a>
					</div>
				</div>
			</form>
		</div>
	</div>

</body>
</html>