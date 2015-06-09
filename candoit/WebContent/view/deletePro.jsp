<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import = "candoit.MemberCanDoIT" %>
<% 
   if(session.getAttribute("member_id") == null){
	   response.sendRedirect("../index.jsp");
   }else{
%>
<% 
	String member_id  = request.getParameter("member_id");
	String member_passwd  = request.getParameter("member_passwd");
	
	MemberCanDoIT manager = MemberCanDoIT.getInstance();
    int check = manager.userCheck(member_id,member_passwd);
	
	if(check==1){
		manager.deleteMember(member_id);
		session.invalidate();
%>
<html>
<head>
<title>회원탈퇴</title>
</head>
<body>
<h4>회원정보 삭제</h4>
<div align="center">
회원정보가 삭제되었습니다.<br/>
<input type="button" value="확인" 
                         onClick="location.href='index.jsp'">
</div>
</body>
</html>
<%}else {%>
	<script> 
	  alert("id 또는 비밀번호가 맞지 않습니다.");
      history.go(-1);
	</script>
<%   }
   }
%>