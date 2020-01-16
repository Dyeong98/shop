<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>brddetail</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script type="text/javascript">
		<script type="text/javascript">
			$(document).ready(function() {
				$("#brdlike").click(function() {
					$.post(
							"./uplikecnt"
							,{
								no:$("#hidno").val()
							}
							,function(data, status){
								$("#like_cnt").val(data);
								$("#brdlike").css("color","red");
							}
					);//post
				});//click
			});//document
		</script>
		<script type="text/javascript">
			$(document).ready(function() {
				$("#brddelete").click(function() {
					var delYN = confirm("삭제하시겠습니까?");
					if(delYN == false){
						return;
					}
					$.post(
							"./brddelete"
							,{
								no:$("#hidno").val()
							}
							,function(data, status){
								if (status == "success") {
									if (data > 0) {
										alert("삭제되었습니다.");
										location.href = "./brdlist";
									}else{
										alert("잠시 후 다시 시도해주세요.");
									}
								}else{
									alert("관리자에게 문의바랍니다.");
								}
							}
					);//post
				});//click
			});//document
		</script>
		<script type="text/javascript">
			$(document).ready(function() {
				$("#brdrewrite").click(function() {
					$("#brddetailform").attr("action","./brdrewrite");
					$("#brddetailform").submit();
				});//click
			});//document
		</script>
	</head>
	<body>
		<h1>게시판 상세</h1>
		<form id="brddetailform" name="brddetailform" method="post">
			<table border="1">
				<colgroup>
				</colgroup>
				<tbody>
					<tr>
						<th>제목</th>
						<td><input type="text" id="title" name="title" value="${vo.title}" readonly="readonly"/></td>
						<th>번호</th>
						<td><input type="text" id="no" name="no" value="${vo.no}" readonly="readonly"/></td>
					</tr>
					<tr>
						<th>작성자</th>
						<td><input type="text" id="writer" name="writer" value="${vo.writer}" readonly="readonly"/></td>
						<th>작성일</th>
						<td><input type="text" id="write_date" name="write_date" value="${vo.write_date}" readonly="readonly"/></td>
					</tr>
					<tr>
						<th>내용</th>
						<td colspan="3"><div style="border: 1px solid black;" id="contents" name="contents" >${vo.contents}</div></td>
					</tr>
					<tr>
						<th>조회수</th>
						<td><input type="text" id="view_cnt" name="view_cnt" value="${vo.view_cnt}" readonly="readonly"/></td>
						<th>좋아요</th>
						<td>
							<input type="text" id="like_cnt" name="like_cnt" value="${vo.like_cnt}" readonly="readonly"/>
							<input type="button" id="brdlike" name="brdlike" value="♥" style="color: white;"/>
						</td>
					</tr>
				</tbody>
			</table>
			<input type="hidden" id="hidno" value="${vo.no}" />
			<br><br>
			<span id="brddelete" style="border: 3px solid black; cursor: pointer;">
				삭제하기
			</span>
			<span id="brdrewrite" style="border: 3px solid black; cursor: pointer;">
				수정하기
			</span>
		</form>
	</body>
</html>