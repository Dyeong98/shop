<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:choose>
	<c:when test="${mbr_vo != null && mbr_vo.mbr_no != '' }">
		<h1>${mbr_vo.mbr_nm}님 환영합니다.</h1>
	</c:when>
	<c:when test="${mbr_vo == null || mbr_vo.mbr_no == '' }"> 값이 없습니다.
		<h2>로그인</h2>
		<form id="loginForm" name="loginForm" method="post">
		<table>
			<tr>
				<td>I D : </td>
				<td><input type="text" id="mbr_id" name="mbr_id"/></td>
				<td rowspan="2"><input type="button" value="로그인" id="login_btn"/></td>
			</tr>
			<tr>
				<td>PWD : </td>
				<td><input type="text" id="mbr_pwd" name="mbr_pwd"/></td>
			</tr>
		</table>
		</form>
		<hr width="52%" align="left">
		<table>
			<tr>
				<td>아이디 찾기</td>
				<td>비밀번호 찾기</td>
				<td>회원 가입</td>
			</tr>
		</table>
	</c:when>	
</c:choose>
<script type="text/javascript">
	$(document).ready(function() {
		$("#login_btn").click(function() {
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
			$("#loginForm").attr("action","");
			loginForm.submit();
			
		});
	});
</script>