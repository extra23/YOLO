<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>header.jsp</title>

	<link href="https://fonts.googleapis.com/css?family=Baloo+Tamma" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet">
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
	
	<style>
		
		body, input {
			font-family: 'Baloo Tamma', cursive;
			font-size: 25px;
		}

		.background {
			background-color: black;
			height: 100px;
			width: 100%;
		}

		#logo {
			float: left;
			margin: 15px;
		}

		#logo img {
			border-radius: 100%;
			width: 50px;
		}

		/* 검색창 */
		.col-lg-6 {
			top: 30px;
			left: calc(100%/ 1.6);
			width: 300px;
			float: none;
			display: inline-block;
		}

		.row {
			background-color: black;
		}

		#sitename {
			top: 20px;
			position: relative;
			right: 900px;
			float: right;
			display: inline-block;
			font-size: 50px;
			color: gray;
		}
		
		#sitename a {
			text-decoration: none;
			color: gray;
		}

		input[type="submit"] {
			font-family: 'Jua', sans-serif;
		}

		.joinbutton {
			top: 8px;
			left: calc(100%/ 1.3);
			float: none;
			display: inline-block;
		}

		/* 로그인버튼 */
		.dropdown {
			top: 8px;
			left: calc(100%/ 1.3);
			float: none;
			display: inline-block;
		}

		/* a:link {
			text-decoration: none;
			color: gray;
		} */

		#login {
			width: 100px;
		}

		#join {
			width: 100px;
		}

		.buttonlist {
			margin-left: 1600px;
			position: relative;
			bottom: 65px;
		}

		.collapse navbar-collapse {
			position: relative;
			left: 500px;
		}

		li {
			list-style-type: none;
			font-family: 'Baloo Tamma', cursive;
		}
		
	</style>
</head>
<body>

	<!--fix header -->
	<!-- <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top"> -->

	<div class="background">
		
		<!-- <div id="logo">
			<a href="mainBoard.jsp"><img src="img/logogo.jpg"></a>
		</div> -->
		
		<div id="sitename"><a href="mainBoard">#YOLO</a></div>

		<div class="col-lg-6">

			<form class="input-group" action="searchUser.do" method="post">
				<input type="text" name="searchWord" class="form-control"> <span
					class="input-group-btn"> <input type="submit"
					id="searchbutton" class="btn btn-outline-dark" value="검색">
				</span>

			</form>

		</div>
	</div>


	<!-- 로그인 회원가입 -->
	<div class="buttonlist" id="navbarResponsive">
		<ul class="navbar-nav ml-auto">

			<c:if test="${empty user.userId}">
				<!-- 임의지정 -->
				<li class="nav-item" id="login"><a class="nav-link" href="login" style="color: gray;">Login</a></li>
				&nbsp;&nbsp;
				<li class="nav-item" id="join"><a class="nav-link" href="join" style="color: gray;">Join</a></li>
			</c:if>
			
			<!-- 얘는 로그인 상태에 뜰 부분 -->
			<c:if test="${!empty user.userId }">
				<li class="nav-item" style="color: white; margin-top: 10px;"><small>[${authUser.nickname}님, 안녕하세요. :D]</small>&nbsp;&nbsp;</li>
				<li class="nav-item"><a class="nav-link" style="cursor: pointer;" onclick="deleteUser()">Withdrawal&nbsp;&nbsp;</a></li>
				<li class="nav-item"><a class="nav-link" href="/YOLO/logout">Logout&nbsp;&nbsp;</a></li>
				<!--얘는 메인페이지로 이동해야함.-->
			</c:if>
			
		</ul>
	</div>

</body>
</html>