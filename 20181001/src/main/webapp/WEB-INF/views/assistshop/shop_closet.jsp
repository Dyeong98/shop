<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>shop_closet.jsp</title>
    	<link href="./resources/bootstrap-3.3.2-dist/css/bootstrap.min.css" rel="stylesheet">
		<link href="./resources/assistshop/css/shop_closet.css" rel="stylesheet">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    	<script src="./resources/bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>
    	<script src="./resources/assistshop/js/shop_closet.js"></script>
	</head>
	<body>
		<%@include file="./shop_menu.jsp" %>
		<div class="container contents_padding_top" id="main_contents">
			<div class="row">
				<div class="col-xs-10 col-sm-10">
					<img src="./upload/closet/1808907353_0000010.jpg" class="drag"><br>
					<img src="./upload/closet/hmprod.jpg" class="drag"><br>
				</div>
				<div class="col-xs-2 col-sm-2">
					<div class="row">
						<div class="col-xs-12 col-sm-12">
							<p>내 옷장</p>
						</div>
					</div>
					<div class="row">
						<c:forEach begin="0" end="9" step="1" varStatus="status">
							<div class="col-xs-12 col-sm-6">
								<div class="panel panel-default text-center">
									<div class="panel-body">
										<p><a href="./shop_detail"><img src="./upload/jelly.jpg" alt="..." class="img-thumbnail img-responsive"></a></p>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
					<div class="row">
						<div class="col-xs-6 col-sm-6">
 							<button class="btn btn-default text-center">삭제</button>
						</div>
						<div class="col-xs-6 col-sm-6">
 							<button class="btn btn-default text-center">등록</button>
						</div>
					</div>
					<hr>
					<div class="row">
						<div class="col-xs-12 col-sm-12">
							<p>찜목록</p>
						</div>
					</div>
					<div class="row">
						<c:forEach begin="0" end="9" step="1" varStatus="status">
							<div class="col-xs-12 col-sm-6">
								<div class="panel panel-default text-center">
									<div class="panel-body">
										<p><a href="./shop_detail"><img src="./upload/jelly.jpg" alt="..." class="img-thumbnail img-responsive"></a></p>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>