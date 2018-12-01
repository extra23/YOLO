<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>

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
	
		<h1>프로필 수정</h1>
		
		<div id="modifyForm">
		
			<form action="modifyUser" method="post" enctype="multipart/form-data">
		
				<input type="hidden" name="userId" value="${param.userId}">
				
				<p>
					<img src="${pageContext.request.contextPath}/images/profileImageBasic.png" style="width: 250px; height: 250px; border-radius: 50%;">
				</p>
				
				<p>
					email : <input type="email" name="email" readonly="readonly" value="${authUser.email}">
				</p>
				
				<p>
					nickName : <input type="text" name="nickName" value="${authUser.nickName}">
				</p>
				
				<p>
					newPwd1 : <input type="password" name="newPwd1" placeholder="새로운 비밀번호">
					<c:if test="${errors.duplicatedPassword}"><span>바꾸려는 비밀번호가 현재 비밀번호와 같습니다.</span></c:if>
				</p>
				
				<p>
					newPwd2 : <input type="password" name="newPwd2" placeholder="새로운 비밀번호">
					<c:if test="${errors.notEqualNewPwd}"><span>새로 입력한 비밀번호들이 맞지 않습니다.</span></c:if>
				</p>
				
				<p>
					p_qId : <input type="number" name="p_qId" value="${authUser.p_qId}">
				</p>
				
				<p>
					p_answer : <input type="text" name="p_answer" value="${authUser.p_answer}">
				</p>
				
				<p>
					수정하시려면 현재 비밀번호를 입력해 주세요. <br>
					<input type="password" name="oldPwd" placeholder="현재 비밀번호">
					<c:if test="${errors.oldPwd}"><span>현재 비밀번호를 입력해주세요</span></c:if>
					<c:if test="${errors.invalidPassword}"><span>잘못된 비밀번호 입니다.</span></c:if>
				</p>
				
				<p>
					<input type="submit" value="수정">
				</p>
		
			</form>
		
		</div>
	
	</div>

	<jsp:include page="footer.jsp"></jsp:include>
	
	<!-- <script>
	
		if("${modifyFlag}" > 0){
			alert("수정되었습니다.");
		}
	
	</script> -->
</body>
</html>


