<%@page import="yolo.vo.CoCourseAndCourseVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>




<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>YOLO :: userView</title>

<!-- 글꼴 -->
<link href="https://fonts.googleapis.com/css?family=Baloo+Tamma"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Jua"
	rel="stylesheet">

<!-- 부트스트랩 및 jQuery -->
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>

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
	padding: 0;
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

/* 모듈 호버의 리스트 */
.mm {
    position: absolute;
    border: dotted 2px black;
   /*  height: 357px; */
    width: 440px;
    /* font-size: 50px; */
    background-color: #c1bdbd;
    z-index: 2;
}

#not {
	font-size: 13px;
}

#pluss {
    font-size: 20px;
    position: relative;
    left: 360px;
    top: -26px;
}

.viewCon p {
	padding: 0px;
}

.dp_none {
	display: none;
}

.dp_block {
	display: block;
}

#cotable tr, #cotable td, #cotable tr {
	padding: -1px;
}

#cotable {
	position: relative;
	left: 10px !important;
	/* padding: 5px; */
	margin: -31px;
	/* margin-top: 14px; */
	position: relative;
	top: -18px;
}
</style>


<script type="text/javascript">
	$(function() {

		$(".mcnt").click(function() {
			//숫자가 있는 아이를 클릭했을 시
			if ($(this).next().hasClass("dp_block")) {//리스트가 켜져있다면
				$(this).next().removeClass("dp_block");
				$(this).next().addClass("dp_none");
			} else {//리스트가 안 켜져있다면
				//혹시 다른아이가 켜져있다면 그 아이들을 전부 안보이게 처리.
				$(".dp_block").removeClass("dp_block").addClass("dp_none");

				//클릭한 아이만 켜지도록 함
				$(this).next().removeClass("dp_none");
				$(this).next().addClass("dp_block");
			}
		});

	});
