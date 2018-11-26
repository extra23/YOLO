<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet">

<style type="text/css">
.mainForm{width: 100%; height: 1000px; background-color: mistyrose; font-family: 'Jua', sans-serif;}
.loginForm{width: 700px; height: 700px; background-color: lightgreen;}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="mainForm">
	<div class="loginForm">
	<form class="form-horizontal">
  <div class="form-group">
    <label for="inputEmail3" class="col-sm-2 control-label">Email</label>
    <div class="col-sm-6">
      <input type="email" class="form-control" id="inputEmail3" placeholder="Email">
    </div>
  </div>
  <div class="form-group">
    <label for="inputPassword3" class="col-sm-2 control-label">Password</label>
    <div class="col-sm-6">
      <input type="password" class="form-control" id="inputPassword3" placeholder="Password">
    </div>
  </div>
  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
     <!--  <div class="checkbox">
        <label>
          <input type="checkbox"> Remember me
        </label>
      </div> -->
    </div>
  </div>
  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-15">
      <button type="submit" class="btn btn-default">Login</button>
    </div>
    <div class="col-sm-offset-2 col-sm-10">
      <button type="submit" class="btn btn-default">Cancel</button>
    </div>
    <div class="col-sm-offset-2 col-sm-10">
      <button type="submit" class="btn btn-default">Sign in</button>
    </div>
  </div>
</form>
	
	</div>
</div>
</body>
</html>