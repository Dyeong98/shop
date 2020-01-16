<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>freeBrdList</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	</head>
	<body>
		<%@include file="./topmenu.jsp" %>
		<h1>자유게시판</h1>
		<table border="1">
			<colgroup>
				<col width="5%">
				<col width="40%">
				<col width="20%">
				<col width="5%">
				<col width="5%">
				<col width="5%">
			</colgroup>
			<thead>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회</th>
				<th>좋아요</th>
			</thead>
			<tbody id="tb" style="text-align: center;">
				<c:forEach var="vo" items="${list}">
					<tr>
						<td>${vo.getNo()}</td>
						<td>${vo.getTitle()}</td>
						<td>${vo.getWriter()}</td>
						<td>${vo.getWrite_date()}</td>
						<td>${vo.getView_cnt()}</td>
						<td>${vo.getLike_cnt()}</td>
					</tr>					
				</c:forEach>
			</tbody>
		</table>
		<br><br>
		<a href="./freeBrdWrite"><button>게시글 작성</button></a>
	</body>
</html>