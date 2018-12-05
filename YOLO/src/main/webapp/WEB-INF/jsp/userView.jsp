<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>YOLO :: userView</title>

<link href="https://fonts.googleapis.com/css?family=Baloo+Tamma"
	rel="stylesheet">

<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> ss

<link href="https://fonts.googleapis.com/css?family=Jua"
	rel="stylesheet">

<!--  <style>
hr {
 margin-top: 20px;
 margin-bottom: 20px;
 border: 0;
 border-top: 1px solid #ccc !important;
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

.name {
 margin-left: 170px;
 margin-top: -48px;
}

.par {
 margin-left: 236px;
 margin-top: -20px;
 font-size: 27px;
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
 /*  height: 1600px; */
 
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
 </style> -->

<style>
#mypage {
	font-size: 80px;
	/* margin-left: 400px; */
	margin: 0 auto;
	width: 500px;
	text-align: center;
}

#email {
	margin-left: 20px;
}

#viewCon * {
	font-family: 'Baloo Tamma', cursive;
	margin-top: 20px;
	margin-bottom: 20px;
}

#profilebox table {
	width: 100%;
	font-size: 27px;
}

#profilebox table, #profilebox tr, #profilebox td {
	margin-top: 15px;
	margin-bottom: 15px;
	padding: 10px;
}

#mail {
	/* margin: 10px; */
	position: relative;
	top: 20px;
}

#name {
	/* margin: 10px; */
	position: relative;
	top: 17px;
}

#par {
	/* margin: 10px; */
	/* margin-top: 10px; */
	position: relative;
	top: 20px;
}

#m {
	position: relative;
	top: 4px;
}

#c {
	position: relative;
	top: 4px;
}

#h {
	position: relative;
	top: 4px;
}

#viewCon hr {
	margin-top: 20px;
	margin-bottom: 20px;
	border: 0;
	border-top: 1px solid black !important
}

#cobox {
	height: 400px;
}

#mobox {
	height: 400px;
}

#viewCon ul {
	list-style: none;
}

#viewCon ul li {
	float: left;
	margin: 30px;
}

.butt {
    margin-left: 1188px;
}

.panel panel-default {
	height: 120px;
}

.panel-heading {
	margin-top: 10px;
}

.panel-body {
	margin-top: 10px;
}



#viewCon a {
	position: relative;
	left: 10px;
}

#plus {
	margin-left: 41px;
	position: relative;
	top: 17px;
}



</style>

