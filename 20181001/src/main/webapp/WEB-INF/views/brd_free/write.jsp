<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>brd_write</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="./resources/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
	if(${usrSesn == null || usrSesn.mbr_no == ""}){
		alert("로그인 해 주세요.");
		location.href="./brdfreelist";
	}
</script>
</head>
<body>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#insBrd").click(function(){
				if($.trim($("#title").val()) == ""){
					alert("제목을 확인 하세요.");
					$("#title").focus();
					return;
				}
				if($.trim($("#writer").val()) == ""){
					alert("작성자를 확인 하세요.");
					$("#writer").focus();
					return;
				}
				var cnts = CKEDITOR.instances.contents;
				if(cnts.getData() == ""){
					alert("내용을 확인 하세요.");
					cnts.focus();
					return;
				}

				var goYN = confirm("글을 입력 하시겠습니까?");
				if(goYN == false){
					return;
				}

				var form = new FormData(document.getElementById("write_form"));
				form.append('write_mbr_no',$("#hidMbrNo").val());
				form.append('contents',cnts.getData());
				$.ajax({
					url:"./insbrdfree"
					, data:form
					, dataType:'json'
					, processData:false
					, contentType:false
					, type:'POST'
					, success:function(result){
						if(result > 0){
							alert("글이 저장되었습니다.");
							location.href="./brdfreelist";
						} else {
							alert("잠시 후, 다시 시도해 주세요.");
						}
					}
					, error:function(xhr){
						alert("시스템 관리자에게 문의 바랍니다.");
					}
				});//ajax

// 				$.post(
// 						"./insbrdfree"
// 						,{	title:$("#title").val()
// 							, writer:$("#writer").val()
// 							, contents:cnts.getData()
// 							, write_mbr_no:${usrSesn.mbr_no}
// 						}
// 						,function(data,status){
// 							if(status == "success"){
// 								if(data > 0){
// 									alert("글이 저장되었습니다.");
// 									location.href="./brdfreelist";
// 								} else {
// 									alert("잠시 후, 다시 시도해 주세요.");
// 								}
// 							} else {
// 								alert("시스템 관리자에게 문의 바랍니다.");
// 							}
// 						}
// 				);//post

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
			<h2 style="text-align:center;">게시글 쓰기</h2>
			<hr width="100%" align="center">
			<form id="write_form" name="write_form">
			<table width="100%">
				<colgroup>
					<col width="30%">
					<col width="70%">
				</colgroup>
				<tr>
					<th>제목</th>
					<td><input type="text" maxlength="50"
							id="title" name="title"
							style="width:100%" /></td>
				</tr>
				<tr>
					<th>작성자</th>
					<td><input type="text" maxlength="10"
							id="writer" name="writer"
							style="width:100%;background-color:lightgray;"
							readonly="readonly"
							value="${usrSesn.mbr_id}" /></td>
				</tr>
				<tr>
					<th>내용</th>
					<td>
						<textarea rows="10" maxlength="1000"
							id="contents" name="contents"
							style="width:100%;resize:none;"></textarea>
						<script>
							CKEDITOR.replace('contents',{
								filebrowserUploadUrl:'./ckupload'
							});
						</script>
					</td>
				</tr>
				<tr>
					<th>파일 첨부</th>
					<td><input type="file" id="atch_file" name="atch_file"
							style="width:100%" /></td>
				</tr>
			</table>
			</form>
			<input type="hidden" id="hidMbrNo" value="${usrSesn.mbr_no}" />
			<hr width="100%" align="center">
			<h3 style="text-align:right;">
				<span id="insBrd" class="ablack" style="border:1px solid green;border-radius:5px;cursor:pointer;">
					게시글 저장 하기
				</span>
			</h3>
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
