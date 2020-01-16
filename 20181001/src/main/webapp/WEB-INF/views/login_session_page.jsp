<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login_session_page</title>
</head>
<body>
	<script type="text/javascript">
		if(${userSession == null || userSession.mbr_id == ""}){
			alert("login please!");
			location.href="./loginsessionform";
		}
	</script>
	<h1>
		${userSession.mbr_nm}님 환영합니다.
		<br><br>
		<a href="./loginsessionmypage">go to mypage</a>
		<br><br>
		<a href="./loginsessionout">go to logout</a>
	</h1>
</body>
</html>








