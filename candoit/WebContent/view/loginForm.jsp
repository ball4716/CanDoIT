<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head><title>로그인</title>
</head>
<body>
<h3>회원로그인</h3>
<form action="loginPro.jsp" method="post">
 아이디 : <input type="text" name="member_id" size="15" maxlength="12"><br/>
비밀번호 : <input type="password" name="member_passwd"  size="15" maxlength="12"><br/>
<input type=submit value="로그인"> 
<input type=reset value="다시입력">
<input type="button" value="회원가입" onclick="location.href='inputForm.jsp'">
</form>
</body>
</html>