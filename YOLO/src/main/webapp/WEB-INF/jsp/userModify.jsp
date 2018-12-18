<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<!--  -->
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>YOLO :: join</title>

	<!-- (공통) bootstrap -->
	<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
	
	<!-- 글꼴 -->
	<link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet">

	<style>

		@import url('https://fonts.googleapis.com/css?family=Roboto+Condensed');
	
		.preserve-3d {
			transform-style: preserve-3d;
			-webkit-transform-style: preserve-3d;
		}
		
		/* .form-horizontal {
			margin-left: 50px;
			margin-top: 40px;
		} */
		
		.mainForm {
			width: 100%;
			background-color: #F7F7F7;
			font-family: 'Jua', sans-serif;
			text-align: center;
		}
		
		.joinForm {
			width: 60%;
			background-color: gainsboro;
			display: inline-block;
			margin-top: 30px;
			margin-bottom: 30px;
			border: 1px solid black;
			border-radius: 10px;
		}
		
		.btn {
			margin-bottom: 10px;
		}
	
		.joinTitle {
			margin-top: 40px;
			font-size: 50px;
		}
		
		.profileButton {
			width: 30%;
			/* margin-left: 22.5%;
			margin-bottom: 30px; */
			border-radius: 10px;
			/* margin-right: 5%; */
			margin: 20px auto;
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
			margin-top: 10px;
			/* margin-left: -23%; */
			width: 60%;
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
			font-size: 20px !important;
			color: gray !important;
		}
	
	</style>
		
	<script>
		
		$(document).ready(function() {
			
			$("#profileImg").click(function() {
				$("#input_img").click();
			})
			
			$("#input_img").on("change", fileChange);
			
			$("#basicBtn").on("click", toBasic);
			
		})
	
		function fileChange(e) {
	
			var files = e.target.files;
			var filesArr = Array.prototype.slice.call(files);
	
			filesArr.forEach(function(f) {
				if (!f.type.match("image.*")) {
					alert("확장자는 이미지 확장자만 가능합니다.");
					return;
				}
	
				var reader = new FileReader();
				reader.onload = function(e) {
					$("#profileImg").attr("src", e.target.result);
				}
				reader.readAsDataURL(f);
			});
	
		}
	
		function toBasic(e) {
			e.preventDefault();
	
			/* if ($.browser.msie) { 
				// ie 일때 input[type=file] init. 
				$("#input_img").replaceWith( $("#filename").clone(true) ); 
			} else { 
				// other browser 일때 input[type=file] init. 
				$("#input_img").val("${pageContext.request.contextPath}/images/profileImageBasic.png"); 
			} */
	
			$("#input_img").val("");
	
			$("#profileImg").attr("src", "${pageContext.request.contextPath}/images/profileImageBasic.png")
		}
		
	</script>

</head>
<body>

	<jsp:include page="header3.jsp"></jsp:include>

	<div class="mainForm">

		<div class="joinForm">

			<p class="joinTitle">MODIFY</p>

			<form class="form-horizontal" action="modifyUser" method="post" enctype="multipart/form-data">
				
				<input type="hidden" name="userId" value="${param.userId}">

				<div class="form-group form-group-lg">
					<div class="profile">
						<img id="profileImg" src="${pageContext.request.contextPath}/images/profileImageBasic.png" style="width: 250px; height: 250px; border-radius: 50%; cursor: pointer;" title="프로필 이미지"> 
						<input id="input_img" name="file" type="file" style="display: none;" accept="image/*">
					</div>
					<div class="profileButton">
						<input id="basicBtn" type="button" value="Basic Image" class="fileButton button_base b01_simple_rollover" onfocus="this.blur();">
					</div>
				</div>

				<div class="form-group form-group-lg">
					<label for="email" class="col-sm-3 control-label">Email</label>
					<div class="col-sm-6">
						<input type="email" class="form-control" name="email" readonly="readonly" value="${user.email}">
					</div>
				</div>

				<div class="form-group form-group-lg">
					<label for="nickName" class="col-sm-3 control-label">Nickname</label>
					<div class="col-sm-6">
						<input type="text" class="form-control" name="nickName" value="${user.nickName}">
						<c:if test="${errors.email}">닉네임을 입력해주세요.</c:if>
					</div>
				</div>

				<div class="form-group form-group-lg">
					<label for="password" class="col-sm-3 control-label">New Password</label>
					<div class="col-sm-6">
						<input type="password" class="form-control" name="newPwd1" placeholder="새로운 비밀번호 (바꿀 경우만 작성)">
						<c:if test="${errors.password}">비밀번호를 입력해주세요.</c:if>
					</div>
				</div>

				<div class="form-group form-group-lg">
					<!--  -->
					<label for="confirmPassword" class="col-sm-3 control-label">ConfirmPassword</label>
					<div class="col-sm-6">
						<input type="password" class="form-control" name="newPwd2" placeholder="새로운 비밀번호 재확인">
						<c:if test="${errors.confirmPassword}">비밀번호를 재입력 해주세요.</c:if>
						<c:if test="${errors.passwordNotMatch}">재입력한 비밀번호가 일치하지 않습니다.</c:if>
					</div>
				</div>

				<div class="form-group form-group-lg">
					<label for="pQId" class="col-sm-3 control-label">비밀번호 확인 질문</label>
					<div class="col-sm-6">
						<c:if test="${!empty qList}">
							<select name="pwQId">
								<c:forEach var="pQuestion" items="${qList}">
									<c:if test="${pQuestion.pwQId eq user.pwQId}">
										<option selected value="${pQuestion.pwQId}">${pQuestion.question}</option>
									</c:if>
									<c:if test="${not (pQuestion.pwQId eq user.pwQId)}">
										<option value="${pQuestion.pwQId}">${pQuestion.question}</option>
									</c:if>
								</c:forEach>
							</select>
						</c:if>
					</div>
				</div>

				<div class="form-group form-group-lg">
					<label for="p_answer" class="col-sm-3 control-label">비밀번호 확인 답</label>
					<div class="col-sm-6">
						<input type="text" class="form-control" name="pwA" value="${user.pwA}">
						<c:if test="${errors.pwA}">질문에 대한 답을 작성해 주세요.</c:if>
					</div>
				</div>
				
				<div class="form-group form-group-lg">
					<label for="password" class="col-sm-3 control-label">현재 비밀번호</label>
					<div class="col-sm-6">
						<input type="password" class="form-control" name="oldPwd" placeholder="현재 비밀번호">
					</div>
				</div>
				
				<div>
					<div class="form-group">
						<input type="submit" value="Modify"
							class="button_base b01_simple_rollover col-sm-5"
							style="position: relative; left: 20%;">
					</div>

					<div class="form-group">
						<div class="button_base b01_simple_rollover col-sm-5"
							style="position: relative; margin-bottom: 10px; left: 20%;">Cancel</div>
					</div>
				</div>

			</form>

		</div>

	</div>

	<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>