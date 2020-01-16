<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>brd_detail</title>
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
		$("#delBrd").click(function(){
			var goYN = confirm("글을 삭제 하시겠습니까?");
			if(goYN == false){
				return;
			}

			$.post(
					"./delbrdfree"
					,{no:$("#hidNo").val()
						, write_mbr_no:$("#hidMbrNo").val()
						, atch_file_nm:$("#hidAtchFileNm").val()
					}
					,function(data, status) {
						if(status == "success") {
							if(data > 0) {
								alert("게시글을 삭제 하였습니다.");
								location.href="./brdfreelist";
							} else if(data == -1){
								alert("삭제할 수 없는 게시글 입니다.");
							} else {
								alert("잠시 후 다시 시도해 주세요.");
							}
						} else {
							alert("시스템 관리자에게 문의 바랍니다.");
						}//if
					}
			);//post
		});//click

		$("#brdLike").click(function(){
			$.post(
					"./updbrdfreelikecnt"
					,{no:$("#hidNo").val()}
					,function(data,status){
						if(status == "success"){
							if(data > 0){
								$("#brdLikeCnt").text(data);
							} else if(data == -1){
								alert("로그인 해 주세요.");
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
			<h2 style="text-align:center;">게시글 상세</h2>
			<hr width="100%" align="center">
			<table width="100%">
				<colgroup>
					<col width="30%">
					<col width="70%">
				</colgroup>
				<tr>
					<th>번호</th>
					<td>${brd_detail_vo.no}</td>
				</tr>
				<tr>
					<th>제목</th>
					<td>${brd_detail_vo.title}</td>
				</tr>
				<tr>
					<th>작성자</th>
					<td>${brd_detail_vo.writer}</td>
				</tr>
				<tr>
					<th>작성일</th>
					<td>${brd_detail_vo.write_date}</td>
				</tr>
				<tr>
					<th>내용</th>
					<td>${brd_detail_vo.contents}</td>
				</tr>
				<c:if test="${brd_detail_vo.atch_file_nm != null}">
					<tr>
						<th>첨부 파일</th>
						<td class="amagenta">
							<a href="./fileDownload?fn=${brd_detail_vo.atch_file_nm_summary}&fp=${brd_detail_vo.atch_file_nm}">
								${brd_detail_vo.atch_file_nm_summary}
							</a>
						</td>
					</tr>
				</c:if>
				<tr>
					<th>조회수</th>
					<td>${brd_detail_vo.view_cnt}</td>
				</tr>
				<tr>
					<th>좋아요</th>
					<td>
						<span id="brdLikeCnt">${brd_detail_vo.like_cnt}</span>
						<span id="brdLike"><font color="red">♥</font></span>
					</td>
				</tr>
			</table>
			<input type="hidden" id="hidNo" value="${brd_detail_vo.no}" />
			<input type="hidden" id="hidMbrNo" value="${brd_detail_vo.write_mbr_no}" />
			<input type="hidden" id="hidAtchFileNm" value="${brd_detail_vo.atch_file_nm}" />
			<hr width="100%" align="center">
			<c:if test="${usrSesn != null && usrSesn.mbr_no == brd_detail_vo.write_mbr_no}">
				<h3 style="text-align:right;">
					<span id="delBrd" class="ablack" style="border:1px solid green;border-radius:5px;cursor:pointer;">
						게시글 삭제 하기
					</span>
					&nbsp;
					<span id="updBrd" class="ablack" style="border:1px solid green;border-radius:5px;cursor:pointer;">
						<a href="./brdfreemodify?no=${brd_detail_vo.no}">게시글 수정 하기</a>
					</span>
				</h3>
			</c:if>
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
