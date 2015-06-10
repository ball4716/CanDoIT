<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
<title>글쓰기</title>

<!-- Bootstrap core CSS -->
<link href="assets/css/bootstrap.min.css" rel="stylesheet">
<!-- Bootstrap theme -->
<link href="assets/css/bootstrap-theme.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="theme.css" rel="stylesheet">

<!-- IE8 에서 HTML5 요소와 미디어 쿼리를 위한 HTML5 shim 와 Respond.js -->
<!-- WARNING: Respond.js 는 당신이 file:// 을 통해 페이지를 볼 때는 동작하지 않습니다. -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body role="document">

<div class="container theme-showcase" role="main">
	<div class="jumbotron" id="BoxCenter2">
		<h1>글쓰기</h1>
	</div>
	<form class="form-horizontal" role="form" method="post"
		action="opennessInsertServlet">
		<div class="form-group">
			<label for="name" class="col-sm-1 control-label">Name</label>
			<div class="col-sm-11">
				<input type="text" class="form-control" id="name" name="writer"
					placeholder="이름 입력" value="">
			</div>
		</div>
		
		<div class="form-group">
			<label for="title" class="col-sm-1 control-label">title</label>
			<div class="col-sm-11">
				<input type="text" class="form-control" id="title" name="title"
					placeholder="제목 입력" value="">
			</div>
		</div>

		<div class="form-group">
			<label for="message" class="col-sm-1 control-label">Contents</label>
			<div class="col-sm-11">
				<textarea class="form-control" rows="11" name="contents"></textarea>
			</div>
		</div>

		<div class="form-group">
			<div class="col-sm-8 col-sm-offset-2">
				<input id="submit" name="submit" type="submit" value="Send"
					class="btn btn-primary">
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-10 col-sm-offset-2">
				<! Will be used to display an alert to the user>
			</div>
		</div>
	</form>


	<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
	<script src="assets/js/bootstrap.min.js"></script>
	</div>
	<div class="mastfoot">
		<div class="inner">
			<p>
				Can Do IT
			</p>
		</div>
	</div>
</body>
</html>