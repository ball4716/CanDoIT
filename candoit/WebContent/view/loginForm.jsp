<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head><title>Log in</title>
	<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<!--[if lte IE 8]><script src="assets/css/ie/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="../assets/css/main.css" />
		<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie/v8.css" /><![endif]-->
		<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie/v9.css" /><![endif]-->
		<!--[if lte IE 8]><script src="assets/css/ie/respond.min.js"></script><![endif]-->
</head>
<body>
<h3>Log in</h3>
<form action="loginPro.jsp" method="post">
<div class="12u$" style="margin:'auto' margin-left:'30%'">
	<input type="text" name="member_id" id="member_id" placeholder="ID"><br/>
	<input type="password" name="member_passwd" name="member_passwd" placeholder="PASSWORD"><br/>
</div>
<div class="6u 12u$(medium)" style=margin:auto>
	<ul class="actions fit">
		<li>
			<input class="button special fit" type=submit value="로그인">
		</li>
		<li>
			<input class="button special fit" type="button" value="회원가입" onclick="location.href='inputForm.jsp'">
		</li>
	</ul>
</div>
</form>
</body>
</html>