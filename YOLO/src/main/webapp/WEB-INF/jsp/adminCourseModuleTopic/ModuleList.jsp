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


<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/moduleAndCourseInner.css">

<script>


	function fn_paging(curPage) {
		location.href = "#";
		location.href = "PagingModule?curPage="+curPage+"&courseId="+${course.courseId};
		
		
	} 
	
</script>

<title>Insert title here</title>
</head>
<body>

	<div class="mainDiv">
		<ul id="curverListUl" class="nav nav-tabs">
			<li role="presentation" id="curverBtn"><a
				href="courseCurver?courseId=${course.courseId }">Curver</a></li>
			<li role="presentation" id="moduleListBtn" class="active"><a
				href="#">Module List</a></li>
		</ul>
		<br>
		<div id="innerList" style="display: block;">
			<h3>모듈 목록</h3>
			<!-- 토픽목록 가져오는 쿼리.. -->
			<hr>
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>모듈 제목</th>
					</tr>
				</thead>
				<tbody>

					<!-- mTitle에 a태그 넣어서 해당 module로 이동할 수 있게 하기  -->
					<c:forEach var="moduleAndTopic"
						items="${courseAndModule.moduleAndTopicList}">

						<tr>
							<td colspan="2"><a id="a"
								href="modulePage?moduleId=${moduleAndTopic.module.moduleId}">${moduleAndTopic.module.mTitle}</a><a
								id="modifyAndDelete"
								href="moduleCurver?moduleId=${moduleAndTopic.module.moduleId}">[수정
									및 삭제]</a></td>

						</tr>

					</c:forEach>
				</tbody>
			</table>

			<button id="writeBtn" class="btn btn-default navbar-btn"
				onclick="location.href='AdminModuleAndCourse'">모듈 커버 추가하기</button>



			<nav>
				<ul class="pagination">
					
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
						<c:if test="${paging.curPage ne paging.pageCnt && paging.pageCnt > 0 }">
							<li><a href="#" aria-label="Next"
								onclick="fn_paging(${paging.nextPage})"> <span
									aria-hidden="true">&raquo;</span>
							</a></li>
						</c:if>
				</ul>
			</nav>

		</div>

	</div>
</body>
</html>