<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="euc-kr">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">

<title>김진호 게시판</title>

<!-- Bootstrap core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<!-- Bootstrap theme -->
<link href="css/bootstrap-theme.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="theme.css" rel="stylesheet">

<!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
<!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
<script src="js/ie-emulation-modes-warning.js"></script>

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body role="document">



<%

		String no = request.getParameter("no");
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection conn = DriverManager.getConnection(
				"jdbc:oracle:thin:@localhost:1521:XE", "kjh", "kjh1");
		Statement stmt = conn.createStatement();

		String sql = "select no, title, contents, writer, to_char(nowdate,'YYMMDD') nowdate from opennessboard where no="+no;
		ResultSet rs = stmt.executeQuery(sql);
		rs.next();
%>
	<div class="container theme-showcase" role="main">
	<div class="jumbotron">
		<h1><%=rs.getString("title")%></h1>		
	</div>
	<div>
	<h3><%=rs.getString("contents")%></h3>
	</div>
	<br>
	<button type="button" class="btn btn-lg btn-success"
				onclick="location.href='opennessBoard.jsp'">돌아가기</button>
	
	
<%
rs.close();
stmt.close();
%>
</div>
<div class="mastfoot">
		<div class="inner">
			<p>
				김진호 : kimjinho312@naver.com
			</p>
		</div>
	</div>
</body>
</html>