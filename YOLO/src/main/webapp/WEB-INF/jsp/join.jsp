<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script>
		$(document).ready(function(){
			$("#profileImg").click(function(){
				$("#input_img").click();
			})
		})
	</script>
	<script>
		var sel_file;
		
		$(document).ready(function(){
			$("#input_img").on("change", fileChange);
		})
		
		function fileChange(e){
			e.preventDefault();
			
			var files = e.target.files;
			var filesArr = Array.prototype.slice.call(files);
			
			filesArr.forEach(function(f){
				if(!f.type.match("image.*")){
					alert("확장자는 이미지 확장자만 가능합니다.");
					return;
				}
				
				sel_file = f;
				
				var reader = new FileReader();
				reader.onload = function(e){
					$("#profileImg").attr("src", e.target.result);
					$("#profileImg").css("height", "100px");
				}
				reader.readAsDataURL(f);
			});
			
			var file = files[0];
			console.log(file);
			
			var formData = new FormData();
			formData.append("file", file);
			
			$.ajax({
				url: '/uploadAjax',
				data: formData,
				dataType: 'text',
				processData: false,
				contentType: false,
				type: 'POST',
				success: function(data){
					alert("프로필 이미지가 변경 되었습니다.");
				}
			})
			
			function checkImageType(fileName){
				var pattern = /jpg$|gif$|png$|jpeg$/i;
				return fileName.match(pattern);
			}
			
			function getOriginalName(fileName){
				if(checkImageType(fileName)){
					return;
				}
				
				var idx = fileName.indexOf("_") + 1;
				return fileName.substr(idx);
			}
			
			function getImageLink(fileName){
				if(!checkImageType(fileName)){
					return;
				}
				
				var front = fileName.substr(0, 12);
				var end = fileName.substr(14);
				
				return front + end;
			}
		}
	</script>	
</head>
<body>

	<c:choose>
		<c:when test="${empty userImage}">
			<div>
				<img id="profileImg" src="/displayFile?fileName=/overaction.jpg" style="border-radius: 0%; padding-top: 10px; height: 100px; width: 100px;">
			</div>
		</c:when>
		<c:otherwise>
			<div>
				<img id="profileImg" src="/displayFile?fileName=${userImage}" style="border-radius: 0%; padding-top: 10px; height: 100px; width: 100px;">
			</div>
		</c:otherwise>
	</c:choose>

	<form action="join" method="post" enctype="multipart/form-data">
	
		nickName : <input type="text" name="nickName"><br>
	
		email : <input type="email" name="email"><br>
		
		password : <input type="password" name="password"><br>
		
		p_qId : <input type="number" name="p_qId"><br>
		
		p_answer : <input type="text" name="p_answer"><br>
		
		<input type="submit">
	
	</form>

</body>
</html>