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
			CKEDITOR.replace('contents');
		</script>
		<button id="sendBtn" name="sendBtn">전송</button>
		<script type="text/javascript">
			$(document).ready(function() {
				$('#sendBtn').click(function() {
					var data = CKEDITOR.instances.contents.getData();
					if (data == "") {
						alert("내용을 입력해주세요.");
						CKEDITOR.instances.contents.focus();
						return;
					}//if
					$.post(
							"./ckpost"
							,{contents : data}
							,function(data, status){
								if (status == "success") {
									alert("성공");
								}else{
									alert("실패");
								}//if
							}//function
							
					);//post
				});//click
			});//document
		</script>
	</body>
</html>