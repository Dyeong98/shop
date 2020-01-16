<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>brdwrite</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="./resources/ckeditor/ckeditor.js"></script>
		<script type="text/javascript">
			$(document).ready(function() {
				$("#brdinsertBtn").click(function() {
					var contents = CKEDITOR.instances.contents.getData();
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
					if(contents == ""){
						alert("내용을 입력해주세요.");
						$("#contents").focus();
						return;
					}
					var goYN = confirm("글을 작성하시겠습니까?");
					if (goYN == false) {
						return;
					}
					
					$.post(
							"./brdinsert"
							,{
								title:$("#title").val(),
								writer:$("#writer").val(),
								contents:contents
							}
							,function(data, status){
								if (status == "success") {
									if (data > 0) {
										alert("글이 저장되었습니다.");
										location.href = "./brdlist";
									}else{
										alert("잠시 후, 다시 시도해주십시오.");
									}
								}else{
									alert("관리자에게 문의하세요.");
								}
							}
					);
				});
			});
		</script>
	</head>
	<body>
		<h1>게시글 쓰기</h1>
		<table border="1">
			<colgroup>
			</colgroup>
			<tbody>
				<tr>
					<th>제목</th>
					<td><input type="text" id="title" name="title"/></td>
				</tr>
				<tr>
					<th>작성자</th>
					<td><input type="text" id="writer" name="writer"/></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea id="contents" name="contents"></textarea></td>
				</tr>
			</tbody>
		</table>
		<button id="brdinsertBtn">등록</button>
		<script>
			CKEDITOR.replace("contents",{
				height: 800,
				width: 1000
			});
		</script>
	</body>
</html>