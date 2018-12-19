<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>내가 봤어요</title>
	
	<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

	<!-- 글꼴 -->
	<link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Baloo+Tamma" rel="stylesheet">
		
	<style>
	
.mainContainer {
	width: 100%;
	height: 1000px;
	text-align: center;
	margin-bottom: 20px;
	margin-top: 20px;
}

.mMain {
	width: 85%;
	height: auto;
	display: inline-block;
	font-family: 'a찐빵M'
}

#mTitle{
	margin-top: 20px;
	margin-bottom: 20px;
	font-family: 'a찐빵M'
}

td {
	border: 1px solid white !important
}

.mContent {
	font-family: 'Jua', sans-serif;
	margin-top: 15px;
}

body {
	font-family: 'Jua', sans-serif;
}

#mlist {
	font-size: 80px;
	margin: 0 auto;
	width: 500px;
	text-align: center;
	margin-top: 20px;
	margin-bottom: 20px;
	
}

.table {
	border: 1px solid gray;
	font-size: 20px;
}
/*  */
.category {
	background-color: lightgray;
}
.text_de{color: black;}
.text_de:hover{text-decoration: none; color: #5a5a5a;}


	</style>
	
	<script>
	var historyId = 0;
	var topicId = 0;
	var userId = 0;
	
	function history(historyId, userId, topicId){
		this.historyId = historyId;
		this.userId = userId;
		this.topicId = topicId;
	}
	
	$(function(){
		// 눈 아이콘 클릭시 봤어요 눈 아이콘으로 바뀜
		$("#see").click(function(){
			$.ajax({
				url: "toggleHistory",
				data:"&historyId=" + historyId + "&userId=" + userId + "&topicId" + topicId,
				success: function(result){
					if(Number(result) == "add"){
						alert("봤어요");
						$("#see").attr("src", "imges/see.png");
					}else{
						alert("안봤어요");
						$("#see").attr("src", "imges/notSee.png");
					}
				},
				error : function(){
					alert("봐썽요 실패");
				}
			})
		});
	});
	
	
	</script>
	
</head>
<body>
	
	<%-- <jsp:include page="header3.jsp"></jsp:include> --%>
	
	<div class="mainContainer">
		<div class="mMain">
			<div id="mTitle" style="font-family: 'Baloo Tamma', cursive;">
				<h1 id="mlist" style="font-size: 80px;">History</h1>
			</div>
			<div class="mContent">
				<form>
					<table class="table table-striped table-hover" style="border: 1px solid white !important">
						<thead>
							<tr class="category" style="border: 1px solid white !important">
								<td width="10%">번호</td>
								<td width="15%">글쓴이</td>
								<td width="25%">tTitle</td>
								<td width="15%">날짜</td>
								<td width="15%">봤어요</td>
							</tr>
						</thead>
						<tbody class="table-hover">
							<c:forEach var="history" items="${myHistoryList}" varStatus="status">
								<tr>
									<td>
									<c:if test="${empty param.pageNo}">${status.count}</c:if>
									<c:if test="${not empty param.pageNo}">${(20 * (param.pageNo-1))+status.count}</c:if>
									</td>
								<td><a class="text_de" href="${pageContext.request.contextPath}/userView?userId=${topic.userId}">${topic.nickName}</a></td>
								<td><a class="text_de" href="${pageContext.request.contextPath}/topic?topicId=${topic.topicId}">${topic.tTitle}</a></td>
								<td>
									<c:set value="${topic.udate.toString()}" var="udate"/> 
									<fmt:parseDate value="${udate }" var="parseUdate" pattern="YYYY-MM-dd'T'HH:mm:ss"/>
									<fmt:formatDate value="${parseUdate }" var="udate" pattern="YYYY-MM-dd HH:mm"/>
								${topic.udate}
								</td>
								<td><a href="adminUserModify?userId=${user.userId}">[봤어요]</a></td>
				
							</tr>
							</c:forEach>
						</tbody>
					</table>
				</form>
			</div>
		</div>
	</div>
	
	
	<nav>
				<ul class="pagination">
					<c:if test="${paging.endPage >1 }">
						<c:if test="${paging.curPage ne 1}">
							<li><a href="#" aria-label="Previous"
								onclick="fn_paging(${paging.prevPage})"> <span
									aria-hidden="true">&laquo;</span>
							</a></li>
						</c:if>
						<c:forEach var="pageNum" begin="${paging.startPage}"
							end="${paging.endPage}">
							<c:choose>
								<c:when test="${pageNum eq paging.curPage}">
									<li><a href="#" onclick="fn_paging(${pageNum})">${pageNum}</a></li>
								</c:when>
								<c:otherwise>
									<li><a href="#" onclick="fn_paging(${pageNum})">${pageNum}</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<c:if
							test="${paging.curPage ne paging.pageCnt && paging.pageCnt > 0 }">
							<li><a href="#" aria-label="Next"
								onclick="fn_paging(${paging.nextPage})"> <span
									aria-hidden="true">&raquo;</span>
							</a></li>
						</c:if>
					</c:if>
				</ul>
			</nav>

	<%-- <jsp:include page="footer.jsp"></jsp:include> --%>
	
</body>
</html>