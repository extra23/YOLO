<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
	
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>관리자 : 사용자 강제 탈퇴</title>
	
	<!-- (공통) bootstrap -->
	<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
	
	<!-- 글꼴 -->
	<link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet">
	
	<style>
	
		@import url('https://fonts.googleapis.com/css?family=Roboto+Condensed');
		
		.mainForm {
			width: 100%;
			background-color: #F7F7F7;
			font-family: 'Jua', sans-serif;
			text-align: center;
		}
		
		.deleteForm {
			width: 60%;
			background-color: gainsboro;
			display: inline-block;
			margin-top: 30px;
			margin-bottom: 30px;
			border: 1px solid black;
			border-radius: 10px;
		}
		
		/* .btn {
			margin-bottom: 10px;
		} */
	
		.deleteTitle {
			margin-top: 40px;
			font-size: 50px;
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

</head>
<body>

	<jsp:include page="header3.jsp"></jsp:include>
	
	<div class="mainForm">
		
		<div class="deleteForm">
		
			<p class="deleteTitle">관리자 : 회원 강제 탈퇴</p>
			
			<form class="form-horizontal" action="adminUserDelete" method="post" enctype="multipart/form-data">
				
				<input type="hidden" name="userId" value="${user.userId}">
				
				<div class="form-group form-group-lg">
					<div class="profile">
						<img id="profileImg" src="${pageContext.request.contextPath}/images/profileImageBasic.png" style="width: 250px; height: 250px; border-radius: 50%; cursor: pointer;" title="프로필 이미지"> 
						<input id="input_img" name="file" type="file" style="display: none;" accept="image/*">
					</div>
				</div>	
				
				<div class="form-group form-group-lg">
					<label for="email" class="col-sm-3 control-label">Email</label>
					<div class="col-sm-6">
						<input type="email" class="form-control" name="email" readonly="readonly" value="${user.email}">
					</div>
				</div>
			
			
				<div class="form-group form-group-lg">
					<label for="password" class="col-sm-3 control-label">사용자의 비밀번호</label>
					<div class="col-sm-6">
						<input type="password"  class="form-control" name="u_password" placeholder="(*필수)현재 사용자 비밀번호">
						<c:if test="${errors.u_password}"><span>사용자 비밀번호를 입력해주세요</span></c:if>
						<c:if test="${errors.invalidPassword}"><span>잘못된 사용자 비밀번호 입니다.</span></c:if>
					</div>
				</div>
				
				<div class="form-group form-group-lg">
					<label for="confirmPassword" class="col-sm-3 control-label">관리자 비밀번호</label>
					<div class="col-sm-6">
					<input type="hidden" name="adminId" value="${authUser.userId}">
							<input type="password"  class="form-control" name="ad_password" placeholder="(*필수)관리자 비밀번호">
							<c:if test="${errors.ad_password}"><span>관리자 비밀번호를 입력해주세요</span></c:if>
							<c:if test="${errors.adminInvalidPassword}"><span>잘못된 관리자 비밀번호 입니다.</span></c:if>
					</div>
				</div>
				
				<div>
					<div class="form-group">
						<input type="submit" value="Delete"
							class="button_base b01_simple_rollover col-sm-5 " style="position: relative; left: 20%;">
					</div>
				</div>
				
				
				<div><div class="form-group">
						<input type="button" value="Cancel" onClick="location.href='adminUserList'"
							class="button_base b01_simple_rollover col-sm-5 " style="position: relative; margin-bottom: 10px; left: 20%;">
					</div>
				</div>
				
			</form>
		
		</div>
		
	</div>
	
	<jsp:include page="footer.jsp"></jsp:include>


</body>
</html>