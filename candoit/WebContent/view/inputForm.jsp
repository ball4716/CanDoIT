<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>회원가입</title>
<script type="text/javaScript">
    
    function checkIt() {
        var userinput = document.userinput;
        if(!userinput.member_id.value) {
            alert("ID를 입력하세요");
            userinput.member_id.focus();
            return false;
        }
        if(!userinput.member_passwd.value ) {
            alert("비밀번호를 입력하세요");
            userinput.member_passwd.focus();
            return false;
        }
        if(!userinput.member_name.value) {
            alert("사용자 이름을 입력하세요");
            userinput.member_name.focus();
            return false;
        }
        if(!userinput.member_email.value) {
            alert("사용자 이메일을 입력하세요");
            userinput.member_email.focus();
            return false;
        }
        return true;
    }
    // 아이디 중복 여부를 판단
    function openConfirmid(userinput) {
        // 아이디를 입력했는지 검사
        if (userinput.member_id.value == "") {
            alert("아이디를 입력하세요");
            userinput.member_id.focus();
            return;
        }
        // url과 사용자 입력 id를 조합합니다.
        url = "confirmId.jsp?member_id=" + userinput.member_id.value ;
        
        // 새로운 윈도우를 엽니다.
        open(url, "confirm", 
"toolbar=no,location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=300, height=200");
    }
</script>
</head>
<body>
<form method="post" action="inputPro.jsp" 
      name="userinput" onSubmit="return checkIt()">
사용자 ID : 
<input type="text" name="member_id" size="10" maxlength="12">
<input type="button" name="confirm_id" value="ID중복확인" 
                    onClick="openConfirmid(this.form)">
<br/>
 비밀번호 : 
<input type="password" name="member_passwd" size="15" maxlength="12">
<br/>
사용자 이름 : 
<input type="text" name="member_name" size="15" maxlength="10"><br/>
E-Mail : 
<input type="text" name="member_email" size="40" maxlength="30"><br/>

<input type="submit" value="등   록" >
<input type="reset" value="다시입력">
</form>
</body>
</html>
