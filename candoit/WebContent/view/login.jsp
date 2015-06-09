<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
   if(session.getAttribute("member_id") == null){
	   response.sendRedirect("../index.jsp");
   }else{
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head><title>메인입니다..</title>
</head>
<body>
       <table width="500" cellpadding="0" cellspacing="0"  align="center" border="1" >
         <tr>
           <td width="300" height="20">하하하</td>

           <td rowspan="3" align="center">
             <%=session.getAttribute("member_id")%>님이 <br>
             방문하셨습니다
             <form  method="post" action="logout.jsp">  
             <input type="submit"  value="로그아웃">
             <input type="button" value="회원정보변경" onclick="location.href='modifyForm.jsp'">
             <input type="button" value="회원탈퇴" onclick="location.href='deleteForm.jsp'">
             </form>
         </td>
        </tr>
       <tr > 
         <td rowspan="2" width="300" >메인입니다.</td>
      </tr>
     </table>
 </body>
</html>
<%}%>