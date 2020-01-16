<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>brd list</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>
	<%@ include file="../topmenu.jsp" %>
	<div class="row">
		<div class="column">
			<h2></h2>
			<p>
			</p>
		</div>
		<div class="column">
			<h2 style="text-align:center;">게시글 목록</h2>
			<hr width="100%" align="center">
			<table width="100%">
				<colgroup>
					<col width="100px">
					<col width="200px">
					<col width="200px">
					<col width="200px">
					<col width="100px">
					<col width="100px">
				</colgroup>
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>조회수</th>
						<th>좋아요</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="vo" items="${brd_list}" varStatus="status">
						<tr>
							<td>${vo.no}</td>
							<td class="amagenta">
								<c:choose>
									<c:when test="${usrSesn != null && usrSesn.mbr_no != ''}">
										<a href="./brdfreedetail?no=${vo.no}">${vo.title}</a>
									</c:when>
									<c:otherwise>
										<a href="javascript:alert('로그인 해 주세요.');">${vo.title}</a>									</c:otherwise>
								</c:choose>
							</td>
							<td>${vo.writer}</td>
							<td>${vo.write_date}</td>
							<td>${vo.view_cnt}</td>
							<td>${vo.like_cnt}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<hr width="100%" align="center">
			<h3 class="ablack" style="text-align:center;">
				<c:forEach begin="1" end="${pagingEnd}" step="1" varStatus="stsuts">
					<c:choose>
						<c:when test="${page == stsuts.index}">
							<a href="./brdfreelist?page=${stsuts.index}"><font color="red">${stsuts.index}</font></a>
						</c:when>
						<c:otherwise>
							<a href="./brdfreelist?page=${stsuts.index}">${stsuts.index}</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</h3>
			<c:if test="${usrSesn != null && usrSesn.mbr_no != ''}">
				<h3 style="text-align:right;">
					<span class="ablack" style="border:1px solid green;border-radius:5px;cursor:pointer;">
						<a href="./brdfreewrite">게시글 쓰러 가기</a>
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
