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
.form-horizontal{margin-left: 50px; margin-top: 70px;}
.mainForm{width: 100%; height: 1000px; background-color: mistyrose; font-family: 'Jua', sans-serif; text-align: center;}
.loginForm{width: 40%; height: 600px; background-color: lightgreen; display: inline-block; margin-top: 30px; border: 1px solid black; border-radius: 10px;}
.form-group-lg{margin-right: 20px!important;}
.btn{margin-bottom: 10px;}
p{font-size: 50px; margin-top: 40px;}

</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="mainForm">
	<div class="loginForm">
	<p>LOGIN</p>
	<form class="form-horizontal">
  <div class="form-group form-group-lg">
    <label for="inputEmail3" class="col-sm-3 control-label">Email</label>
    <div class="col-sm-6">
      <input type="email" class="form-control" id="inputEmail3" placeholder="Email">
    </div>
  </div>
  <div class="form-group form-group-lg">
    <label for="inputPassword3" class="col-sm-3 control-label">Password</label>
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
    <div class="col-sm-offset-2 col-sm-7">
      <button type="submit" class="btn btn-default btn-block btn-lg">Login</button>
    </div>
    <div class="col-sm-offset-2 col-sm-7">
      <button type="submit" class="btn btn-default btn-block btn-lg">Cancel</button>
    </div>
    <div class="col-sm-offset-2 col-sm-7">
      <button type="submit" class="btn btn-default btn-block btn-lg">Sign</button>
    </div>
  </div>
</form>
	
	</div>
</div>
</body>
</html>