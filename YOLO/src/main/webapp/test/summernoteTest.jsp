<%@page import="org.springframework.web.multipart.MultipartRequest"%>
<%@ page language="java" isELIgnored="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
	<!-- include libraries(jQuery, bootstrap) -->
	<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

	<!-- include summernote css/js -->
	<link href="${pageContext.request.contextPath}/summernote/summernote.css" rel="stylesheet">
	<script src="${pageContext.request.contextPath}/summernote/summernote.js"></script>
	<script src="${pageContext.request.contextPath}/summernote/lang/summernote-ko-KR.js"></script>
	
	<script>
    	
    	function sendFile(file) {
            // 파일 전송을 위한 폼생성
	 		data = new FormData();
	 	    data.append("uploadFile", file);
	 	    $.ajax({ // ajax를 통해 파일 업로드 처리
	 	        data : data,
	 	        type : "POST",
	 	        url : "${pageContext.request.contextPath}/imgUpload",
	 	        enctype : "multipart/form-data",
	 	        cache : false,
	 	        contentType : false,
	 	        processData : false,
	 	        success : function(data) { // 처리가 성공할 경우
	 	        	console.log(data)
                   $("#summernote").summernote('editor.insertImage', data.url);
	 	        }
	 	    });
	 	}
    	
  	</script>

	<title>Insert title here</title>
</head>
<body>
	<form name="writeForm" action="summernote_result.jsp" method="post">
		<textarea id="summernote" name="summernote">Hello Summernote</textarea>
		<input type="submit" value="전송">
	</form>
	
	<script>
	
	$(document).ready(function() {
		$('#summernote').summernote({ // summernote를 사용하기 위한 선언
			height: 400,
			lang: 'ko-KR',
			callbacks: {
				onImageUpload: function(files, editor, welEditable) {
					sendFile(files[0], this);
				}
			}
		});
	});
	
	</script>
</body>
</html>