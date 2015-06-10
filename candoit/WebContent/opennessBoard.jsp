<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="opennessDao.opennessDAO"%>
<%@page import="opennessDao.opennessVO"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">

<title>오프니스 게시판</title>

<!-- Bootstrap core CSS -->
<link href="assets/css/bootstrap.min.css" rel="stylesheet">
<!-- Bootstrap theme -->
<link href="assets/css/bootstrap-theme.min.css" rel="stylesheet">

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



	<div class="container theme-showcase" role="main">

		<!-- Main jumbotron for a primary marketing message or call to action -->
		<div class="jumbotron">
			<h1>오프니스 게시판</h1>
		</div>
		<div class="row" align="center">
			<div class="col-sm-4 col-md-8">
				<table class="table">
					<thead>
						<tr>
							<th>#</th>
							<th>제목</th>
							<th>글쓴이</th>
							<th>날짜</th>
						</tr>
					</thead>
					<tbody>
						<%
						opennessDAO dao = opennessDAO.getInstance();
							ArrayList<opennessVO> list = dao.connect();
							for (int i = 0; i < list.size(); i++) {
						%>
						<tr>
							<td><%=list.get(i).getNo()%>&nbsp</td>
							<td><a href="opennessContents.jsp?no=<%=list.get(i).getNo()%>"><%=list.get(i).getTitle()%></a>&nbsp&nbsp</td>
							<td><%=list.get(i).getWriter()%>&nbsp</td>
							<td><%=list.get(i).getNowDate()%></td>
						</tr>
						<%
							}
						%>

					</tbody>
				</table>
			</div>

		</div>

		<p align="center">
			<button type="button" class="btn btn-lg btn-success"
				onclick="location.href='opennessWrite.jsp'">글쓰기</button>



		</p>

	</div>

	<div class="mastfoot">
		<div class="inner">
			<p>Can Do IT</p>
		</div>
	</div>

	<!-- /container -->
	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="../../dist/js/bootstrap.min.js"></script>
	<script src="../../assets/js/docs.min.js"></script>
	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>


	<div id="global-zeroclipboard-html-bridge"
		class="global-zeroclipboard-container" title=""
		style="position: absolute; left: 0px; top: -9999px; width: 15px; height: 15px; z-index: 999999999;"
		data-original-title="Copy to clipboard">
		<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000"
			id="global-zeroclipboard-flash-bridge" width="100%" height="100%">
			<param name="movie"
				value="/assets/flash/ZeroClipboard.swf?noCache=1432641561906">
			<param name="allowScriptAccess" value="sameDomain">
			<param name="scale" value="exactfit">
			<param name="loop" value="false">
			<param name="menu" value="false">
			<param name="quality" value="best">
			<param name="bgcolor" value="#ffffff">
			<param name="wmode" value="transparent">
			<param name="flashvars"
				value="trustedOrigins=bootstrapk.com%2C%2F%2Fbootstrapk.com%2Chttp%3A%2F%2Fbootstrapk.com">
			<embed src="/assets/flash/ZeroClipboard.swf?noCache=1432641561906"
				loop="false" menu="false" quality="best" bgcolor="#ffffff"
				width="100%" height="100%" name="global-zeroclipboard-flash-bridge"
				allowscriptaccess="sameDomain" allowfullscreen="false"
				type="application/x-shockwave-flash" wmode="transparent"
				pluginspage="http://www.macromedia.com/go/getflashplayer"
				flashvars="trustedOrigins=bootstrapk.com%2C%2F%2Fbootstrapk.com%2Chttp%3A%2F%2Fbootstrapk.com"
				scale="exactfit">
		</object>
	</div>
	<svg xmlns="http://www.w3.org/2000/svg" width="1140" height="500"
		viewBox="0 0 1140 500" preserveAspectRatio="none"
		style="visibility: hidden; position: absolute; top: -100%; left: -100%;">
	<defs></defs> <text x="0" y="53"
		style="font-weight:bold;font-size:53pt;font-family:Arial, Helvetica, Open Sans, sans-serif;dominant-baseline:middle">Thirdslide</text></svg>




</body>
</html>