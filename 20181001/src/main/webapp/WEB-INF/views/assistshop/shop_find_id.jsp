<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>아이디 찾기</title>
    	<link href="./resources/bootstrap-3.3.2-dist/css/bootstrap.min.css" rel="stylesheet">
    	<link href="./resources/assistshop/css/shop_find.css" rel="stylesheet">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    	<script src="./resources/bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>
		<script src="./resources/assistshop/js/shop_find_id.js"></script>
	</head>
	<body>
		<div class="container" id="find_contents">
			<form class="form_findid" id="find_id_form">
				<div class="form-group">
					<div class="col-xs-12 ">
						<h2 class="form-findid-heading">아이디찾기</h2>
					</div>
				</div>
				<div class="form-group">
					<div class="col-xs-12">
						<div class="find_contents_margin">
							<label for="user_name">이름</label>
							<input type="text" id="user_name" class="form-control" placeholder="Name" autofocus="autofocus">
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="col-xs-12">
						<div class="find_contents_margin" id="findid_tel">
							<label for="user_phone">전화번호</label>
							<input type="text" id="user_phone" class="form-control" placeholder="-없이 입력"  maxlength="11">
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="col-xs-12">
						<div class="find_contents_margin">
							<button type="button" class="btn btn-lg btn-primary btn-block" id="findBtn">찾기</button>
						</div>
					</div>
				</div>
			</form>
		</div>
	</body>
</html>