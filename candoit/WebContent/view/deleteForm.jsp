<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
if(session.getAttribute("member_id") == null){
response.sendRedirect("main.jsp");
}else{
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 탈퇴</title>
</head>
<body>
<form name="myform" action="deletePro.jsp" method="post">
I    D : <input type=password name="member_id"  size="15" maxlength="12"><br/>
PASSWD : <input type=password name="member_passwd"  size="15" maxlength="12"><br/>

<input type=submit value="회원탈퇴">
<input type="button" value="취  소" onclick="location.href='index.jsp'">
</form>
</body>
</html>
<%}%>