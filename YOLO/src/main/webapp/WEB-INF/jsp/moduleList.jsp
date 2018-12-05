<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link href="https://fonts.googleapis.com/css?family=Baloo+Tamma"
	rel="stylesheet">

<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

<link href="https://fonts.googleapis.com/css?family=Jua"
	rel="stylesheet">
<style type="text/css">
.mainContainer{width: 100%; height: 1000px; background-color: #F7F7F7; text-align: center;}
.mMain{width: 85%; height: auto; display: inline-block;}
body{font-family: 'Jua', sans-serif;}
.mTitle{margin-top: 100px; margin-bottom: 80px;}
.table{border: 1px solid gray; font-size: 20px;}
.category{background-color: lightgray; }
</style>
</head>
<body><%-- 
<jsp:include page="header3.jsp"></jsp:include> --%>
<div class="mainContainer">
<div class="mMain">
	<div class="mTitle"><h1>모듈 목록</h1></div>
	<div class="mContent">
	<form>
		<table class="table table-bordered">
			<thead>
			<tr class="category">
				<td width="30%">제목</td>
				<td width="12%">관리자</td>
				<td width="10%">토픽수</td>
				<td width="15%">마지막 저장날짜</td>
				<td width="40%">사용중인 코스</td>
			</tr>
			</thead>
			<tbody class="table-hover">
				<c:forEach var="module" items="${moduleList}">
				<tr>
					<td>${module.mTitle}</td>
					<td>${module.nickName}</td>
					<td></td>
					<td>${module.mdate}</td>
					<td></td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
		</form>
	</div>
</div>
</div>
<%-- 
<jsp:include page="footer.jsp"></jsp:include> --%>
</body>
</html>