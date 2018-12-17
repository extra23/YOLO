<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- include libraries(jQuery, bootstrap) -->
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
	
<title>비밀번호 찾는 페이지</title>

	<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

	<link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet">

	<style type="text/css">
		#fn_pwBody {
			background: #F7F7F7 no-repeat center center fixed;
			-webkit-background-size: cover; 
			-moz-background-size: cover; 
			-o-background-size: cover; 
			background-size: cover;
		}
		
		.form-horizontal {
			margin-left: 50px;
			margin-top: 30px;
		}
		
		.mainForm {
			width: 100%;
			background-color: #F7F7F7;
			font-family: 'Jua', sans-serif;
			text-align: center;
		}
		
		.passwordForm {
			width:40%;
			background-color: gainsboro;
			display: inline-block;
			margin-top: 30px;
			margin-bottom: 30px;
			border: 1px solid black;
			border-radius: 10px;
		}
		
		
		.btn {
			font-family: 'Jua';
			margin-left: 20px;
		}
		
		.passwordForm p {
			font-size: 50px;
			margin-top: 40px;
		}
		
		#pwQId {
			width: 100%;
			height: 40px;
			border: 1px solid lightgray;
			border-radius: 5px;
			font-size: 20px !important;
			color: gray !important;
		}
		#findBtn{margin-bottom: 20px;}
	</style>
	
	<script>
		$(function(){
			
			$("#findBtn").click(function(){
			
				$.ajax({
					url : "Find_PasswordForm.do",
					type : "POST",
					data : {
						email:$("#email").val(),
						pwQId:$("#pwQId").val(),
						pwA:$("#pwA").val()
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
<body id="fn_pwBody">
	<jsp:include page="header3.jsp" />
	<div class="mainForm">
		<div class="passwordForm">
			<p>Find Password</p>
			<!-- <form class="form-horizontal" action="Find_PasswordForm.do" method="post"> -->
			<div class="form-horizontal">
				<div class="form-group form-group-lg">
					<label for="inputEmail3" class="col-sm-3 control-label">Email</label>
					<div class="col-sm-6">
						<input type="email" class="form-control" placeholder="Email" id="email" name="email" value="${param.email}">
					
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
						
					</div>
				</div>
				<div class="form-group form-group-lg">
					<label for="inputPassword3" class="col-sm-3 control-label">Password Answer</label>
					<div class="col-sm-6">
						<input type="text" class="form-control" id="btn"  placeholder="Password Answer" name="pwA">
					
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-7">
						
						<button id="findBtn" class="btn btn-default btn-block btn-lg">Find password</button>
					</div>		
				
				

				<div class="col-sm-offset-2 col-sm-7">
						<button  class="btn btn-default btn-block btn-lg" onclick="location.href='mainBoard'">Cancel</button>
				</div>
			</div>
			</div>
			<!-- </form> -->
		</div>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>