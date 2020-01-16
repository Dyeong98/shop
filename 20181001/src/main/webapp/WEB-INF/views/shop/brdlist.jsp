<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>brdlist</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	</head>
	<body>
		<h1>게시판목록</h1>
		<table border="1">
			<colgroup>
				<col width="5%">
				<col width="60%">
				<col width="15%">
				<col width="10%">
				<col width="5%">
				<col width="5%">
			</colgroup>
			<thead>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
				<th>좋아요</th>
			</thead>
			<tbody align="center">
				<c:forEach var="vo" items="${list}">
					<tr>
						<td>${vo.no}</td>
						<td><a href="./brddetail?no=${vo.no}">${vo.title}</a></td>
						<td>${vo.writer}</td>
						<td>${vo.write_date}</td>
						<td>${vo.view_cnt}</td>
						<td>${vo.like_cnt}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<h1>
			<c:forEach begin="1" end="${pagingEnd}" step="1" varStatus="stsuts">
				<a href="/lnssoft/brdlist?page=${stsuts.index}">${stsuts.index}</a>
			</c:forEach>
		</h1>
		<a href="./brdwrite"><h1>글쓰러 가기</h1></a>
	</body>
</html>