</script>

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
						<td rowspan="4" style="padding-right: 50px; padding-left: 45px;">
							<!-- style="width: 250px;" 있었음 --> <img
							src="${pageContext.request.contextPath}/images/profileImageBasic.png"
							style="width: 250px; height: 250px;">
						</td>
						<td colspan="3"><span id="mail"> &lt; E-mail
								:&nbsp;&nbsp; <span style="font-family: 'Jua', sans-serif">${user.email}</span>
								&nbsp;&gt;
						</span></td>
					</tr>

					<tr>
						<td colspan="3"><span id="name"> &lt;
								Nickname:&nbsp;&nbsp; <span
								style="font-family: 'Jua', sans-serif">${user.nickName}</span>
								&nbsp; &gt;
						</span></td>
					</tr>

					<tr>
						<td colspan="3"
							title="공동 공부하는 Module과 Course의 수와 리스트, 열람했던 topic의 수와 리스트를 보여주는 항목입니다."><span
							id="par">&lt; Co-Study & History &gt;</span></td>
					</tr>

					<tr>
						<td>
							<div style="height: 100px; margin: 5px;">
								<span id="m"> · module :</span> <span class="badge mcnt"
									style="width: 50px; height: 30px; font-size: 20px;">${coModuleAndModuleList.size()}</span>
								<%-- <div class="mm dp_none">
									<span id="not"> &nbsp;&nbsp; * 미리보기는 최근 등록순으로 5개까지만 제공이
										됩니다. 추가 내용은 더보기를 클릭해주세요 :D</span>
									<ul>
										<c:forEach var="coModuleAndModule" begin="1" end="5" step="1"
											items="${coModuleAndModuleList}">
											<li>${coModuleAndModule.mTitle}</li>
										</c:forEach>
									</ul>
									<span id="pluss"> +더보기</span>
								</div> --%>
								
								
								<c:if test="${ coModuleAndModuleList.size()>0}">
								<div class="mm dp_none">
									<span id="not"><p
											style="font-family: 'Jua', sans-serif; color: black;">
											&nbsp;&nbsp;* 미리보기는 최근 등록순으로 5개까지만 제공이 됩니다.<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;추가
											내용은 더보기를 클릭해주세요 :D
										</p></span>
									<ul>
										<table class="table table-sm table-sm" id="cotable">
											<thead>
												<tr style="padding: 10px;">
													<th scope="col"
														style="font-size: 20px; font-family: 'Jua', sans-serif;">번호</th>
													<th scope="col"
														style="font-size: 20px; font-family: 'Jua', sans-serif;">모듈
														제목</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="coModuleAndModule"
													items="${coModuleAndModuleList}" begin="0" end="4" varStatus="state"> <!-- state 는 현재 상태를 보여줌. 1 -> 2 -> 3 -> ... -->
													<tr>
														<td
															style="font-size: 20px; font-family: 'Jua', sans-serif; font-style: bold">
															&nbsp;&nbsp;&nbsp;${state.count}</td>
														<td><a href="#"
															style="font-size: 20px; font-family: 'Jua', sans-serif; color: white">
																&nbsp;&nbsp;${coModuleAndModule.mTitle}</a></td>
													</tr>
												</c:forEach>
											</tbody>
										</table>

									</ul>
									<c:if test="${coModuleAndModuleList.size() > 5}">
									<span id="pluss" ><a href="coModuleListPage?userId=${user.userId}"  style="font-family: 'Jua', sans-serif; color: black;"> +더보기</a></span>
									</c:if>
								</div>
								</c:if>
								
								
							</div>
						</td>
						<td>
							<div style="height: 100px; margin: 5px;">
								<span id="c"> · course :</span> <span class="badge mcnt"
									style="width: 50px; height: 30px; font-size: 20px;">
									${coCourseAndCourseList.size()}</span>
									<c:if test="${coCourseAndCourseList.size()>0}">
								<!-- 창 띄움 -->
								<div class="mm dp_none">
									<span id="not"><p
											style="font-family: 'Jua', sans-serif; color: black;">
											&nbsp;&nbsp;* 미리보기는 최근 등록순으로 5개까지만 제공이 됩니다.<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;추가
											내용은 더보기를 클릭해주세요 :D
										</p></span>

									<ul>
										<table class="table table-sm table-sm" id="cotable">
											<thead>
												<tr style="padding: 10px;">
													<th scope="col"
														style="font-size: 20px; font-family: 'Jua', sans-serif;">번호</th>
													<th scope="col"
														style="font-size: 20px; font-family: 'Jua', sans-serif;">코스
														제목</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="coCourseAndCourse"
													items="${coCourseAndCourseList}" begin="0" end="4" varStatus="state"> <!-- state 는 현재 상태를 보여줌. 1 -> 2 -> 3 -> ... -->
													<tr>
														<td
															style="font-size: 20px; font-family: 'Jua', sans-serif; font-style: bold">
															&nbsp;&nbsp;&nbsp;${state.count}</td>
														<td><a href="#"
															style="font-size: 20px; font-family: 'Jua', sans-serif; color: white">
																&nbsp;&nbsp;${coCourseAndCourse.cTitle}</a></td>
													</tr>
												</c:forEach>
											</tbody>
										</table>

									</ul>
									<c:if test="${coCourseAndCourseList.size() > 5}">
									<span id="pluss" ><a href="coCourseListPage?userId=${user.userId}" style="font-family: 'Jua', sans-serif; color: black;"> +더보기</a></span>
									</c:if>
								</div>
								</c:if>
							</div>
						</td>
						<td>
							<div style="height: 100px; margin: 5px;">
								<span id="h"> · history :</span> <span class="badge mcnt"
									style="width: 50px; height: 30px; font-size: 20px;">50</span>
							</div>
						</td>
					</tr>

				</table>

			</div>

			<div id="cobox">

				<hr>
				<h3 style="font-family: 'Baloo Tamma', cursive;">
					My course&nbsp;&nbsp;<span class="badge">${courseList.size()}</span>
				</h3>
				<hr>

				<div id="coboxContent" style="margin: 20px; text-align: center;">

					<c:if test="${not empty courseList}">
						<ul id="colist">
							<c:forEach var="course" items="${courseList}" begin="0" end="2">
								<li class="co">
									<div class="panel panel-default" style="width: 200px;">
										<div class="panel-heading" style="margin-top: 0px;">
											<a href="coursePage?courseId=${course.courseId}"
												style="font-family: 'Jua', sans-serif; color: black;">${course.cTitle}</a>
										</div>
										<div class="panel-body"
											style="font-family: 'Jua', sans-serif;">${course.cSummary}</div>
									</div>
								</li>
							</c:forEach>
							<c:if test="${courseList.size() > 3}">
								<li class="co">
									<div class="panel panel-default"
										style="width: 200px; height: 131.17px">
										<a href="#"
											style="font-family: 'Jua', sans-serif; color: black;"
											class="plus">[ 더 보 기 ]</a>
									</div>
								</li>
							</c:if>
						</ul>
					</c:if>

					<c:if test="${empty courseList}">존재하는 Course가 없습니다.</c:if>

				</div>

			</div>

			<br> <br>

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
										<div class="panel-heading" style="margin-top: 0px;">
											<a href="modulePage?moduleId=${module.moduleId}"
												style="font-family: 'Jua', sans-serif; color: black;">${module.mTitle}</a>
										</div>
										<div class="panel-body"
											style="font-family: 'Jua', sans-serif; color: black;">${module.mSummary}</div>
									</div>
								</li>
							</c:forEach>
							<c:if test="${moduleList.size() > 3}">
								<li class="mo">
									<div class="panel panel-default"
										style="width: 200px; height: 131.17px">
										<a href="#"
											style="font-family: 'Jua', sans-serif; color: black;"
											class="plus">[ 더 보 기 ]</a>
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
					<a href="modifyUser?userId=${authUser.userId}" class="but"
						style="font-family: 'Jua', sans-serif; color: black; font-size: 22px;">[
						정보 수정 ]</a> &nbsp;&nbsp;&nbsp; <a
						href="removeUser?userId=${authUser.userId}" class="but"
						style="font-family: 'Jua', sans-serif; color: black; font-size: 22px;">[
						회원 탈퇴 ]</a>
				</div>
			</c:if>

		</div>


	</div>

	<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>



