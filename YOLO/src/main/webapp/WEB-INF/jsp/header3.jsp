<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>header3.jsp</title>
	
	<!-- 글꼴 -->
	<link href="https://fonts.googleapis.com/css?family=Baloo+Tamma" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Gamja+Flower" rel="stylesheet">
	
	<!-- <script defer src="https://use.fontawesome.com/releases/v5.5.0/js/all.js" integrity="sha384-GqVMZRt5Gn7tB9D9q7ONtcp4gtHIUEW/yG7h98J7IpE3kpi+srfFyyB/04OV6pG0" crossorigin="anonymous"></script> -->
	
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
		top : 8px;
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
			height: 57px;
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
		
		/* .dropdown {
			top: 8px;
			left: calc(100%/ 1.3);
			float: none;
			display: inline-block;
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
		
		
		 */
		
		#btn-group{
			background-color: gray;
			height: 35px;
			top: -5px;
			width: 150px;
		}
		
		#namebox{
			width: 125px;
		}
		
		#dropdown{
			width : 25px;
		}
		
		#nickName{
		font-family: 'Jua', sans-serif;
		}
		
		#btn-group>.btn:first-child:not(:last-child):not(.dropdown-toggle), #btn-group>.btn+.dropdown-toggle{
			background-color: white;
			border-color: gray;
			color: black;
			font-family: 'Jua', sans-serif;
			height: 35px;
		}
		
		#dropdownMenu{
			top: 108%;
		    left: -7% !important;
		}
		
		#dropdownMenu>li{
			list-style-type: none;
		}
		
		#btn-group * {
			font-family: 'Jua', sans-serif;
		}
		.search-btn{text-decoration: none!important;}
		
	</style>
	
	<script>
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
				<i class="glyphicon glyphicon-search"></i>
			</a>
		</div>
		</div>
		
		<div id="aboutUser">
			
			<c:if test="${empty sessionScope.authUser}">
				<div id="loginBtn"><a href="login">Login</a></div>
				<div id="joinBtn"><a href="join">Join</a></div>
			</c:if>
			
			<c:if test="${not empty sessionScope.authUser}">
				
				<div class="btn-group" id="btn-group">
					<button type="button" id="namebox" class="btn btn-danger" style="font-family: 'Jua', sans-serif ">${authUser.nickName}</button>
					<button type="button" class="btn btn-danger dropdown-toggle" id="dropdown" data-toggle="dropdown" aria-expanded="false">
						<span class="caret"></span> <span class="sr-only">Toggle Dropdown</span>
					</button>
					
					<ul class="dropdown-menu" id="dropdownMenu" role="menu">
						<li><a href="userView?userId=${authUser.userId}" style="font-family:'Jua'">프로필</a></li>
						<li><a href="AdminModuleAndCourse" style="font-family:'Jua'">토픽/모듈/코스 수정</a></li>
						<li class="divider"></li>
						<c:if test="${authUser.userType}">
							<!-- <li><a href="#" style="font-family:'Jua'">관리자 페이지</a></li> -->
							<li><a href="adminUserList" style="font-family:'Jua'">사용자 리스트</a></li>
							<li><a href="adminList" style="font-family:'Jua'">관리자 리스트</a></li>
							<hr style="margin-top: 10px; margin-bottom: 10px;">
						</c:if>
						<li><a href="logout" style="font-family:'Jua'">로그아웃</a></li>
					</ul>
					
					
					
				</div>
				
			</c:if>
			
		</div>
		
	
	</div>

</body>
</html>