<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>shop_join</title>
    	<link href="./resources/bootstrap-3.3.2-dist/css/bootstrap.min.css" rel="stylesheet">
		<link href="./resources/assistshop/css/shop_join.css" rel="stylesheet">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    	<script src="./resources/bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>
		<script src="./resources/assistshop/js/shop_join.js"></script>
	</head>
	<body>
		<%@include file="./shop_menu.jsp" %>
		<div class="container" id="joinuser_contents_margin">
			<form class="form-join" id="shop_join_form" method="post">
				<div class="form-group">
					<div class="col-xs-12 form_contents_margin">
						<h2 class="form-join-heading">회원가입</h2>
					</div>
				</div>
				<div class="form-group">
					<div class="col-xs-12">
						<div class="has-error has-feedback form_contents_margin" id="user_name_div">
							<label for="user_name">이름*</label>
							<input type="text" id="user_name" name="user_name" class="form-control" placeholder="Name" required="required">
		 					<span class="glyphicon glyphicon-remove form-control-feedback" id="user_name_span" aria-hidden="true"></span>
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="col-xs-10">
						<div class="has-error has-feedback form_contents_margin " id="user_id_div">
							<label for="user_id">아이디*</label>
							<input type="text" id="user_id" class="form-control" placeholder="4자리 이상 16자리 이하, 영문과 숫자만 가능" maxlength="16" required="required">
		 					<span class="glyphicon glyphicon-remove form-control-feedback" aria-hidden="true" id="user_id_span"></span>
						</div>
					</div>
					<div class="col-xs-2">
						<div class="form_contents_margin" id="user_id_chk_div">
							<label for="user_id_chk">중복체크</label>
							<button type="button" class="btn btn-default btn-block" id="user_id_chk">
								<span class="glyphicon glyphicon-ok-circle" aria-hidden="true" id="user_id_chk_span"></span>
							</button>
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="col-xs-12">
						<div class="has-error has-feedback form_contents_margin" id="user_pwd_div">
							<label for="user_pwd">비밀번호*</label>
							<input type="password" id="user_pwd" class="form-control" placeholder="4자리 이상 20자리 이하, 숫자 혹은 특수 문자를 반드시 포함" required="required">
		 					<span class="glyphicon glyphicon-remove form-control-feedback" id="user_pwd_span" aria-hidden="true"></span>
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="col-xs-12">
						<div class="form-group has-error has-feedback form_contents_margin" id="user_pwdChk_div">
							<label for="user_pwdChk">비밀번호 확인*</label>
							<input type="password" id="user_pwdChk" class="form-control" placeholder="비밀번호를 다시 입력해주세요." required="required">
		 					<span class="glyphicon glyphicon-remove form-control-feedback" id="user_pwdChk_span" aria-hidden="true" ></span>
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="col-xs-12">
						<div class="has-error has-feedback find_contents_margin" id="user_phone_div">
							<label for="user_phone">전화번호*</label>
							<input type="text" id="user_phone" class="form-control" placeholder="-없이 11자리 입력" required="required" maxlength="11">
		 					<span class="glyphicon glyphicon-remove form-control-feedback" id="user_phone_span" aria-hidden="true"></span>
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="col-xs-12">
						<div class="form_contents_margin" id="user_birthday_div">
							<label for="user_birthday">생년월일</label>
							<input type="date" id="user_birthday" class="form-control" />
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="col-xs-12">
						<div class="form_contents_margin" id="user_sex_div">
							<label for="user_sex1">성별</label>
							<label class="radio-inline">
								<input type="radio" name="user_sex" id="user_sex1" value="M"> 남성
							</label>
							<label class="radio-inline">
								<input type="radio" name="user_sex" id="user_sex2" value="F"> 여성
							</label>
						</div>					
					</div>
				</div>
				<div class="form-group">
					<div class="col-xs-12">
						<div class="form_contents_margin">
							<label for="joinuserAgree1">개인 정보 제공 약관*</label>
	     				    <input type="checkbox" id="joinagreeChk1" value="0"> 동의합니다.
		 					<textarea class="form-control" rows="3" id="joinuserAgree1" readonly="readonly">개인 정보 제공 약관</textarea>
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="col-xs-12">
						<div class="form_contents_margin">
							<label for="joinuserAgree2">서비스 이용 약관*</label>
	     				    <input type="checkbox" id="joinagreeChk2" value="0"> 동의합니다.
		 					<textarea class="form-control" rows="3" id="joinuserAgree2" readonly="readonly">서비스 이용 약관</textarea>
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="col-xs-12">
						<div class="form_contents_margin">
							<button type="button" class="btn btn-lg btn-primary btn-block" id="joinBtn">회원가입</button>
						</div>
					</div>
				</div>
			</form>
		</div>
	</body>
</html>