</head>
<body id="contentBody">

	<jsp:include page="header3.jsp"></jsp:include>

	<div id="viewCon">

		<div class="container">

			<h1 id="mypage" style="font-family: 'Baloo Tamma', cursive;">MYPAGE</h1>

			<%-- <div id="profilebox">

    <div id="profilepic">
     <img
      src="${pageContext.request.contextPath}/images/profileImageBasic.png"
      style="width: 180px; height: 200px; border-radius: 50%;">
    </div>

    <div id="email">
     &lt; E-mail : <span style="font-family: 'Jua', sans-serif">${authUser.email}</span>
     &gt;
    </div>

    <div id="nickname">
     &lt; Nickname : <span style="font-family: 'Jua', sans-serif">${authUser.nickName}</span>
     &gt;
    </div>

    <p id="par">&lt; Participation &gt;</p>

    <!-- <div id="moduleCnt">
     <span style="font-family: 'Jua', sans-serif">[ co ] 개</span>
    </div>

    <div id="courseCnt">
     <span style="font-family: 'Jua', sans-serif">[ co ] 개</span>
    </div>

    <div id="historyCnt">
     <span style="font-family: 'Jua', sans-serif">[ co ] 개</span>
    </div> -->
    
    <ul id="cntlist">
     <li class="cnt">
      <span style="font-family: 'Jua', sans-serif">[ co ] 개</span>
     </li>
     <li class="cnt">
      <span style="font-family: 'Jua', sans-serif">[ co ] 개</span>
     </li>
     <li class="cnt">
      <span style="font-family: 'Jua', sans-serif">[ co ] 개</span>
     </li>
    </ul>

   </div> --%>

			<div id="profilebox">

				<table id="profileTable" style="width: 100%;">

					<colgroup>
						<col width="25%">
						<col width="25%">
						<col width="25%">
						<col width="25%">
					</colgroup>

					<tr>
						<td rowspan="4" style="width: 250px;"><img src="img03.jpg"
							style="width: 250px; height: 250px;"50%;></td>
						<td colspan="3"><span id="mail">&lt; E-mail :<span
								style="font-family: 'Jua', sans-serif">&nbsp;&nbsp;${authUser.email}</span>
								&nbsp; &gt;
						</span></td>
					</tr>

					<tr>
						<td colspan="3"><span id="name">&lt; Nickname
								:&nbsp;&nbsp; <span style="font-family: 'Jua', sans-serif">${authUser.nickName}</span>
								&nbsp; &gt;
						</span></td>
					</tr>

					<tr>
						<td colspan="3"><span id="par">&lt; Participation &gt;</span></td>
					</tr>

					<tr>
						<td>
							<div style="height: 100px; margin: 5px;">
								<span id="m"> · module :</span> <span class="badge"
									style="width: 50px; height: 30px; font-size: 20px;">50</span>
							</div>
						</td>
						<td>
							<div style="height: 100px; margin: 5px;">
								<span id="c"> · course :</span> <span class="badge"
									style="width: 50px; height: 30px; font-size: 20px;">50</span>
							</div>
						</td>
						<td>
							<div style="height: 100px; margin: 5px;">
								<span id="h"> · history :</span><span class="badge"
									style="width: 50px; height: 30px; font-size: 20px;">50</span>
							</div>
						</td>
					</tr>

				</table>

			</div>

			<br>

			<div id="cobox">
				<hr>
				<h3 style="font-family: 'Baloo Tamma', cursive;">
					My course&nbsp;&nbsp;<span class="badge">50</span>
				</h3>
				<hr>

				<br>


				<ul id="colist">
					<li class="co">
						<div class="panel panel-default" style="width: 200px;">
							<div class="panel-heading" style="margin-top: 0px;">title</div>
							<div class="panel-body">summary</div>
						</div>
					</li>
					<li class="co">
						<div class="panel panel-default" style="width: 200px;">
							<div class="panel-heading" style="margin-top: 0px;">title</div>
							<div class="panel-body">summary</div>
						</div>
					</li>
					<li class="co">
						<div class="panel panel-default" style="width: 200px;">
							<div class="panel-heading" style="margin-top: 0px;">title</div>
							<div class="panel-body">summary</div>
						</div>
					</li>
					<li class="co">
						<div class="panel panel-default" style="width: 200px; height: 131.17px">
							<div class="panel-body">
								<span id="plus"><a href="#" style="font-family: 'Jua', sans-serif; color: black;">[ 더보기 ]</a></span>
							</div>
						</div>
					</li>
				</ul>
			</div>

			<div id="mobox">
				<hr>
				<h3 style="font-family: 'Baloo Tamma', cursive;">
					My module&nbsp;&nbsp;<span class="badge">50</span>
				</h3>
				<hr>

				<br>

				<ul id="molist">
					<li class="mo">
						<div class="panel panel-default" style="width: 200px;">
							<div class="panel-heading" style="margin-top: 0px;">title</div>
							<div class="panel-body">summary</div>
						</div>
					</li>
					
					<li class="mo">
						<div class="panel panel-default" style="width: 200px;">
							<div class="panel-heading" style="margin-top: 0px;">title</div>
							<div class="panel-body">summary</div>
						</div>
					</li>
					
					<li class="mo">
						<div class="panel panel-default" style="width: 200px;">
							<div class="panel-heading" style="margin-top: 0px;">title</div>
							<div class="panel-body">summary</div>
						</div>
					</li>
					
					<li class="mo">
						<div class="panel panel-default" style="width: 200px; height: 131.17px">
							<div class="panel-body">
							<span id="plus"><a href="#" style="font-family: 'Jua', sans-serif; color: black;">[ 더보기 ]</a></span>
							</div>
						</div>
					</li>
				</ul>					
			</div>

		
		</div>

		<div class="butt">
			<a href="modifyUser?userId=${authUser.userId}" class="but"
				style="font-family: 'Jua', sans-serif; color: black; font-size: 22px;">[ 정보 수정 ]</a>
			&nbsp;&nbsp;&nbsp; <a href="removeUser?userId=${authUser.userId}" class="but"
				style="font-family: 'Jua', sans-serif; color: black; font-size: 22px;">[ 회원 탈퇴 ]</a>
		</div>







	</div>

	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
