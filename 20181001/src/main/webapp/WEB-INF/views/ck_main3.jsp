<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>ck_main</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="./resources/ckeditor/ckeditor.js"></script>
	</head>
	<body>
		<h1>CKEditor Test</h1>
		<textarea rows="15" cols="50" id="contents" name="contents"></textarea>
		<script>
			CKEDITOR.replace('contents',{
				filebrowserUploadUrl:'./ckupload'
			});
		</script>
		<h1>CKEditor Test</h1>
		<img alt="X" src="./resources/img/456.jpg" width="100" height="100">
	</body>
</html>