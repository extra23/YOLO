<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>사용자 페이지</title>


<link href="https://fonts.googleapis.com/css?family=Baloo+Tamma"
	rel="stylesheet">

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<link href="https://fonts.googleapis.com/css?family=Jua"
	rel="stylesheet">

<style type="text/css">
hr {
	margin-top: 20px;
	margin-bottom: 20px;
	border: 0;
	border-top: 1px solid #ccc !important;
}

.mypage {
	font-size: 80px;
	margin-left: 400px;
}

.profilepic {
	width: 180px;
	height: 200px;
	border: 5px dotted black;
}

.nickname {
	margin-left: 236px;
	margin-top: -200px;
	font-size: 27px;
}

.par {
	margin-left: 236px;
	margin-top: -20px;
}

.table-bordered {
	border: 1px solid black;
	margin-left: 236px;
	margin-top: 29px;
}

.module {
	margin-left: 20px;
}

.co {
	margin-left: 20px;
}

.hi {
	margin-left: 20px;
}

#contentBody {
	background: #F7F7F7 no-repeat center center fixed;
	-webkit-background-size: cover;
	-moz-background-size: cover;
	-o-background-size: cover;
	background-size: cover;
	font-family: 'Baloo Tamma', cursive;
}

.container {
	font-family: 'Jua', sans-serif;
	font-family: 'Baloo Tamma', cursive;
}

.viewCon {
	/* 	height: 1600px; */
	
}

.cobox {
	margin-top: 170px;
}

.colist {
	margin-left: 60px;
	margin-top: 10px;
}

/* .co {
	display: inline-block;
	border: 1px solid black;
	width: 200px;
	height: 200px;
	margin: 30px;
	margin-top: 10px;
	margin-bottom: 30px;
}

#colist li {
	float: left;
} */
.co1 {
	width: 200px;
	height: 200px;
	border: solid 1px black;
}

.co2 {
	width: 200px;
	height: 200px;
	border: solid 1px black;
	position: relative;
	top: -200px;
	right: -270px;
	right: -270ox;
}

.co3 {
	width: 200px;
	height: 200px;
	border: solid 1px black;
	position: relative;
	top: -400px;
	right: -540px;
}

.co4 {
	width: 200px;
	height: 200px;
	border: solid 1px black;
	position: relative;
	top: -600px;
	right: -810px;
}

.plus1 {
	margin-left: 48px;
	margin-top: 80px;
}

.mobox {
	margin-top: -475px;
}

.molist {
	margin-left: 20px;
}

.mo {
	display: inline-block;
	border: 1px solid black;
	width: 200px;
	height: 200px;
	margin: 65px;
	margin-top: 10px;
	margin-bottom: 240px;
	margin-left: 3px;
}

#molist li {
	float: left;
}

.plus2 {
	margin-left: 48px;
	margin-top: 80px;
}

/* .mo1 {
	width: 200px;
	height: 200px;
	border: solid 1px black;
}

.mo2 {
	width: 200px;
	height: 200px;
	border: solid 1px black;
	position: relative;
	top: -200px;
	right: -270px;
}

.mo3 {
	width: 200px;
	height: 200px;
	border: solid 1px black;
	position: relative;
	top: -400px;
	right: -540px;
}

.mo4 {
	width: 200px;
	height: 200px;
	border: solid 1px black;
	position: relative;
	top: -600px;
	right: -810px;
} */
.butt {
	position: relative;
	top: 1237px;
	left: 907px;
}

</style>
</head>
<body id="contentBody">
	<jsp:include page="header2.jsp"></jsp:include>
	<div class="viewCon">
		<div class="container">
			<p class="mypage">MYPAGE</p>
			<div class="profilebox">

				<div class="profilepic">사진</div>

				<div class="nickname">
					<p>&lt; nickname : ${authUser.nickName} &gt;</p>
				</div>


				<div class="butt">
					<a href="modifyUserForm.do?userId=${authUser.userId}"
						style="font-family: 'Jua', sans-serif">[ 정보 수정 ]</a>&nbsp;&nbsp;&nbsp;
					<a href="modifyUserForm.do?userId=${authUser.userId}"
						style="font-family: 'Jua', sans-serif">[ 회원 탈퇴 ]</a>
				</div>

				<p class="par">&lt; Participation &gt;</p>

				<table class="table table-bordered">
					<tbody>

						<tr>
							<div class="module">
								<td>&nbsp; module&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
									style="font-family: 'Jua', sans-serif">[ co ] 개</span></td>
							</div>
							<div class="course">
								<td>&nbsp; course&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
									style="font-family: 'Jua', sans-serif">[ co ] 개</span></td>
							</div>
							<div class="hi">
								<td>&nbsp; history&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
									style="font-family: 'Jua', sans-serif">[ co ] 개</span></td>
							</div>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="cobox">
				<hr>
				<h3 style="font-family: 'Jua', sans-serif">My course : &nbsp;&nbsp;&nbsp;&nbsp;co 개</h3>
				<hr>
				<br>
				<div class="colist">
					<div class="co1"></div>
					<div class="co2"></div>
					<div class="co3"></div>
					<div class="co4">
						<div class="plus1">
							<a href="#" style="font-family: 'Jua', sans-serif">[ 더보기 ]</a>
						</div>
					</div>

					<!-- 	<ul id="colist">
					<li class="co"></li>
					<li class="co"></li>
					<li class="co"></li>
					<li class="co" style="font-family: 'Jua', sans-serif">더보기</li>
				</ul> -->
				</div>
				<div class="mobox">
					<hr>
					<h3 style="font-family: 'Jua', sans-serif">My module : &nbsp;&nbsp;&nbsp;&nbsp;co 개</h3>
					<hr>
					<br>
					<!-- <div class="molist" >
					<div class="mo">더보기</div>
					<div class="mo"></div>
					<div class="mo"></div>
					<div class="mo" style="font-family: 'Jua', sans-serif"></div>
				</div> -->
					<ul id="molist">
						<li class="mo"></li>
						<li class="mo"></li>
						<li class="mo"></li>
						<li class="mo"><div class="plus2">
								<a href="#" style="font-family: 'Jua', sans-serif">[ 더보기 ]</a>
							</div></li>
					</ul>
				</div>
			</div>
		</div>
		<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>