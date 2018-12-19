<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	
	<script>
		 $(function(){
			$("#option").click(function(){
				location.href="modifyUser?userId=${moduleAndTopic.user.userId}";
			});
		});
	</script>
</head>
<body>

	<div id="moduleLeft">
		
		<div id="userInfo">
			<table id="userInfoTable">
				<tr>
					<td rowspan="2">
						<div id="thumbnailDiv">
							<img id="thumbnailImg" src="${pageContext.request.contextPath}/images/${moduleAndTopic.user.thumbnail}">
						</div>
					</td>
					<td style="padding-bottom: 0;">
						<a href="userView?userId=${moduleAndTopic.user.userId}">${moduleAndTopic.user.nickName}</a>
						<c:if test="${authUser.userId eq moduleAndTopic.user.userId}">
							&nbsp;
							<img id="option" src="${pageContext.request.contextPath}/images/option.png" title="프로필 수정" style="cursor: pointer;">
						</c:if>
					</td>
				</tr>
				<tr>
					<td style="padding-top: 0;">${moduleAndTopic.user.email}</td>
				</tr>
			</table>
		</div>
		
		<div id="tTitleList">
		
			<h4>
				Topic List
				<c:if test="${authUser.userId eq moduleAndTopic.user.userId}">
					&nbsp;<img id="topicPlus" src="${pageContext.request.contextPath}/images/plus.png" title="새로운 토픽 추가">
				</c:if>
			</h4>
		
			<hr>
		
			<ul class="nav">
				<c:forEach var="topic" items="${moduleAndTopic.topicList}" varStatus="status">
					<li style="text-indent: 1em;">
						<a href="topicPage?moduleId=${param.moduleId}&topicId=${topic.topicId}">${topic.tTitle}</a>
					</li>
				</c:forEach>
			</ul>
		
		</div>
		
	</div>

</body>
</html>