<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Sign in</title>
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
        url = "confirmId.jsp?member_id=" + userinput.member_id.value;
        
        // 새로운 윈도우를 엽니다.
        open(url, "confirm", 
"toolbar=no,location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=300, height=200");
    }
</script>
<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<!--[if lte IE 8]><script src="assets/css/ie/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="../assets/css/main.css" />
		<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie/v8.css" /><![endif]-->
		<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie/v9.css" /><![endif]-->
		<!--[if lte IE 8]><script src="assets/css/ie/respond.min.js"></script><![endif]-->
</head>
<body>
<h3>Sign in</h3>
<form method="post" action="inputPro.jsp" 
      name="userinput" onSubmit="return checkIt()">
<div class="12u$" style=margin:auto>
	<input type="text" name="member_id" maxlength="12" placeholder="ID"><br/>
</div>
<div class="6u 12u$(medium)" style=margin:auto>
	<ul class="actions fit">
		<li>
			<input class="button special fit" type="button" name="confirm_id" value="ID 중복 확인" 
                   	onClick="openConfirmid(this.form)"><br/>
        </li>
    </ul>
</div>
<div class="12u$" style=margin:auto> 
	<input type="password" name="member_passwd" id="member_passwd" maxlength="12" placeholder="passwd"><br/> 
	<input type="text" name="member_name" id="member_name" maxlength="10" placeholder="name"><br/>
	<input type="text" name="member_email" id="member_email" maxlength="30" placeholder="email"><br/>
</div>
<div class="6u 12u$(medium)" style=margin:auto>
	<ul class="actions fit">
		<li>
			<input class="button special fit"  type="submit" value="등   록" >
		</li>
		<li>
			<input class="button special fit"  type="reset" value="다시입력">
		</li>
	</ul>
</div>
</form>
</body>
</html>
