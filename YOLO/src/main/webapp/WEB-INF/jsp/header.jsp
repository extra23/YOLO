<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>header.jsp</title>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

</head><!-- -->
<style>
.background {
	background-color: black;
	height: 80px;
	width: 100%;
}

#logo {
	float: left;
	margin: 15px;
}

#logo img {
	border-radius: 100%;
	width: 50px;
}

.col-lg-6 {
	top: 20px;
	left: calc(100%/ 1.3);
	width: 250px;
	float: none;
	display: inline-block;
}

.row {
	background-color: black;
}

.dropdown {
	top: 8px;
	left: calc(100%/ 1.27);
	float: none;
	display: inline-block;
}

</style>
<body>
	<div class="background">
		<div id="logo">
			<a href="mainBoard.jsp"><img src="img/logogo.jpg"></a>
		</div>

		<div class="col-lg-6">
			<form class="input-group" action="search?searchId=${param.searchId}"
				method="post">
				<input type="text" name="searchWord" class="form-control"> <span
					class="input-group-btn"> <input type="submit"
					class="btn btn-default" value="검색">
				</span>

			</form>
			
		</div>
		
		<div class="dropdown">
				<button class="btn btn-default dropdown-toggle" type="button"
					id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">
					로그인 <span class="caret"></span>
				</button>
				<ul class="dropdown-menu" role="menu"
					aria-labelledby="dropdownMenu1">
					<li role="presentation"><a role="menuitem" tabindex="-1"
						href="#">Action</a></li>
					<li role="presentation"><a role="menuitem" tabindex="-1"
						href="#">Another action</a></li>
					<li role="presentation"><a role="menuitem" tabindex="-1"
						href="#">Something else here</a></li>
					<li role="presentation"><a role="menuitem" tabindex="-1"
						href="#">Separated link</a></li>
				</ul>
			</div>

	</div>
</body>
</html>