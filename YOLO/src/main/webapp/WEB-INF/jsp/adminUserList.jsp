<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>관리자 : 사용자 리스트</title>
	
	<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

	<!-- 글꼴 -->
	<link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Baloo+Tamma" rel="stylesheet">
		
	<style>

		#container * {font-family: a찐빵M;}
	
		#userListTable {width: 90%; margin: auto;}
		#userListTable, #userListTable tr, th, td {border: 1px solid black; border-collapse: collapse;}
		#userListTable td, #userListTable th, #userListTable tr {padding: 10px; text-align: center;}
		#userListTable thead {background-color: gainsboro;}
		
		#pagination {text-align: center; margin: 10px; margin-top: 30px; font-size: 18px;}
	</style>
	
</head>
<body>
	
	<jsp:include page="header3.jsp"></jsp:include>
	
	<h2 class="text-center">사용자 목록</h2>
	
	<table id="userListTable">
		<thead>
			<tr>
				<th>번호</th>
				<th>프로필 이미지</th>
				<th>닉네임</th>
				<th>이메일</th>
				<th>password</th>
				<th>password 확인 id</th>
				<th>password 확인 질문 답</th>
				<th>수정</th>
				<th>삭제</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="user" items="${list}" varStatus="status">
			<tr>
				<td>
					<c:if test="${empty param.pageNo}">${status.count}</c:if>
					<c:if test="${not empty param.pageNo}">${(20 * (param.pageNo-1))+status.count}</c:if>
				</td>
				<td>${user.profileImage}</td>
				<td>${user.nickName}</td>
				<td>${user.email}</td>
				<td>${user.password}</td>
				<td>${user.pwQId}</td>
				<td>${user.pwA}</td>
				<td><a href="adminUserModify?userId=${user.userId}">[수정]</a></td>
				<td><a href="adminUserDelete?userId=${user.userId}">[삭제]</a></td>
			</tr>
			</c:forEach>
		</tbody>	
	</table>
	
	
	<div>
                    <c:if test="${pagination.curRange ne 1 }">
                        <a href="#" onClick="fn_paging(1)">[처음]</a> 
                    </c:if>
                    <c:if test="${pagination.curPage ne 1}">
                        <a href="#" onClick="fn_paging('${pagination.prevPage }')">[이전]</a> 
                    </c:if>
                    <c:forEach var="pageNum" begin="${pagination.startPage }" end="${pagination.endPage }">
                        <c:choose>
                            <c:when test="${pageNum eq  pagination.curPage}">
                                <span style="font-weight: bold;"><a href="#" onClick="fn_paging('${pageNum }')">${pageNum }</a></span> 
                            </c:when>
                            <c:otherwise>
                                <a href="#" onClick="fn_paging('${pageNum }')">${pageNum }</a> 
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                    <c:if test="${pagination.curPage ne pagination.pageCnt && pagination.pageCnt > 0}">
                        <a href="#" onClick="fn_paging('${pagination.nextPage }')">[다음]</a> 
                    </c:if>
                    <c:if test="${pagination.curRange ne pagination.rangeCnt && pagination.rangeCnt > 0}">
                        <a href="#" onClick="fn_paging('${pagination.pageCnt }')">[끝]</a> 
                    </c:if>
                </div>
                
                <div>
                    총 게시글 수 : ${pagination.listCnt } /    총 페이지 수 : ${pagination.pageCnt } / 현재 페이지 : ${pagination.curPage } / 현재 블럭 : ${pagination.curRange } / 총 블럭 수 : ${pagination.rangeCnt }
                </div>
	

	<jsp:include page="footer.jsp"></jsp:include>
	
</body>
</html>