<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>jdbctest1</title>
	</head>
	<body>
		<h1>jsp�� ���ǵ� �κ�</h1>
		<h1>controller���� ���޵� �κ� : ${name}</h1>
		<c:set var="listfromjava" value="${list}"/>
		<h1>${listfromjava}</h1>
		<c:forEach var="vo" items="${listfromjava}">${vo.getBrd_no()} ${vo.getBrd_tatle()} </c:forEach>
	</body>
</html>