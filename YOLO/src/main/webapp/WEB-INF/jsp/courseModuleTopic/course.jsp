<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	
<style>

	#body {background-color: #F7F7F7;}

</style>	

	
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	
	<!-- 글꼴 -->
	<link href="https://fonts.googleapis.com/css?family=Baloo+Tamma" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet">
	
	<!-- 공통 : bootstrap & jQuery -->
	<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
	
	<!-- CSS & JavaScript(jQuery) -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/courseHeaderCss.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/courseLeftCss.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/courseContentCss.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/courseHeaderJs.js"></script>
	
</head>
<body id="body">

	<jsp:include page="../header3.jsp"></jsp:include>

	<div style="width: 80%; margin: 80px auto; min-height: 461px;" id="coback">
		
		<jsp:include page="fragment/courseHeader.jsp"></jsp:include>
	
		<jsp:include page="fragment/courseLeft.jsp"></jsp:include>
	
		<jsp:include page="fragment/courseContent.jsp"></jsp:include>
	
	</div>

	<jsp:include page="../footer.jsp"></jsp:include>

</body>
</html>