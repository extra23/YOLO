<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<link rel ="stylesheet" href="style.css">
	<script defer src="https://use.fontawesome.com/releases/v5.5.0/js/all.js" integrity="sha384-GqVMZRt5Gn7tB9D9q7ONtcp4gtHIUEW/yG7h98J7IpE3kpi+srfFyyB/04OV6pG0" crossorigin="anonymous"></script>
	<style type="text/css">
		body{
			margin : 0;
			paddng : 0;
		}
		.search-box{
		position : absolute;
		top : 50%;
		left : 50%;
		transform : translate(-50%, -50%);
		background : white;
		height : 40px;
		border-radius : 40px;
		padding : 10px;
		}
		.search-box:hover > .search-txt{
		width: 240px;
		padding: 0.6px; 
		}
		.search-box:hover > .search-btn{
		background: white;
		}
		.search-btn{
		color : black;
		float : right;
		width : 40px;
		height : 40px;
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
		color : white;
		font-size: 16px;
		transition : 0.4s;
		line-height: 40px;
		width: 0px;
		}
	</style>
	
</head>
<body>

	<div class="search-box">
		<input class="search-txt" type="text" name="" placeholder="Type to search">
		<a class="search-btn" href="#">
		<i class="fas fa-search"></i>
			
		</a>
	</div>

</body>
</html>