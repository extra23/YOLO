<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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

		#container * {font-family: a찐빵M;}
	
		#myHistoryPage {width: 90%; margin: auto;}
		#myHistoryPage, #myHistoryPage tr, th, td {border: 1px solid black; border-collapse: collapse;}
		#myHistoryPage td, #myHistoryPage th, #myHistoryPage tr {padding: 10px; text-align: center;}
		#myHistoryPage thead {background-color: gainsboro;}
		
		#pagination {text-align: center; margin: 10px; margin-top: 30px; font-size: 18px;}
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
	
	<jsp:include page="header3.jsp"></jsp:include>
	
	<h2 class="text-center">봤어요</h2>
	
	<table id="myHistoryPage">
		<thead>
			<tr>
				<th>글쓴이</th>
				<th>tTitle</th>
				<th>날짜</th>
				<th>봤어요</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="history" items="${myHistoryList}" varStatus="status">
			<tr>
				<td>
					<c:if test="${empty param.pageNo}">${status.count}</c:if>
					<c:if test="${not empty param.pageNo}">${(20 * (param.pageNo-1))+status.count}</c:if>
				</td>
				<td>${user.nickName}</td>
				<td>${topic.tTitle}</td>
				<td>${topic.udate}</td>
				<td><a href="adminUserModify?userId=${user.userId}">[봤어요]</a></td>
				
			</tr>
			</c:forEach>
		</tbody>	
	</table>
	
	
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

	<jsp:include page="footer.jsp"></jsp:include>
	
</body>
</html>