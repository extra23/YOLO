<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>header</title>
	
	<link href="https://fonts.googleapis.com/css?family=Baloo+Tamma" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet">
	
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
	
	<style>
	
		#header1 *, #header2 #aboutUser * {
			font-family: 'Baloo Tamma', cursive;
		}
		
		#header1 {
			background-color: black;
			text-align: center;
		}
		
		#sitename {
			margin: 0 auto;
			display: inline-block;
			margin-top: 20px;
		}
		
		#sitename a {
			text-decoration: none;
			color: gray;
			font-size: 60px;
		}
		
		#header2 {
			background-color: gray;
			box-shadow: 0px 4px 20px #3c3c3c inset;
			text-align: right;
			font-size: 30px;
			padding-right: 18px;
		}
		
		#aboutUser, #loginBtn, #joinBtn, #search {
			display: inline-block;
		}
		
		#loginBtn, #joinBtn, #search{
			margin: 5px;
		}
		
		#loginBtn a, #joinBtn a, #search {
			color: black;
		}
	
	</style>
	
</head>
<body>

	<div id="header1">
	
		<div id="sitename">
			<a href="mainBoard">#YOLO</a>
		</div>
		
		<%-- <div id="aboutUser">
			
			<c:if test="${empty sessionScope.authUser}">
				<div id="loginBtn">Login</div>
				<div id="JoinBtn">Join</div>
			</c:if>
			
		</div> --%>
		
		<!-- <div id="search">
			<div class="col-lg-6">
				<form class="input-group" action="searchUser.do" method="post">
					<input type="text" name="searchWord" class="form-control">
					<span class="input-group-btn"> 
						<input type="submit" id="searchbutton" class="btn btn-outline-dark" value="search">
					</span>
				</form>
			</div>
		</div> -->
	
	</div>
	
	<div id="header2">
	
		<div id="aboutUser">
			
			<c:if test="${empty sessionScope.authUser}">
				<div id="loginBtn"><a href="login">Login</a></div>
				<div id="joinBtn"><a href="join">Join</a></div>
			</c:if>
			
		</div>
		
		<div id="search">
			<span class="glyphicon glyphicon-search" style="position: relative; top: 6px;"></span>
		</div>
	
	</div>

</body>
</html>