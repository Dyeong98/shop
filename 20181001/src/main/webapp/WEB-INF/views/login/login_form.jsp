<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>login form</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#login_btn").click(function(){
				if($.trim($("#mbr_id").val()) == ""){
					alert("아이디를 확인하세요.");
					$("#mbr_id").focus();
					return;
				}
				if($.trim($("#mbr_pwd").val()) == ""){
					alert("비밀번호를 확인하세요.");
					$("#mbr_pwd").focus();
					return;
				}

				$.post(
						"./loginproc"
						,{
							mbr_id:$("#mbr_id").val()
							,mbr_pwd:$("#mbr_pwd").val()
						}
						,function(data,status){
							if(status == "success"){
								if(data > 0){
									alert("로그인 되었습니다.");
									location.href="./";
								} else if(data == 0){
									alert("존재하지 않는 아이디 또는 비밀번호 입니다.");
								} else {
									alert("잠시 후, 다시 시도해 주세요.");
								}
							} else {
								alert("시스템 관리자에게 문의 바랍니다.");
							}
						}
				);//post
			});//click
		});//ready
	</script>
	<%@ include file="../topmenu.jsp" %>
	<div class="row">
		<div class="column">
			<h2></h2>
			<p>
			</p>
		</div>
		<div class="column">
			<h2 style="text-align:center;">로그인</h2>
			<hr width="100%" align="center">
			<table width="100%">
				<colgroup>
					<col width="30%">
					<col width="70%">
				</colgroup>
				<tr>
					<td style="text-align:right;">I D</td>
					<td><input type="text" id="mbr_id" name="mbr_id" /></td>
				</tr>
				<tr>
					<td style="text-align:right;">P W</td>
					<td><input type="password" id="mbr_pwd" name="mbr_pwd" /></td>
				</tr>
				<tr>
					<td></td>
					<td><input type="button" id="login_btn" value="로그인"
								style="width:50%" /></td>
				</tr>
			</table>
			<hr width="52%" align="center">
			<table width="100%">
				<tr>
					<td style="text-align:center;">
						아이디 찾기 |
						비밀번호 찾기 |
						<span class="ablack"><a href="./joinform">회원 가입</a></span>
					</td>
				</tr>
			</table>
			<hr width="100%" align="center">
		</div>
		<div class="column">
			<h2></h2>
			<p>
			</p>
		</div>
	</div><!-- row -->
	<%@ include file="../footer.jsp" %>
</body>
</html>
