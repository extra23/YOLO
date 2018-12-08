<%@ page language="java" isELIgnored="false"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

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


<title>토픽을 수정하고 삭제하는 페이지</title>

<style>

	#formTable {
		top: -470px;
		left: 230px;
		width: 800px;
		position: relative;
	}
	
</style>

<script>
    	$(document).ready(function() {
			$('#summernote').summernote({ // summernote를 사용하기 위한 선언
				height: 400,
				lang: 'ko-KR',
				callbacks: {
					onImageUpload: function(files) {
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
	 	        enctype : "multipart/form-data",
	 	        cache : false,
	 	        contentType : false,
	 	        processData : false,
	 	        success : function(data) { // 처리가 성공할 경우
	 	        	console.log(data)
                    $("#summernote").summernote('insertImage', data.url);
	 	        }
	 	    });
	 	}
    	

    	
    	$(function(){
    		$("#deleteBtn").click(function(){
    			var answer = prompt('삭제하려면 사용자의 비밀번호를 입력하세요','')
    			var password = ${authUser.password}
    			console.log(answer);
    			console.log(password);
    			if(answer==password){
    				location.href="topicDelete?topicId="+${topic.topicId}
    			}else{
    				alert("비밀번호가 틀렸습니다!");
    			}
    		});
    	});
  	</script>

</head>
<body>
	<div id="mainDiv">
		<ul class="nav nav-tabs">
			<li role="presentation" id="helpBtn" ><a href="AdminModuleAndCourse">help!</a></li>
			<li role="presentation" id="curverBtn"><a href="AdminModuleAndCourse">커버</a></li>
			<li role="presentation" id="topicListBtn" class="active"><a href="#">토픽 목록</a></li>
		</ul>
		<br>
		<form name="writeForm" action="topicModify" method="post">
			<div id="formTable">
				<input type="hidden" name="topicId" value="${topic.topicId}">
				토픽 제목 <input type="text" name="tTitle" value="${topic.tTitle}" size="97"> <br>
				토픽 내용
				<textarea id="summernote" name="summernote">${topic.tContent}</textarea>

				<input type="submit" value="수정">
				<input type="button" id="deleteBtn" value="삭제" >
			</div>
		</form>
	</div>

</body>
</html>