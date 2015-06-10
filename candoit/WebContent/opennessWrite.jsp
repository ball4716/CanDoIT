<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- �� 3���� ��Ÿ �±״� *�ݵ��* head �±��� ó���� �;��մϴ�; � �ٸ� ���������� �ݵ�� �� �±׵� *������* �;� �մϴ� -->
<title>�۾���</title>

<!-- Bootstrap core CSS -->
<link href="assets/css/bootstrap.min.css" rel="stylesheet">
<!-- Bootstrap theme -->
<link href="assets/css/bootstrap-theme.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="theme.css" rel="stylesheet">

<!-- IE8 ���� HTML5 ��ҿ� �̵�� ������ ���� HTML5 shim �� Respond.js -->
<!-- WARNING: Respond.js �� ����� file:// �� ���� �������� �� ���� �������� �ʽ��ϴ�. -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body role="document">

<div class="container theme-showcase" role="main">
	<div class="jumbotron" id="BoxCenter2">
		<h1>�۾���</h1>
	</div>
	<form class="form-horizontal" role="form" method="post"
		action="opennessInsertServlet">
		<div class="form-group">
			<label for="name" class="col-sm-1 control-label">Name</label>
			<div class="col-sm-11">
				<input type="text" class="form-control" id="name" name="writer"
					placeholder="�̸� �Է�" value="">
			</div>
		</div>
		
		<div class="form-group">
			<label for="title" class="col-sm-1 control-label">title</label>
			<div class="col-sm-11">
				<input type="text" class="form-control" id="title" name="title"
					placeholder="���� �Է�" value="">
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


	<!-- jQuery (��Ʈ��Ʈ���� �ڹٽ�ũ��Ʈ �÷������� ���� �ʿ��մϴ�) -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<!-- ��� �����ϵ� �÷������� �����մϴ� (�Ʒ�), ������ �ʴ´ٸ� �ʿ��� ������ ������ �����ϼ��� -->
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