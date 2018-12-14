<%@ page language="java" isELIgnored="false"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	<!-- include libraries(jQuery, bootstrap) -->
	<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

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
				$("#summernote").summernote('insertImage', data.url);
			}
		});
	}

	//모듈목록 클릭하면 나오는 것
	$(function(){
		var num = ${course.courseId}
		$("#moduleListBtn").click(function(){
			if(isNaN(num)){
				alert("코스를 선택해주세요.");
			}else{
				location.href = "moduleList?courseId="+num;
			}
		})
	});
	
</script>

<title>Insert title here</title>
</head>
<body>

	<div class="mainDiv">
		<ul id="curverListUl" class="nav nav-tabs">
			<li role="presentation" id="curverBtn" class="active"><a href="#">Curver</a></li>
			<li role="presentation"><a href="#" id="moduleListBtn">Module List</a></li>
		</ul>
		<br>
		
			<form name="writeForm" action="courseModify" method="post">
				<div id="formTable">
				<c:if test="${not empty course.cTitle}">
					<input type="hidden" name="courseId" value="${course.courseId}">
					코스 제목 <input type="text" name="cTitle" value="${course.cTitle}" size="97"> <br> 
					코스 요약 <input type="text" name="cSummary" value="${course.cSummary}" size="97"> <br>
					코스 내용
					<textarea id="summernote" name="summernote">${course.cContent}</textarea>
					
					<input type="submit" value="수정">
					<input type="button" id="deleteBtn" value="삭제">
				</c:if>
				<c:if test="${empty course.cTitle}">
					코스 제목 <input type="text" name="cTitle" size="97"> <br> 
					코스 요약 <input type="text" name="cSummary" size="97"> <br>
					코스 내용
					<textarea id="summernote" name="summernote"></textarea>
					
					<input type="submit" formaction="courseCreate" value="작성">
				</c:if>
				</div>
			</form>
	</div>
	<script>
	
	
		$(function(){
			//코스 커버 삭제시 비밀번호 확인
			$("#deleteBtn").click(function(){
				var answer = prompt('해당 모듈을 삭제하려면 사용자의 비밀번호를 입력하세요','')
				var password = ${authUser.password}
				
				var num = ${course.courseId}
				if(answer==password){
					location.href="courseDelete?courseId="+num
				}else{
					alert("비밀번호가 틀렸습니다!");
				}
			});
	
		})
	</script>
</body>
</html>