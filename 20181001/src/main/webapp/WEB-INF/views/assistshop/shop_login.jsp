<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>shop_login</title>
    	<link href="./resources/bootstrap-3.3.2-dist/css/bootstrap.min.css" rel="stylesheet">
		<link href="./resources/assistshop/css/shop_login.css" rel="stylesheet">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    	<script src="./resources/bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>
		<script src="./resources/assistshop/js/shop_login.js"></script>
	</head>
	<body>
	<%@include file="./shop_menu.jsp" %>
		<div class="container" id="login_contents_margin">
			<form class="form-login" method="post" id="shop_login_form">
				<div class="form-group">
					<div class="col-xs-12">
						<div class="form_contents_margin">
							<h2 class="form-signin-heading">로그인</h2>
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="col-xs-12">
						<div class="form_contents_margin ">
							<label for="user_id">아이디</label>
							<input type="text" id="user_id" class="form-control input-lg" placeholder="ID" autofocus="autofocus">
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="col-xs-12">
						<div class="form_contents_margin">
							<label for="user_pwd">비밀번호</label>
							<input type="password" id="user_pwd" class="form-control input-lg" placeholder="Password" >
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="col-xs-12 ">
						<div class="form_contents_margin">
							<button type="button" class="btn btn-lg btn-primary btn-block" id="shop_loginBtn">로그인</button>
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="col-xs-12 col-sm-6">
						<div class="form_contents_margin">
							<button type="button" class="btn btn-xs btn-default btn-block" id="findidBtn">아이디 찾기</button>
						</div>
					</div>
					<div class="col-xs-12 col-sm-6 ">
						<div class="form_contents_margin">
							<button type="button" class="btn btn-xs btn-default btn-block" id="findpwdBtn">비밀번호 찾기</button>
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="col-xs-12">
						<div class="form_contents_margin" id="joinuserBtn">
							<button type="button" class="btn btn-lg btn-success btn-block">회원가입</button>
						</div>
					</div>
				</div>
			</form>
	    </div>
	</body>
</html>