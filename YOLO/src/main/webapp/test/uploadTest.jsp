<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
</head>
<body>

	<h1>파일 업로드</h1>
	
	<form action="fileupload" method="post" enctype="multipart/form-data">
	
		<input type="file" name="uploadfile" placeholder="파일 선택"><br>
		
		<input type="submit" value="업로드">
	
	</form>

</body>
</html>