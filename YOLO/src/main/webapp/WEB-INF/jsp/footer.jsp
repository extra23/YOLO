<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>footer.jsp</title>
	
	<link href="https://fonts.googleapis.com/css?family=Baloo+Tamma" rel="stylesheet">
	
	<style>

		/* #footer{
			background-color: gray;
 			left:0; bottom:0; z-index:2; width:100%;
 			float: left;
			height:200px;
			box-shadow: 0px 0px 20px #3c3c3c inset;
		}

		#copyright{    
			font-family: 'Baloo Tamma', cursive;    
		    margin-left: 40px;
		    margin-top: 30px;
		    width: 30%;
		    height: 150px;
		    top: 40px;
		    display: inline-block;
		}

		#footer a {font-family: 'Baloo Tamma', cursive;}

		#footer a:link { color: black; text-decoration: none;}
		#footer a:visited { color: black; text-decoration: none;}
		#footer a:hover { color: black; text-decoration: underline;}
		
		.sns{color: black; text-decoration: underline; }
		
		#conTitle{padding: 0px;}
		
		#contact{   
			margin-top : 30px;
			margin-right : 60px;
			border: 1px solid black;
			width: 20%;
			height: 150px;
			display: inline-block;
			float: right;
		}

		#conContent{margin-left: 20px;}
		
		#copyTitle{padding: 0px; float: left; margin-left: 10%;} */
		
		
		
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
		
		#contactList {
			list-style: none;
			margin: 0;
			padding: 0;
			text-indent: 1.5em;
		}
		
		#contactList a {
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
			<h3>
			Service Problem
			</h3>
			
				
				<a href="mailto:YOLO@gmail.com?Subject=Hello%Help Me!">YOLO@gmail.com</a>
				
			
			</li>
		</ul>
	</div>
	
</body>
</html>