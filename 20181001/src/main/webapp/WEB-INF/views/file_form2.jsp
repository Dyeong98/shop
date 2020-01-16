<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>file_form2.jsp</title>
	</head>
	<body>
		<form action="./fileup2" method="post" enctype="multipart/form-data">
			제목 : <input type="text" id="title" name="title"/>
			<br><br>
			파일 : <input type="file" name="cumbu2"/>
			<br><br>
			파일 : <input type="file" name="cumbu3"/>
			<br><br>
			<input type="submit" name="업로드"/>
		</form>
	</body>
</html>