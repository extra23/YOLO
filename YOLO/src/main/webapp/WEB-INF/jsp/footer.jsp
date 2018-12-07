<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>footer.jsp</title>
	
	<link href="https://fonts.googleapis.com/css?family=Baloo+Tamma" rel="stylesheet">
	
	<style>
		
		#footer {
			background-color: gray;
 			left:0; bottom:0; z-index:2; width:100%;
 			float: left;
			box-shadow: 0px 0px 20px #3c3c3c inset;
		}
		
		#footer *  {
			font-family: 'Baloo Tamma', cursive;
			color: black;
		}
				
		#footerList {
			list-style: none;
			float: right;
    		position: relative;
    		left: -50%;
		}
		
		#footerList>li {
			float: left;
    		position: relative;
    		left: 50%;
    		margin: 30px;
    		margin-left: 100px;
    		margin-right: 100px;
		}
		
		#contactList, #dealProblemList {
			list-style: none;
			margin: 0;
			padding: 0;
			text-indent: 1.5em;
		}
		
		#contactList a, #dealProblemList a {
			color: #333;
		}

	</style>
	
</head>
<body>
	
	<div id="footer">
		<ul id="footerList">
			<li>
				<div id="copyright">
					<h3>Copyright</h3>
				</div>
			</li>
			<li>
				<h3>Contact</h3>
				<ul id="contactList">
					<li><a href="https://www.facebook.com/">· FaceBook</a></li>
					<li><a href="https://twitter.com/">· Twitter</a></li>
					<li><a href="https://www.instagram.com/">· Instagram</a></li>
				</ul>
			</li>
			<li>
				<h3>Service Problem</h3>
				<ul id="dealProblemList">
					<li><a href="mailto:YOLO@gmail.com?Subject=Hello%Help Me!">· YOLO@gmail.com</a></li>
				</ul>
			</li>
		</ul>
	</div>
	
</body>
</html>