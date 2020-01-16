<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>daummain</title>
		<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	</head>
	<body>
		<script>
			$(document).ready(function() {
				$("#addrBtn").click(function() {
				    new daum.Postcode({
				        oncomplete: function(data) {
							var addr = '';
							if (data.userSelectedType == 'R') {
								addr = data.roadAddress;
							}else{
								addr = data.jibunAddress;
							}
							$("#post_code").val(data.zonecode);
							$("#addr1").val(addr);
				        }
				    }).open();
				});
			});
		</script>
		<input type="text" id="post_code" />
		<button id="addrBtn">
			우편번호 찾기
		</button>
		<input type="text" id="addr1"/>
		<input type="text" id="addr2"/>
	</body>
</html>