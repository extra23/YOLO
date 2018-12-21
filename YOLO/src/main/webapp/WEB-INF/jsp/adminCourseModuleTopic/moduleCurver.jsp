<%@ page language="java" isELIgnored="false"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<!-- include summernote css/js -->
<link
	href="${pageContext.request.contextPath}/summernote/summernote.css"
	rel="stylesheet">
<script
	src="${pageContext.request.contextPath}/summernote/summernote.js"></script>
<script
	src="${pageContext.request.contextPath}/summernote/lang/summernote-ko-KR.js"></script>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/moduleAndCourseInner.css">

<script>
	$(document).ready(function() {
		$('#summernote').summernote({ // summernote를 사용하기 위한 선언
			height : 400,
			lang : 'ko-KR',
			callbacks : {
				onImageUpload : function(files) {
					sendFile(files[0]);
				}
			}
		});
	});

	function sendFile(file) {
		// 파일 전송을 위한 폼생성
		data = new FormData();
		data.append("uploadFile", file);
		$.ajax({ // ajax를 통해 파일 업로드 처리
			data : data,
			type : "POST",
			url : "imgUpload",
			enctype : "${pageContext.request.contextPath}/imgUpload",
			cache : false,
			contentType : false,
			processData : false,
			success : function(data) { // 처리가 성공할 경우
				console.log(data)
				$("#summernote").summernote('editor.insertImage', data.url);
			},
			error : function(){
				alert("오류!!!!");
			}
		});
	}

	
	


	$(function(){
		var num = ${module.moduleId}
		$("#topicListBtn").click(function(){
			if(isNaN(num)){
				alert("모듈을 선택해주세요.");
			}else{
				location.href = "topicList?moduleId="+num;
			}
		})
		
	});
	

</script>

<title>Insert title here</title>
</head>
<body>

	<div class="mainDiv">
	
		<ul id="curverListUl" class="nav nav-tabs">
			<li role="presentation" id="curverBtn" class="active"><a
				href="#">Curver</a></li>
			<li role="presentation"><a href="#" id="topicListBtn" >Topic List</a></li>
		</ul>
		<br>
		<c:if test="${empty module.mTitle}">
			<form name="writeForm" action="moduleInsert" method="post">
			

				<div id="formTable" >
					코스 선택
						<a href="#" class="toggle-custom" id="btn1" data-toggle="collapse" data-target="#submenu1" aria-expanded="false"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span></a>
					<ul class="nav collapse" id="submenu1" role="menu" aria-labelledby="btn1">
						<c:forEach var="course" items="${courseList}" varStatus="status1">
							<label><input type="checkbox" name="co" value="${course.courseId}">${course.cTitle}</label>
							&nbsp;&nbsp;
						</c:forEach>
					</ul>
					<br>

					모듈 제목  <input type="text" id="mTitle" name="mTitle" size="100"> <br> <br>
					모듈 요약  <input type="text" name="mSummary" size="100"> <br> <br>
					모듈 내용
					<textarea id="summernote" name="summernote"></textarea>
					<input type="submit" class="btn btn-default navbar-btn" value="생성">
				</div>

			</form>
		</c:if>
		<c:if test="${not empty module.mTitle}">
			<form name="writeForm" action="moduleModify" method="post">

				<div id="formTable">
					코스 선택
						<a href="#" class="toggle-custom" id="btn1" data-toggle="collapse" data-target="#submenu1" aria-expanded="false"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span></a>
					<ul class="nav collapse" id="submenu1" role="menu" aria-labelledby="btn1">
						<c:forEach var="course" items="${courseList}">
						<c:forEach var="como" items="${comoList }">
							<c:if test="${course.courseId eq como.courseId }">
								<label><input type="checkbox" name="co" value="${course.courseId}" checked="checked">${course.cTitle}</label>
							&nbsp;&nbsp;
							</c:if>
						</c:forEach>
								<label><input type="checkbox" name="co" value="${course.courseId}">${course.cTitle}</label>
							&nbsp;&nbsp;
						</c:forEach>
					</ul>
					<br>	 	
					<input type="hidden" name="moduleId" value="${module.moduleId}">
					모듈 제목 <input type="text" name="mTitle" id="mTitle" value="${module.mTitle}" size="100"> <br><br> 
					모듈 요약 <input type="text" name="mSummary" value="${module.mSummary}" size="100"><br><br> 
					모듈 내용
					<textarea id="summernote" name="summernote">${module.mContent}</textarea>

					<input type="submit" class="btn btn-default navbar-btn" value="수정">
					<input type="button" class="btn btn-default navbar-btn" id="deleteBtn" value="삭제">
				</div>

			</form>
		</c:if>
	

	</div> 
	
	<script>
		$(function(){
			//모듈의 삭제시 비밀번호 확인
			$("#deleteBtn").click(function(){
				var answer = prompt('해당 모듈을 삭제하려면 사용자의 비밀번호를 입력하세요','')
				var password = ${authUser.password}
				
				var num = ${module.moduleId}
				if(answer==password){
					location.href="moduleDelete?moduleId="+num
				}else{
					alert("비밀번호를 잘못 입력했습니다.")
				}
			});
			
		
		})
	</script>
</body>
</html>