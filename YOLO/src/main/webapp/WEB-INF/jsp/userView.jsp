<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>사용자 페이지</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<link href="https://fonts.googleapis.com/css?family=Jua"
	rel="stylesheet">

<style type="text/css">
#contentBody {
	background: #F7F7F7 no-repeat center center fixed;
	-webkit-background-size: cover;
	-moz-background-size: cover;
	-o-background-size: cover;
	background-size: cover;
}
.container{
	font-family: 'Jua', sans-serif;
}

</style>
</head>
<body id="contentBody">
	<jsp:include page="header2.jsp"></jsp:include>
	<div class="container">
		<table class="table table-bordered">
			<tbody>
				<tr>
					<td rowspan="2">사진</td>
					<td colspan="2">${authUser.nickName}</td>
					<td><a href="modifyUserForm.do?userId=${authUser.userId}" style="font-family: 'Jua', sans-serif">수정</a></td>
				</tr>
				<tr>
					<td>모듈</td>
					<td>코스</td>
					<td>봤어요</td>
				</tr>
			</tbody>
		</table>
		<hr>
		<h3>내가 만든 코스</h3>
		<hr>
		<br>
		<hr>
		<h3>내가 만든 코스</h3>
		<hr>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>