<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "candoit.MemberCanDoIT,com.domain.Member" %>
<% 
   
   if(session.getAttribute("member_id") == null){
	   response.sendRedirect("../index.jsp");
   }else{
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>회원정보수정</title>
</head>
<%
    String member_id = (String)session.getAttribute("member_id"); 
    MemberCanDoIT manager = MemberCanDoIT.getInstance();
    Member c = manager.getMember(member_id);
    
    if(c.getMember_email()==null){
    	c.setMember_email("");	
    }
%>
<body>
<form method="post" action="modifyPro.jsp" name="userinput">
<h3>회원정보수정</h3>

사용자 ID : <%=c.getMember_id()%><br/>

비밀번호 : <input type="password" name="member_passwd" size="10" 
         maxlength="10" value="<%=c.getMember_passwd()%>"><br/>
         
 사용자 이름 : <input type="text" name="member_name" size="15" 
            maxlength="20" value="<%=c.getMember_name()%>"><br/>
            

E-Mail : <input type="text" name="member_email" size="40" 
          maxlength="30" value="<%=c.getMember_email()%>"><br/>
        
<input type="submit" name="modify" value="수   정" >
<input type="button" value="취  소" 
              onclick="location.href='main.jsp'">      
</form>
</body>
</html>
<%}%>

