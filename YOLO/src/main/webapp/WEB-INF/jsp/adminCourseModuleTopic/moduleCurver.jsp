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

<style>


#formTable {
	top: -610px;
	left: 230px;
	width: 800px;
	position: relative;
}

</style>

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


		

</script>

<title>Insert title here</title>
</head>
<body>

	<div class="mainDiv">
		<ul class="nav nav-tabs">
			<li role="presentation" id="curverBtn" class="active"><a
				href="#">커버</a></li>
			<li role="presentation" id="topicListBtn"><a href="topicList?moduleId=${module.moduleId}">토픽 목록</a></li>
		</ul>
		<br>
		<c:if test="${empty module.mTitle}">
			<form name="writeForm" action="moduleInsert" method="post">

				<div id="formTable" >
					모듈 제목 <input type="text" id="mTitle" name="mTitle" size="97"> <br>
					모듈 요약 <input type="text" name="mSummary" size="97"> <br>
					모듈 내용
					<textarea id="summernote" name="summernote"></textarea>
					<input type="submit" value="생성">
				</div>

			</form>
		</c:if>
		<c:if test="${not empty module.mTitle}">
			<form name="writeForm" action="moduleModify" method="post">

				<div id="formTable">
					<input type="hidden" name="moduleId" value="${module.moduleId}">
					모듈 제목 <input type="text" name="mTitle" id="mTitle"
						value="${module.mTitle}" size="97"> <br> 모듈 요약 <input
						type="text" name="mSummary" value="${module.mSummary}" size="97">
					<br> 모듈 내용
					<textarea id="summernote" name="summernote">${module.mContent}</textarea>

					<input type="submit" value="수정">
				</div>

			</form>
		</c:if>
	

	</div> 
</body>
</html>