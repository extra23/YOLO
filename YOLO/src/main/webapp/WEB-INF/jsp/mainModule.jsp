<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<style>
		#content {
			margin-top: 40px;
			margin-bottom: 40px;
		}
	
		#content div {
			border: 1px solid black;
			margin: 20px;
			padding: 5px;
		}
	</style>
	<script>
		$(function(){
			
			
			
		});
	</script>
</head>
<body>

	<jsp:include page="header3.jsp"></jsp:include>
	
	<div id="content">
	
		<div id="mTitle">
			<a href="mainModule?moduleId=${param.moduleId}"><h1>${moduleAndTopic.module.mTitle}</h1></a>
			<div id="mSummary">${moduleAndTopic.module.mSummary}</div>
		</div>
		
		<div id="left">
			<div id="userInfo">
				<img src="${pageContext.request.contextPath}/images/profileImageBasic.png" style="width: 50px; heigth: 50px; border-radius: 50%;"><br>
				${moduleAndTopic.user.nickName}<br>
				${moduleAndTopic.user.email}
			</div>
			
			<div id="topicList">
				<c:forEach var="topic" items="${moduleAndTopic.topicList}">
					<button id="">${topic.tTitle}</button>
				</c:forEach>
			</div>
		</div>
		
		<div id="contentInModule">
			${moduleAndTopic.module.mContent}
		</div>
	
	</div>
	
	<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>