<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>file_form3.jsp</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	</head>
	<body>
		<form id="fileform3" enctype="multipart/form-data">
			ajax 파 일 업 로 드 : <input type="file" name="cumbu4" id="cumbu4"/>
		</form>
		<button id="fileUpBtn">첨부파일 업로드</button>
		<script type="text/javascript">
			$(document).ready(function() {
				$("#fileUpBtn").click(function() {
					var form = new FormData(document.getElementById("fileform3"));
					$.ajax({
						url : "./fileup3"
						, data : form
						, dataType : "text"
						, processData : false
						, contentType : false
						, type : "post"
						, success : function(result) {
							
						}
						, error : function(xhr) {
							alert("fail");
						}
					});//ajax
				});//click
			});//ready
		</script>
	</body>
</html>