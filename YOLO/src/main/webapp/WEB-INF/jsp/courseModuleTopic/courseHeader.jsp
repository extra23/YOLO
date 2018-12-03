<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<style>
	
		#courseHeader, #courseHeader div {
			border: 1px solid black;
			margin: 20px;
		}
		
		#courseHeader div {
			padding: 10px;
		}
	
	</style>
</head>
<body>

	<div id="courseHeader">
		
		<div id="courseTitle">
			<a href="coursePage?courseId=${courseAndModule.course.courseId}"><h1>${courseAndModule.course.cTitle}</h1></a>
		</div>
		
		<div id="courseSummary">${courseAndModule.course.cSummary}</div>
		
		<div id="btns">
			<button>공동참여</button>
			<button>새로운 코스 생성</button>
		</div>
		
	</div>

</body>
</html>