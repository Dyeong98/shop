<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>freeBrdWrite</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script type="text/javascript">
			$(document).ready(function() {
				$("#freebrdinsert").click(function() {
					if($.trim($("#title").val()) == ""){
						alert("제목을 입력해주세요.");
						$("#title").focus();
						return;
					}
					if($.trim($("#writer").val()) == ""){
						alert("작성자를 입력해주세요.");
						$("#writer").focus();
						return;
					}
					if($.trim($("#contents").val()) == ""){
						alert("내용을 입력해주세요.");
						$("#contents").focus();
						return;
					}
					$("#freebrdwriteform").attr("action","./freeBrdInsert");
					$("#freebrdwriteform").submit();
				});
			});
		</script>
	</head>
	<body>
		<%@include file="./topmenu.jsp" %>
		<h1>게시글 등록</h1>
		<form method="post" id="freebrdwriteform" name="freebrdwriteform">
			<table border="1">
				<colgroup>
					<col width="10%">
					<col width="40%">
					<col width="10%">
					<col width="40%">
				</colgroup>
					<thead>
						<th>제목</th>
						<th><input type="text" id="title" name="title" style="width=100%; margin: 0px; padding: 0px;"></th>
						<th>작성자</th>
						<th><input type="text" id="writer" name="writer" style="width=100%"></th>
					</thead>
				<tbody id="tb" >
					<tr>
						<td colspan="4">
							<textarea rows="10" cols="100%" id="contents" name="contents"></textarea>
						</td>
					</tr>
				</tbody>
			</table>
			</form>
			<br><br>
			<button id="freebrdinsert">게시글 등록</button>
		</form>
	</body>
</html>