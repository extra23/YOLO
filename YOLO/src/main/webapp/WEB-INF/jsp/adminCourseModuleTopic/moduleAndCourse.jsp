<%@ page language="java" isELIgnored="false" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
	<title>Insert title here</title>
	<style>
		#moduleList{
			float: left;
			border: 1px solid lightgray;
			width: 200px;
			height: 500px;
		} 
		#moduleCurver{
			display: inline;
			
		}
	</style>
</head>
<body>

	<jsp:include page="../header3.jsp"></jsp:include>
	<ul class="nav nav-tabs">
			<li role="presentation" class="active"><a href="#">module</a></li>
			<li role="presentation"><a href="#">course</a></li>
		</ul>
		<br>
	<div id="moduleList">
		<h3>모듈리스트</h3>
		<a href="#">+(새로운 추가모듈 버튼)</a>
		<ul>
			<li></li>
		</ul>
	</div>
	<div id="moduleCurver">
	<jsp:include page="moduleCurver.jsp"></jsp:include>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>