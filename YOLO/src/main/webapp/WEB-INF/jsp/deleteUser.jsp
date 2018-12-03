<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>deleteUser</title>

	<!-- 합쳐지고 최소화된 최신 CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

	<!-- 부가적인 테마 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

	<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

	<link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet">
	
	<style>
		
		#contentBody {
			background: #F7F7F7 no-repeat center center fixed;
			-webkit-background-size: cover; 
			-moz-background-size: cover; 
			-o-background-size: cover; 
			background-size: cover;
		}
		
		#content {
			text-align: center;
		}
		
	</style>

</head>
<body id="contentBody">

	<jsp:include page="header3.jsp"></jsp:include>
	
	<div id="content">
	
		<h1>회원 탈퇴</h1>
		
		<div id="deleteForm">
			
			<form action="deleteUser" method="post" enctype="multipart/form-data">
				
				<input type="hidden" name="userId" value="${param.userId}">
				
				<p>
					<img src="${pageContext.request.contextPath}/images/profileImageBasic.png" style="width: 250px; height: 250px; border-radius: 50%;">
				</p>
				
				<p>
					email : <input type="email" name="email" readonly="readonly" value="${authUser.email}">
				</p>
			
				<p>
					password : <input type="password" name="password" placeholder="비밀번호">
					<c:if test="${errors.invalidPassword}"><span>잘못된 비밀번호 입니다.</span></c:if>
				</p>
				
				<p>
					<input type="submit" value="탈퇴">
				</p>
				
			</form>
		
		</div>
		
	</div>
	
	<jsp:include page="footer.jsp"></jsp:include>
	

</body>
</html>