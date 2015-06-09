<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "candoit.MemberCanDoIT" %>
<% 
   if(session.getAttribute("member_id") == null){
	   response.sendRedirect("main.jsp");
   }else{
	request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="member" class="com.domain.Member">
    <jsp:setProperty name="member" property="*" />
</jsp:useBean>
 <%
 	member.setMember_id((String)session.getAttribute("member_id"));

 	MemberCanDoIT manager = MemberCanDoIT.getInstance();
     manager.updateMember(member);
 %>
<html>
<head>
<title>회원정보수정</title> 
<meta http-equiv="Refresh" content="5;url=../index.jsp">
</head>
<body>
<h3>회원정보 수정</h3>
<div align="center">회원정보가 정상적으로 수정되었습니다.</div>
</body>
</html>
<%}%>