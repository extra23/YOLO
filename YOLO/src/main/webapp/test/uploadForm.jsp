<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script>
	
		$(function(){
			$("#profileImage").click(function(){
				$("#profileImageInput").click();
			});
		})
		
		$(function(){
			$("#profileImageInput").change(fileChange);
		})
		
		function fileChange(e){
			var files = e.target.files;
			var filesArr = Array.prototype.slice.call(files);
			
			filesArr.forEach(function(f) {
				// 이미지 확장자 걸러내기
				if (!f.type.match("image.*")) {
					alert("확장자는 이미지 확장자만 가능합니다.");
					return;
				}
				
				// 이미지 미리보기
				var reader = new FileReader();
				reader.onload = function(e) {
					$("#profileImage").attr("src", e.target.result);
				}
				reader.readAsDataURL(f);
			});
		}
		
	</script>
</head>
<body>

	<h1>파일 업로드</h1>
	
	<img id="profileImage" src="${pageContext.request.contextPath}/images/profileImageBasic.png" width="100px" height="100px;">
	
	<form action="fileupload" method="post" enctype="multipart/form-data">
	
		<input id="profileImageInput" type="file" name="uploadfile" placeholder="파일 선택" accept="image/*"><br>
		
		<input type="submit" value="업로드">
	
	</form>

</body>
</html>