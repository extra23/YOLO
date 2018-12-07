<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>YOLO :: userView</title>

	<!-- 글꼴 -->
	<link href="https://fonts.googleapis.com/css?family=Baloo+Tamma" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet">

	<!-- 부트스트랩 및 jQuery -->
	<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>

	<style>

		#mypage {
			font-size: 80px;
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
			position: relative;
			top: 20px;
		}

		#name {
			position: relative;
			top: 17px;
		}

		#par {
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
	
		#viewCon ul {
			list-style: none;
		}

		#viewCon ul li {
			float: left;
			margin: 25px;
			margin-top: 0px;
		}
		
		#mobox {
			clear: both;
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
		
		.plus {
			position: relative;
			top: 56px;
		}
		
		.badge {
			font-weight: lighter;
			padding-top: 6px;
			min-width: 30px;
		}
	
	</style>

</head>
<body id="contentBody">

	<jsp:include page="header3.jsp"></jsp:include>

	<div id="viewCon">

		<div class="container">

			<h1 id="mypage" style="font-family: 'Baloo Tamma', cursive;">MYPAGE</h1>

			<div id="profilebox">

				<table id="profileTable" style="width: 100%;">

					<colgroup>
						<col width="250px">
						<col width="25%">
						<col width="25%">
						<col width="25%">
					</colgroup>

					<tr>
						<td rowspan="4" style="padding-right: 50px; padding-left: 45px;">	<!-- style="width: 250px;" 있었음 -->
							<img src="${pageContext.request.contextPath}/images/profileImageBasic.png" style="width: 250px; height: 250px;"></td>
						<td colspan="3">
							<span id="mail">
								&lt; E-mail :&nbsp;&nbsp;
								<span style="font-family: 'Jua', sans-serif">${user.email}</span>
								&nbsp;&gt;
							</span>
						</td>
					</tr>

					<tr>
						<td colspan="3">
							<span id="name">
								&lt; Nickname:&nbsp;&nbsp; 
								<span style="font-family: 'Jua', sans-serif">${user.nickName}</span>
								&nbsp; &gt; 
							</span>
						</td>
					</tr>

					<tr>
						<td colspan="3" title="공동 공부하는 Module과 Course의 수와 리스트, 열람했던 topic의 수와 리스트를 보여주는 항목입니다."><span id="par">&lt; Co-Study & History &gt;</span></td>
					</tr>

					<tr>
						<td>
							<div style="height: 100px; margin: 5px;">
								<span id="m"> · module :</span> 
								<span class="badge" style="width: 50px; height: 30px; font-size: 20px;">50</span>
							</div>
						</td>
						<td>
							<div style="height: 100px; margin: 5px;">
								<span id="c"> · course :</span>
								<span class="badge" style="width: 50px; height: 30px; font-size: 20px;">50</span>
							</div>
						</td>
						<td>
							<div style="height: 100px; margin: 5px;">
								<span id="h"> · history :</span>
								<span class="badge" style="width: 50px; height: 30px; font-size: 20px;">50</span>
							</div>
						</td>
					</tr>

				</table>

			</div>

			<div id="cobox">
				
				<hr>
				<h3 style="font-family: 'Baloo Tamma', cursive;">My course&nbsp;&nbsp;<span class="badge">${courseList.size()}</span></h3>
				<hr>
				
				<div id="coboxContent" style="margin: 20px; text-align: center;">
					
					<c:if test="${not empty courseList}">
						<ul id="colist">
							<c:forEach var="course" items="${courseList}" begin="0" end="2">
								<li class="co">
								<div class="panel panel-default" style="width: 200px;">
									<div class="panel-heading" style="margin-top: 0px;"><a href="coursePage?courseId=${course.courseId}">${course.cTitle}</a></div>
									<div class="panel-body">${course.cSummary}</div>
								</div>
							</li>
							</c:forEach>
							<c:if test="${courseList.size() > 3}">
								<li class="co">
									<div class="panel panel-default" style="width: 200px; height: 131.17px">
										<a href="#" style="font-family: 'Jua', sans-serif; color: black;" class="plus">[ 더 보 기 ]</a>
									</div>
								</li>
							</c:if>
						</ul>
					</c:if>
				
					<c:if test="${empty courseList}">존재하는 Course가 없습니다.</c:if>
				
				</div>
				
			</div>
			
			<br><br>

			<div id="mobox">
				<hr>
				<h3 style="font-family: 'Baloo Tamma', cursive;">
					My module&nbsp;&nbsp;<span class="badge">${moduleList.size()}</span>
				</h3>
				<hr>

				<div id="moboxContent" style="margin: 20px; text-align: center;">
					
					<c:if test="${not empty moduleList}">
						<ul id="molist">
							<c:forEach var="module" items="${moduleList}" begin="0" end="2">
								<li class="mo">
									<div class="panel panel-default" style="width: 200px;">
										<div class="panel-heading" style="margin-top: 0px;"><a href="modulePage?moduleId=${module.moduleId}">${module.mTitle}</a></div>
										<div class="panel-body">${module.mSummary}</div>
									</div>
								</li>
							</c:forEach>
							<c:if test="${moduleList.size() > 3}">
								<li class="mo">
									<div class="panel panel-default" style="width: 200px; height: 131.17px">
										<a href="#" style="font-family: 'Jua', sans-serif; color: black;" class="plus">[ 더 보 기 ]</a>
									</div>
								</li>
							</c:if>
						</ul>
					</c:if>
				
					<c:if test="${empty moduleList}">존재하는 Module이 없습니다.</c:if>	
				
				</div>
								
			</div>

			<c:if test="${authUser.userId eq user.userId}">
				<div class="butt" style="clear: both; text-align: right;">
					<a href="modifyUser?userId=${authUser.userId}" class="but" style="font-family: 'Jua', sans-serif; color: black; font-size: 22px;">[ 정보 수정 ]</a>
					&nbsp;&nbsp;&nbsp; 
					<a href="removeUser?userId=${authUser.userId}" class="but" style="font-family: 'Jua', sans-serif; color: black; font-size: 22px;">[ 회원 탈퇴 ]</a>
				</div>
			</c:if>
		
		</div>

	</div>

	<jsp:include page="footer.jsp"></jsp:include>
	
</body>
</html>
