<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login_session_myPage</title>
</head>
<body>
	<script type="text/javascript">
		if(${userSession == null || userSession.mbr_id == ""}){
			alert("login please!");
			location.href="./loginsessionform";
		}
	</script>
	<h1>
		login_session_myPage
		<br><br>
		${userSession.mbr_nm}
	</h1>
</body>
</html>