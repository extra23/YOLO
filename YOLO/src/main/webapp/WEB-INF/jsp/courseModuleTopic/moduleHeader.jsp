<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<style>
		
		#moduleHeader, #moduleHeader div {
			border: 1px solid black;
			margin: 20px;
		}
		
		#moduleHeader div {
			padding: 10px;
		}
		
	</style>
</head>
<body>

	<div id="moduleHeader">
		
		<div id="moduleTitle">
			<a href="modulePage"><h1>${moduleAndTopic.module.mTitle}</h1></a>
		</div>
		
		<div id="moduleSummary">${moduleAndTopic.module.mSummary}</div>
		
		<div id="btns">
			<button>공동참여</button>
			<button>새로운 모듈 추가</button>
		</div>
		
	</div>

</body>
</html>