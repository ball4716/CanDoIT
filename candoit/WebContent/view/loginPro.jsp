<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import = "candoit.MemberCanDoIT" %>
<%
	request.setCharacterEncoding("utf-8");

	String member_id = request.getParameter("member_id");
	String member_passwd  = request.getParameter("member_passwd");
	
	MemberCanDoIT manager = MemberCanDoIT.getInstance();
    int check= manager.userCheck(member_id,member_passwd);

	if(check==1){
		//로그인 성공
		session.setAttribute("member_id",member_id);
		response.sendRedirect("../index.jsp");
	}else if(check==0){
%>
	<script> 
	  alert("비밀번호가 맞지 않습니다.");
      history.go(-1);
	</script>
<%	}else{ %>
	<script>
	  alert("아이디가 맞지 않습니다..");
	  history.go(-1);
	</script>
<%}	%>	

