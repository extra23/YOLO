<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<style>
		
		#topicContent{
			border: 1px solid black;
			margin: 20px;
			padding: 10px;
		}
		
		#eachTopicContent {
			border: 1px solid black;
			padding: 10px;
		}
		
	</style>
</head>
<body>

	<div id="topicContent">
		<div id="tTitle"><h2>${eachTopic.tTitle}</h2></div>
		<hr>
		<div id="tContent">${eachTopic.tContent}</div>
	</div>

</body>
</html>