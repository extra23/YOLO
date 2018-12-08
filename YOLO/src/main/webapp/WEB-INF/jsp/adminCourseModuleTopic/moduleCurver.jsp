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
#helpPage{
	top: -470px;
	position: relative;
	text-align: center;
}

#formTable {
	top: -470px;
	left: 230px;
	width: 800px;
	position: relative;
}
#topicList{
	top: -470px;
	left: 230px;
	width: 800px;
	position: relative;
}

#modifyAndDelete{
	float: right;
}

#writeTopicBtn{
	float: right;  
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
    		$("#helpBtn").click(function(){
    			$("#helpPage").css("display","block");
    			$("#formTable").css("display","none");
    			$("#topicList").css("display","none");
    			$("#helpBtn").addClass("active");
    			$("#curverBtn").removeClass("active");
    			$("#topicListBtn").removeClass("active");
    		});
    		
    		$("#topicListBtn").click(function(){
    			$("#helpPage").css("display","none");
    			$("#formTable").css("display","none");
    			$("#topicList").css("display","block");
    			$("#helpBtn").removeClass("active");
    			$("#curverBtn").removeClass("active");
    			$("#topicListBtn").addClass("active");
    		});
    		
    		$("#curverBtn").click(function(){
    			$("#helpPage").css("display","none");
    			$("#formTable").css("display","block");
    			$("#topicList").css("display","none");
    			$("#helpBtn").removeClass("active");
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
			<li role="presentation" id="helpBtn" class="active"><a href="#">help!</a></li>
			<li role="presentation" id="curverBtn"><a href="#">커버</a></li>
			<li role="presentation" id="topicListBtn"><a href="#">토픽 목록</a></li>
		</ul>
			<br>
			<div id="helpPage">
				<img src="resources/images/rirak.gif">
				<h4>모듈을 수정하는 페이지 입니다.</h4>
			</div>
			<form name="writeForm" action="moduleModify" method="post">
				<div id="formTable" style="display: none;">
				<input type="hidden" name="moduleId" value="${module.moduleId}">
					모듈 제목 <input type="text" name="mTitle" value="${module.mTitle}" size="97"> <br>
					모듈 요약 <input type="text" name="mSummary" value="${module.mSummary}" size="97"> <br>
					모듈 내용	
				<textarea id="summernote" name="summernote">${module.mContent}</textarea> 

					<input type="submit" value="수정">
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
					</tr>
				</thead>
				<tbody>

					<!-- mTitle에 a태그 넣어서 해당 module로 이동할 수 있게 하기  -->
					<c:forEach var="topic" items="${topicList}">
						<tr>
							<td colspan="2"><a id="a" href="topicPage?topicId=${topic.topicId}">${topic.tTitle}</a><a id="modifyAndDelete" href="topicModifyDeleteForm?topicId=${topic.topicId}">[수정 및 삭제]</a>	</td>
							
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
				<button id="writeTopicBtn" onclick="location.href='topicWriteForm?moduleId=${module.moduleId}'">글쓰기</button>
				
			</div>

	</div>
</body>
</html>