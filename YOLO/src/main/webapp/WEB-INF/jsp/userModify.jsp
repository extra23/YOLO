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

	<style type="text/css">
		#contentBody {
			background: #F7F7F7 no-repeat center center fixed;
			-webkit-background-size: cover; 
			-moz-background-size: cover; 
			-o-background-size: cover; 
			background-size: cover;
		}
	
	</style>
</head>
<body id="contentBody">

	<jsp:include page="header2.jsp"></jsp:include>
	
	<h1 id="h1">프로필 수정</h1>
	<br>
	
	<form action="modify.do" method="post" name="fr">
	
	<p>
		<input type="file" name="file" placeholder="파일 선택" hidden="hidden">
	</p>
	<p>
		<input type="text" name="nickName" placeholder="nickName">
	</p>
	<p>
		<input type="password" name="oldPwd" placeholder="현재 비밀번호11">
		<c:if test="${errors.oldPwd}"><span>현재 비밀번호를 입력해주세요</span></c:if>
		<c:if test="${errors.wrongOldPwd}"><span>잘못된 비밀번호 입니다.</span></c:if>
	</p>
	<p>
		<input type="password" name="newPwd" placeholder="새로운 비밀번호">
	</p>
	<p>
		<input type="text" name="p_qId">
	</p>
	<p>
		<input type="text" name="p_answer">
	</p>
	<p>
		<input type="submit" name="정보 수정">
	</p>
	
	
	
	</form>

	<jsp:include page="footer.jsp"></jsp:include>
	
	<script>
	
		if("${modifyFlag}" > 0){
			alert("수정되었습니다.");
		}
	
	</script>
</body>
</html>