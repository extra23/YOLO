<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		
		<title>YOLO :: mainBoard</title>

		<!-- 합쳐지고 최소화된 최신 CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

		<!-- 부가적인 테마 -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

		<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

		<link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet">

	<style type="text/css">
	
		#contentBody {
			background: #F7F7F7 no-repeat center center fixed;
			-webkit-background-size: cover; 
			-moz-background-size: cover; 
			-o-background-size: cover; 
			background-size: cover;
		}
	
		.mainContent {
			width: 100%;
			font-family: 'Jua', sans-serif;
			/* background-color: #F7F7F7; */
			text-align: center;
		}

		.menu {
			width: 93%;
			height: 1000px;
			align-content: center;
			margin: 0 auto;
			margin-top: 55px;
		}

		.course {
			width: 32%;
			height: 850px;
			border-radius: 10px;
			background-color: white;
			float: left;
		}

		.module {
			width: 32%;
			height: 850px;
			border-radius: 10px;
			background-color: white;
			margin: 0 auto;
			display: inline-block;
		}

		.help {
			width: 32%;
			height: 950px;
			border-radius: 10px;
			background-color: white;
			float: right;
		}

		.title {
			font-size: 30px;
			padding-top: 20px;
			padding-bottom: 20px;
			text-align: center;
			text-align: center;
		}

		.box {
			width: 45%;
			height: 200px;
			border: 1px solid lightgray;
			background-color: gainsboro;
			border-radius: 10px;
			float: left;
			margin-left: 16px;
			margin-bottom: 20px;
		}

		.card {
			width: 100%;
			height: 70px;
			background-color: gray;
			border-top-left-radius: 8px;
			border-top-right-radius: 8px;
		}

		.helpBox {
			width: 93%;
			height: 820px;
			background-color: gainsboro;
			border-radius: 10px;
			margin-left: 20px;
			font-size: 18px;
			text-align: center;
		}

		h3 {
			margin-top: 0px !important;
		}
		
		::-webkit-scrollbar {display: none;}
		
	</style>
	
</head>
<body id="contentBody" style="-ms-overflow-style: none;">
	
	<jsp:include page="header2.jsp"></jsp:include>
	
	<div class="mainContent">
		<div class="menu">
			<div class="course">
				<p class="title">
					코스<br>
					<small>Course</small>
				</p>
				<div class="box">
					<div class="card"></div>
				</div>
				<div class="box">
					<div class="card"></div>
				</div>
				<div class="box">
					<div class="card"></div>
				</div>
				<div class="box">
					<div class="card"></div>
				</div>
				<div class="box">
					<div class="card"></div>
				</div>
				<div class="box">
					<div class="card"></div>
				</div>
			</div>
			<div class="module">
				<p class="title">
					모듈<br>
					<small>Module</small>
				</p>
				<div class="box">
					<div class="card"></div>
				</div>
				<div class="box">
					<div class="card"></div>
				</div>
				<div class="box">
					<div class="card"></div>
				</div>
				<div class="box">
					<div class="card"></div>
				</div>
				<div class="box">
					<div class="card"></div>
				</div>
				<div class="box">
					<div class="card"></div>
				</div>
			</div>
			<div class="help">
				<p class="title">YOLO의 도움말</p>
				<div class="helpBox">
					<br>
					<div>
						<h3>컨텐츠 소비</h3>
						<hr>
						<p>
							컨텐츠 소비 토픽에서는 YOLO에서 지식을 얻는 방법에 대해서 설명드립니다.<br> 공동공부를 통해서 함께
							공부하는 법, 알림을 통해서 관심있는 컨텐츠가<br>만들어졌을 때 소식을 받거나, 자주 방문하는 컨텐츠로
							빠르게 이동<br> 할 수 있습니다.
						</p>
					</div>


					<div>
						<br>
						<h3>컨텐츠 생산</h3>
						<hr>
						<p>
							컨텐츠 생산 토픽에서는 YOLO에 지식을 담는 방법을 알려드립니다.<br> 토픽과 모듈 그리고 코스의
							개념이나 효과적으로 컨텐츠를 조직화 할 수<br> 있습니다.
						</p>
					</div>


					<div>
						<br>
						<h3>토픽 모듈 코스에 대하여</h3>
						<hr>
						<p>
							모듈 그리고 크스라고 하는 개념에 대해서 도움을 드리겠습니다.<br> 토픽이라고 하는 것은 한평의 글입니다.<br>
							만약 블로그 일가 익숙하신 분들은 포스트 하나가 토픽 하나라고 생각하시면<br> 되겠습니다. 토픽들이 모이면
							하나의 모듈이라고 할 수 있습니다.<br> 그리고 모듈이 모이면 코스가 됩니다.
						</p>
						<br>
					</div>


					<div>
						<br>
						<h3>서비스 문제점</h3>
						<hr>
						<p>
							서비스에 대한 문제점은 아래 링크의 토픽에 댓글이나 이메일 <a
								href="mailto:YOLO@gmail.com?Subject=Hello%Help Me!">YOLO@gmail.com</a>로
							연락 부탁드립니다.
						</p>
						<br>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<jsp:include page="footer.jsp"></jsp:include>
	
</body>
</html>