<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>YOLO :: join</title>

	<!-- 합쳐지고 최소화된 최신 CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

	<!-- 부가적인 테마 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

	<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

	<link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet">

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>

	<style>

		@import url('https://fonts.googleapis.com/css?family=Roboto+Condensed');

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
			background-color: #F7F7F7;
			font-family: 'Jua', sans-serif;
			text-align: center;
		}
		
		.modifyForm {
			width: 60%;	
			background-color: gainsboro;
			display: inline-block;
			margin-top: 30px;
			margin-bottom: 30px;
			border: 1px solid black;
			border-radius: 10px;
		}
		
		.form-group-lg {
			/* margin-right: 20px !important; */
		}
		
		.btn {
			margin-bottom: 10px;
		}
		
		.modifyTitle {
			margin-top: 40px;
			font-size: 50px;
		}
		
		/* input[type="file"] {
			width: 0%;
			height: 0%;
		} */
		
		/* .profile {
			width: 20%;
			height: 200px;
			margin-left: 39%;
			border: 1px solid darkgray;
			border-radius: 10px;
			background-color: white;
		} */
		
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
		
	</style>
</head>
<body>
	<jsp:include page="/WEB-INF/jsp/header2.jsp"></jsp:include>
	
	<div class="mainForm">
		
		<div class="modifyForm">
			
			<p class="modifyTitle">프로필 수정</p><!-- ?? -->
			
			<form class="form-horizontal" action="modify" method="post" enctype="multipart/form-data">
				
				<!-- <label for="profileImage" class="control-label profileTitle">ProfileImage</label> -->
				<div class="form-group form-group-lg">
					<div class="profile">
						<img id="profileImg" src="${pageContext.request.contextPath}/images/profileImageBasic.png" style="width: 250px; height: 250px; border-radius: 50%; cursor: pointer;" title="프로필 이미지">
						<input id="input_img" name="file" type="file" style="display: none;">
					</div>
					<div class="profileButton">
						<input id="basicBtn" type="button" value="Basic Image" class="fileButton button_base b01_simple_rollover" onfocus="this.blur();">
					</div>
				</div>
				
				<div class="form-group form-group-lg">
					<label for="email" class="col-sm-3 control-label">Email</label>
					<div class="col-sm-6">
						<input type="email" class="form-control" name="email" placeholder="${user.email}" readonly>
					</div>
				</div>
				
				<div class="form-group form-group-lg">
					<label for="nickName" class="col-sm-3 control-label">Nickname</label>
					<div class="col-sm-6">
						<input type="text" class="form-control" name="nickName" value="${user.nickName}">
					</div>
				</div>
				
				<div class="form-group form-group-lg">
					<label for="password" class="col-sm-3 control-label">Password</label>
					<div class="col-sm-6">
						<input type="password" class="form-control" name="oldPwd" placeholder="현재 비밀번호">
						<c:if test="${errors.oldPwd}"><span>현재 비밀번호를 입력해주세요</span></c:if>
						<c:if test="${errors.wrongOldPwd}"><span>잘못된 비밀번호 입니다.</span></c:if>
					</div>
				</div>
				
				<div class="form-group form-group-lg">
					<label for="confirmPassword" class="col-sm-3 control-label">ConfirmPassword</label>
					<div class="col-sm-6">
						<input type="password" class="form-control" name="newPwd" placeholder="새로운 비밀번호">
						<c:if test="${errors.newPwd}"><span>새로운 비밀번호를 입력해주세요</span></c:if>
						<c:if test="${errors.wrongOldPwd}"><span>바꾸려는 비밀번호가 현재 비밀번호와 같습니다.</span></c:if>
					</div>
				</div>
				
				<div class="form-group form-group-lg">
					<label for="p_qId" class="col-sm-3 control-label">p_qId</label>
					<div class="col-sm-6">
						<input type="number" class="form-control" name="p_qId" value="${user.p_qId}">
					</div>
				</div>
				
				<div class="form-group form-group-lg">
					<label for="p_answer" class="col-sm-3 control-label">p_answer</label>
					<div class="col-sm-6">
						<input type="text" class="form-control" name="p_answer" value="${user.p_answer}">
					</div>
				</div>
				
				<div>
					<div class="form-group">
						<input type="submit" value="수정" class="button_base b01_simple_rollover col-sm-5">
					</div>

					<div class="form-group">
						<div class="button_base b01_simple_rollover col-sm-5">Cancel</div>
					</div>
				</div>
				
			</form>

		</div>
		
	</div>
	
	<jsp:include page="/WEB-INF/jsp/footer.jsp"></jsp:include>
	
	<script>
	
		if("${modifyFlag}" > 0){
			alert("수정되었습니다.");
		}
	
	</script>
</body>
</html>


