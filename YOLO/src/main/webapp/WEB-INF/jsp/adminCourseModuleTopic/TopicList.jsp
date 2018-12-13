<%@ page language="java" isELIgnored="false"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- include libraries(jQuery, bootstrap) -->
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>


<style>
#topicLists {
	top: -610px;
	left: 230px;
	width: 800px;
	position: relative;
}

#modifyAndDelete {
	float: right;
}

#writeTopicBtn {
	float: right;
}
</style>

<script>


	function fn_paging(curPage) {
		location.href = "#";
		console.log(location.href+"ttt");
		location.href = "PagingTopic?curPage="+curPage+"&moduleId="+${module.moduleId};
		
		
	} 
	
</script>

<title>Insert title here</title>
</head>
<body>

	<div class="mainDiv">
		<ul class="nav nav-tabs">
			<li role="presentation" id="curverBtn"><a
				href="moduleCurver?moduleId=${module.moduleId }">커버</a></li>
			<li role="presentation" id="topicListBtn" class="active"><a
				href="#">토픽 목록</a></li>
		</ul>
		<br>
		<div id="topicLists" style="display: block;">
			<h3>토픽 목록</h3>
			<!-- 토픽목록 가져오는 쿼리.. -->
			<hr>
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>토픽 제목</th>
					</tr>
				</thead>
				<tbody>

					<!-- mTitle에 a태그 넣어서 해당 module로 이동할 수 있게 하기  -->
					<c:forEach var="topic" items="${topicList}">
						<tr>
							<td colspan="2"><a id="a"
								href="topicPage?topicId=${topic.topicId}">${topic.tTitle}</a><a
								id="modifyAndDelete"
								href="topicModifyDeleteForm?topicId=${topic.topicId}">[수정 및
									삭제]</a></td>

						</tr>
					</c:forEach>
				</tbody>
			</table>

			<button id="writeTopicBtn"
				onclick="location.href='topicWriteForm?moduleId=${module.moduleId}'">글쓰기</button>

			<%-- 	<div id="pagination">
		<c:if test="${paging.curRange > 0 }">
			<a href="#" onclick="fn_paging(1)">[처음]</a>
		</c:if>
		<c:if test="${paging.curPage > 0}">
			<a href="#" onclick="fn_paging(${paging.prevPage})">[이전]</a>
		</c:if>
		<c:forEach var="pageNum" begin="${paging.startPage}" end="${paging.endPage}">
			<c:choose>
				<c:when test="${pageNum eq paging.curPage}">
					<span style="font-weight: bold"><a href="#" onclick="fn_paging(${pageNum})">${pageNum }</a> </span>
				</c:when>
				<c:otherwise>
					<a href="#" onclick="fn_paging(${pageNum})">${pageNum}</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.curPage ne paging.pageCnt && paging.pageCnt > 0 }">
			<a href="#" onclick="fn_paging(${paging.nextPage})">[다음]</a>
		</c:if>
		<c:if test="${paging.curRange ne paging.rangeCnt && paging.rangeCnt >0}">
			<a href="#" onclick="fn_paging(${paging.pageCnt})">[끝]</a>
		</c:if>
	</div> --%>

			<nav>
				<ul class="pagination">
					<c:if test="${paging.curPage > 0}">
						<li><a href="#" aria-label="Previous" onclick="fn_paging(${paging.prevPage})"> <span
								aria-hidden="true" >&laquo;</span>
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
					<c:if test="${paging.curPage ne paging.pageCnt && paging.pageCnt > 0 }">
						<li><a href="#" aria-label="Next" onclick="fn_paging(${paging.nextPage})"> <span aria-hidden="true"
								>&raquo;</span>
					</a></li>
					</c:if>
				</ul>
			</nav> 

		</div>

	</div>
</body>
</html>