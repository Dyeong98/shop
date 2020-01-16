<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>first.jsp</title>
	</head>
	<body>
		<h1>잘 도착했음</h1>
		<c:forEach begin="2" end="9" step="1" var="num">${num}</c:forEach>
		<br>
		<c:forEach var="no" items="${brd_list}" varStatus="status">${status.index} : ${vo.brd_no} ${vo.getBrd_tatle()} ${vo.getBrd_writer()} ${vo.getBrd_contents()}</c:forEach>
	</body>
</html>