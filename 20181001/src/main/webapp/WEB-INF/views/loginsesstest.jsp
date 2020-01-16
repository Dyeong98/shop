<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>loginsesstest</title>
	</head>
	<body>
		<script type="text/javascript">
			if(${usersess}==null || ${usersess.mbr_id} == ""){
				alert("잘못된접근");
				location.href="./loginsessionform";
			}
		</script>
		${usersess}
	</body>
</html>