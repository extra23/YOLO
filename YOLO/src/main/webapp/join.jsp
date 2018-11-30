<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<!-- 합쳐지고 최소화된 최신 CSS33 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트1 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>

<style type="text/css">
@import url('https://fonts.googleapis.com/css?family=Roboto+Condensed');

body, input::placeholder{font-family: 'Jua', sans-serif;}
input{font-family: 'Jua', sans-serif!important;}

.preserve-3d {
	transform-style: preserve-3d;
	-webkit-transform-style: preserve-3d;
}

.form-horizontal {
	margin-left: 50px;
	margin-top: 40px;
}

.mainForm {
	width: 100%;
	height: 1400px;
	background-color: #F7F7F7;
	font-family: 'Jua', sans-serif;
	text-align: center;
}

.joinForm {
	width: 60%;
	height: 1200px;
	background-color: gainsboro;
	display: inline-block;
	margin-top: 30px;
	border: 1px solid black;
	border-radius: 10px;
}

.form-group-lg {
	margin-right: 20px !important;
}

.btn {
	margin-bottom: 10px;
}

.joinTitle {
	margin-top: 40px;
	font-size: 50px;
}

input[type="file"] {
	width: 0%;
	height: 0%;
}

.profile {
	width: 20%;
	height: 200px;
	margin-left: 39%;
	border: 1px solid darkgray;
	border-radius: 10px;
	background-color: white;
}

.profileButton {
	width: 30%;
	margin-left: 22.5%;
	margin-bottom: 30px;
	border-radius: 10px;
	margin-right: 5%;
}

.profileTitle {
	padding-right: 60px;
	padding-bottom: 10px;
}

.form-control {
	margin-bottom: 20px;
}

.button_base {
	margin: 0;
	border: 0;
	font-size: 25px;
	position: relative;
	top: 50%;
	left: 50%;
	margin-top: 10px;
	margin-left: -23%;
	width: 200px;
	height: 50px;
	text-align: center;
	box-sizing: border-box;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	-webkit-user-select: none;
	cursor: default;
	border-radius: 10px;
}

.button_base:hover {
	cursor: pointer;
}

.b01_simple_rollover {
	color: #000000;
	border: #000000 solid 1px;
	padding: 10px;
	background-color: #ffffff;
}

.b01_simple_rollover:hover {
	color: #ffffff;
	background-color: #000000;
}

select {
	width: 100%;
	height: 40px;
	border: 1px solid lightgray;
	border-radius: 5px;
	font-size: 20px!important;
	color: gray!important;
	
}

</style>
<script type="text/javascript">
	$(function() {
		$('.fileButton').click(function(e) {
			e.preventDefault();
			$("input:file").click();
			var ext = $("input:file").val().split(".").pop().toLowerCase();
			if (ext.length > 0) {
				if ($.inArray(ext, [ "gif", "png", "jpg", "jpeg" ]) == -1) {
					alert("gif,png,jpg 파일만 업로드 할수 있습니다.");
					return false;
				}
			}
			$("input:file").val().toLowerCase();
		});
	});
	
$(document).ready(function(){
	$('.joinButton').click(function(){
		if($('input:password').val().length < $('input:password').attr('min')){
			alert('8~12글자 사이로 입력해주세요');
		}
	});
});
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/WEB-INF/jsp/header2.jsp"></jsp:include>
	<div class="mainForm">
		<div class="joinForm">
			<p class="joinTitle">JOIN</p>
			<form class="form-horizontal">
				<label for="profileImage" class="control-label profileTitle">ProfileImage</label>
				<div class="form-group form-group-lg">
					<div class="profile">
						<input type="file" id="profileImage">
					</div>
					<div class="profileButton">
						<input type="button" value="Browse"
							class="fileButton button_base b01_simple_rollover"
							onfocus="this.blur();">
					</div>

				</div>
				<div class="form-group form-group-lg">
					<label for="email" class="col-sm-3 control-label">Email</label>
					<div class="col-sm-6">
						<input type="email" class="form-control" id="email" placeholder="example@email.com">
					</div>
				</div>
				<div class="form-group form-group-lg">
					<label for="nickName" class="col-sm-3 control-label">Nickname</label>
					<div class="col-sm-6">
						<input type="text" class="form-control" id="nickName" maxlength="8" placeholder="8자 이내">
					</div>
				</div>
				<div class="form-group form-group-lg">
					<label for="password" class="col-sm-3 control-label">Password</label>
					<div class="col-sm-6">
						<input type="password" class="form-control" id="password" maxlength="12" min="8" placeholder="8~12글자">
					</div>
				</div>
				<div class="form-group form-group-lg">
					<label for="confirmPassword" class="col-sm-3 control-label">ConfirmPassword</label>
					<div class="col-sm-6">
						<input type="password" class="form-control" id="confirmPassword"  maxlength="12" min="8" placeholder="8~12글자">
					</div>
				</div>
				<div class="form-group form-group-lg">
					<label for="pQId" class="col-sm-3 control-label">p_qId</label>
					<div class="col-sm-6">
						<select name="p_qId">
							<option selected>&nbsp;비밀번호 힌트</option>
							<c:forEach var="pQuestion" items="qList">
								<option value="${pQuestion.p_qId}">${pQuestion.p_qContent}</option>
							</c:forEach>
						</select>
					</div>
				</div>
				<div class="form-group form-group-lg">
					<label for="p_answer" class="col-sm-3 control-label">p_answer</label>
					<div class="col-sm-6">
						<input type="text" class="form-control" id="p_answer" maxlength="20">
					</div>
				</div>
				<div>
					<div class="form-group">
						<button class="button_base b01_simple_rollover col-sm-5 joinButton">Join</button>
					</div>

					<div class="form-group">
						<button class="button_base b01_simple_rollover col-sm-5">Cancel</button>
					</div>

				</div>
			</form>

		</div>
	</div>
	<jsp:include page="/WEB-INF/jsp/footer.jsp"></jsp:include>
</body>
</html>