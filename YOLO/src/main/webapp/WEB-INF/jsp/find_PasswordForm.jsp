<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>비밀번호 찾는 페이지</title>

	<!-- 합쳐지고 최소화된 최신 CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

	<!-- 부가적인 테마. -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

	<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

	<link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet">

	<style type="text/css">
		body {
			background: #F7F7F7 no-repeat center center fixed;
			-webkit-background-size: cover; 
			-moz-background-size: cover; 
			-o-background-size: cover; 
			background-size: cover;
		}
		
		.form-horizontal {
			margin-left: 50px;
			margin-top: 70px;
		}
		
		.mainForm {
			width: 100%;
			font-family: 'Jua', sans-serif;
			text-align: center;
			margin-top: 180px;
		}
		
		.passwordForm {
			width: 40%;
			margin: 0 auto;
			background-color: lightgray;
			border: 1px solid black;
			border-radius: 10px;
			padding-bottom : 20px;
		}
		
		.form-group-lg {
			margin-right: 20px !important;
		}
		
		.btn {
			margin-bottom: 10px;
		}
		
		.passwordForm p {
			font-size: 50px;
			margin-top: 40px;
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
		$(function(){
			
			$("#findBtn").click(function(){
				$.ajax({
					url : "Find_PasswordForm.do",
					type : "POST",
					data : {
						email:$("#email").val(),
						p_qId:$("#pwQId").val(),
						p_answer:$("#pwA").val()
					},
					success : function(result){
						alert(result);
					},
					error : function(error){
						alert("오류예염"+error);
					}
				})
			});
		})
	</script>

</head>
<body>
	<div class="mainForm">
		<div class="passwordForm">
			<p>Find Password</p>
			<!-- <form class="form-horizontal" action="Find_PasswordForm.do" method="post"> -->
			<div class="form-horizontal">
				<div class="form-group form-group-lg">
					<label for="inputEmail3" class="col-sm-3 control-label">Email</label>
					<div class="col-sm-6">
						<input type="email" class="form-control" placeholder="Email" id="email" name="email" value="${param.email}">
						<c:if test="${errors.noEmail}">
							<span>user가 존재하지 않습니다.</span>
						</c:if>
					</div>
				</div>
				<div class="form-group form-group-lg">
					<label for="pQId" class="col-sm-3 control-label">Password Question</label>
					<div class="col-sm-6">
							<select name="pwQId" id="pwQId">
								<option selected>&nbsp;비밀번호 힌트</option>
								<c:forEach var="pQuestion" items="${qList}">
									<option value="${pQuestion.pwQId}">${pQuestion.question}</option>
								</c:forEach>
							</select>
							<c:if test="${errors.noP_q}">
							<span>비밀번호 힌트가 일치하지 않습니다.</span>
						</c:if>
					</div>
				</div>
				<div class="form-group form-group-lg">
					<label for="inputPassword3" class="col-sm-3 control-label">Password Answer</label>
					<div class="col-sm-6">
						<input type="text" class="form-control" id="pwA" placeholder="Password Answer" name="p_answer">
						<c:if test="${errors.noP_answer}">
							<span>비밀번호 답이 일치하지 않습니다.</span>
						</c:if>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-7">
						
						<button id="findBtn" class="btn btn-default btn-block btn-lg">비밀번호 찾기</button>
					</div>		
				</div>
			
			</div>
			<!-- </form> -->
		</div>
	</div>

</body>
</html>