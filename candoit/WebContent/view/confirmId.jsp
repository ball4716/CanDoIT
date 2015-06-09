<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "candoit.MemberCanDoIT" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ID 중복확인</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<%
	request.setCharacterEncoding("utf-8");

	String member_id = request.getParameter("member_id");
	MemberCanDoIT manager = MemberCanDoIT.getInstance();
	int check = manager.confirmId(member_id);
%>
<body>
<%
	if(check ==1){
%>
<table width="270" border="0" cellspacing="0" cellpadding="5">
	<tr>
		<td height="39"><%=member_id %>이미 사용중인 아이디입니다.</td>
	</tr>
<form name="checkForm" method="post" action="confirmId.jsp">
	<tr>
		<td align="center">
			다른 아이디를 입력하세요.<p>
			<input type="text" size="10" maxlength="12" name="member_id">
			<input type="submit" value="ID중복확인">
		</td>
	</tr>
</form>
</table>

<%
	} else {
%>
<table width="270" border="0" cellspacing="0" cellpadding="5">
	<tr>
		<td align="center">
			<p>입력하신 <%=member_id %> 는 사용하실 수 있는 ID 입니다. </p>
			<input type="button" value="닫기" onclick="self.close()">
		</td>
	</tr>
</table>
<%
	}
%>
</body>
</html>
<script type="text/javascript">
<!--
	function setid()
		{
			opener.document.userinput.member_id.value="<%=member_id %>;
			self.close();
			} 
 //-->
 </script>