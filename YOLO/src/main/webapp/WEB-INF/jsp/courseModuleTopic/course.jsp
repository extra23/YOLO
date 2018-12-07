<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	
	<!-- 공통 : bootstrap & jQuery -->
	<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
	
</head>
<body>

	<jsp:include page="../header3.jsp"></jsp:include>

	<jsp:include page="fragment/courseHeader.jsp"></jsp:include>
	
	<jsp:include page="fragment/courseLeft.jsp"></jsp:include>
	
	<jsp:include page="fragment/courseContent.jsp"></jsp:include>

	<jsp:include page="../footer.jsp"></jsp:include>

</body>
</html>