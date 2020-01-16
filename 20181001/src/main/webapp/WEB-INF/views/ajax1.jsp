<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>ajax1.jsp</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script type="text/javascript">
			$(document).ready(function() {
				$.ajaxSetup({cache:false});
				$("button").click(function() {
					$.get("./ajax1call"
							,{
								id:$("#idtxt").val()
								,pwd:"pwdValue"
							}
							,function(data, status){
								alert("ok");
								alert(data);
								alert(status);
							});
				});//click
			});//document
		</script>
	</head>
	<body>
		<input type="text" value="한글" readonly="readonly" style="background-color: lightgray" id="idtxt"/>
		<button>ajax call</button>
		<div>divdivdivdi vd</div>
	</body>
</html>