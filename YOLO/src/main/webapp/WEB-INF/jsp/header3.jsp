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
	
	<!-- 검색바 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<link rel ="stylesheet" href="style.css">
	<script defer src="https://use.fontawesome.com/releases/v5.5.0/js/all.js" integrity="sha384-GqVMZRt5Gn7tB9D9q7ONtcp4gtHIUEW/yG7h98J7IpE3kpi+srfFyyB/04OV6pG0" crossorigin="anonymous"></script>
	
	<style>
		body{
			margin : 0;
			paddng : 0;
		}
		#search{
			display: inline-block;
		}
		.search-box{
		position : relative;
		top : 10px;
		right: 10px;
		transform : translate(0%, 0%);
		background : white;
		height : 40px;
		border-radius : 104px;
		padding : 10px;
		}
		.search-box:hover > .search-txt{
		width: 280px;
		padding: 0.6px; 
		}
		.search-box:hover > .search-btn{
		background: white;
		}
		.search-btn{
		color : black;
		float : right;
		width : 40px;
		height : 20px;
		border-radius : 50%;
		background: white;
		display: flex;
		justify-content: center;
		align-items: center;
		}
		.search-txt{
		border : none;
		background: none;
		outline: none;
		float: left;
		padding : 0;
		font-size: 16px;
		transition : 0.4s;
		line-height: 20px;
		width: 0px;
		}
	
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
		
		#aboutUser, #loginBtn, #joinBtn, #search-box {
			display: inline-block;
		}
		
		#loginBtn, #joinBtn{
			margin: 5px;
		}
		
		#loginBtn a, #joinBtn a {
			color: black;
		}
	
	</style>
	
	<script type="text/javascript">
		$(function(){
			
			$("#txt").keyup(function(){
				$(this).css("width", "280px");
			});
			
			$("#search-btn").click(function(){
				location.href = "searchUser.do?searchWord="+$("#txt").val();
			});
		});
	</script>
	
</head>
<body>

	<div id="header1">
		<div id="sitename">
			<a href="mainBoard">#YOLO</a>
		</div>
	</div>
	
	<div id="header2">
	
	
		<div id="search">
		<div class="search-box">
		
			<input id="txt" class="search-txt" type="text" name="searchWord" placeholder="Type to search">
			<a class="search-btn" id="search-btn">
				<i class="fas fa-search"></i>
			</a>
		</div>
		</div>
		
		<div id="aboutUser">
			
			<c:if test="${empty sessionScope.authUser}">
				<div id="loginBtn"><a href="login">Login</a></div>
				<div id="joinBtn"><a href="join">Join</a></div>
			</c:if>
			
			<c:if test="${not empty sessionScope.authUser}">
				<div class="btn-group">
					<button type="button" class="btn btn-danger">${authUser.nickName}</button>
					<button type="button" class="btn btn-danger dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
						<span class="caret"></span> <span class="sr-only">Toggle Dropdown</span>
					</button>
					<ul class="dropdown-menu" role="menu">
						<li><a href="getUser.do?email=${authUser.email }">프로필</a></li>
						<li><a href="#">토픽/모듈/코스 수정</a></li>
						<li class="divider"></li>
						<li><a href="logoutTry.do">로그아웃</a></li>
					</ul>
				</div>
			</c:if>
			
		</div>
		
		
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

</body>
</html>