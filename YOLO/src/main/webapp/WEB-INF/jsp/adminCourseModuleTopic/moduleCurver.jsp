<%@ page language="java" isELIgnored="false"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	top: -470px;
	left: 230px;
	width: 800px;
	height: 100px;
	border: 1px solid black;
	position: relative;
}
#topicList{
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
    	
    	//토픽목록 클릭하면 나오는것
    	$(function(){
    		$("#topicListBtn").click(function(){
    			$("#formTable").css("display","none");
    			$("#topicList").css("display","block");
    			$("#curverBtn").removeClass("active");
    			$("#topicListBtn").addClass("active");
    		});
    		
    		$("#curverBtn").click(function(){
    			$("#formTable").css("display","block");
    			$("#topicList").css("display","none");
    			$("#topicListBtn").removeClass("active");
    			$("#curverBtn").addClass("active");
    		});
    	});
  	</script>

<title>Insert title here</title>
</head>
<body>

		<div class="mainDiv">
		<ul class="nav nav-tabs">
			<li role="presentation" id="curverBtn" class="active"><a href="#">커버</a></li>
			<li role="presentation" id="topicListBtn"><a href="#">토픽 목록</a></li>
		</ul>
			<br>
			<form name="writeForm" action="summernote_result.jsp" method="post">
				<div id="formTable">
					모듈 제목 <input type="text" id="mTitle" value="${module.mTitle}"> <br>
					모듈 요약<input type="text" id="mSummery" value="${module.mSummery}"> <br>
					모듈 내용	
				<textarea id="summernote" name="summernote">${module.mContent}</textarea> 

					<input type="submit" value="전송">
				</div>
			</form>
			<div id="topicList" style="display: none;">
				<h3>토픽 목록</h3>
				<!-- 토픽목록 가져오는 쿼리.. -->
				<hr>
				<table class="table table-bordered">
				<thead>
					<tr>
						<th>토픽 제목</th>
						<th>수정</th>
						<th>삭제</th>
					</tr>
				</thead>
				<tbody>

					<!-- mTitle에 a태그 넣어서 해당 module로 이동할 수 있게 하기  -->
					<c:forEach var="topic" items="${topicList}">
						<tr>
							<td><a id="a" href="topicPage?topicId=${topic.topicId}">${topic.tTitle}</a></td>
							<td><a href="topicModify?topicId=${topic.topicId}">[수정]</a></td>
							<td><a href="topicDelete?topicId=${topic.topicId}">[삭제]</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
				<hr>
				<button id="writeTopicBtn">글쓰기</button>
				
			</div>

	</div>
</body>
</html>