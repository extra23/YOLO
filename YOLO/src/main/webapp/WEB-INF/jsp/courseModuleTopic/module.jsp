<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title></title>
	
	<!-- 공통 : bootstrap & jQuery -->
	<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
	
	<!-- CSS & JavaScript(jQuery) -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/moduleHeaderCss.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/moduleLeftCss.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/moduleContentCss.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/thumbnailJs.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/moduleHeaderJs.js"></script>
	
	<style>
		@font-face{
			font-family: 'a찐빵M';
			src: url('${pageContext.request.contextPath}/font/a찐빵M.ttf');
		}
	
		#body {font-family: 'a찐빵M'}
	</style>
	
</head>
<body id="body">

	<jsp:include page="../header3.jsp"></jsp:include>
	
	<div style="width: 80%; margin: 80px auto; min-height: 461px;">
	
		<jsp:include page="fragment/moduleHeader.jsp"></jsp:include>
	
		<jsp:include page="fragment/moduleLeft.jsp"></jsp:include>
	
		<jsp:include page="fragment/moduleContent.jsp"></jsp:include>
		
	
	</div>
	
	<jsp:include page="../footer.jsp"></jsp:include>

</body>
</html>