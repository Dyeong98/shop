<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>shop_main.jsp</title>
    	<link href="./resources/bootstrap-3.3.2-dist/css/bootstrap.min.css" rel="stylesheet">
    	<link href="./resources/assistshop/css/shop_main.css" rel="stylesheet">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    	<script src="./resources/bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>
	</head>
	<body>
		<%@include file="./shop_menu.jsp" %>
		<div class="" id="main_contents">
			<div id="shop_main_banner" class="carousel slide" data-ride="carousel">
				<ol class="carousel-indicators">
					<li data-target="#shop_main_banner" data-slide-to="0" class="active"></li>
					<li data-target="#shop_main_banner" data-slide-to="1" class=""></li>
					<li data-target="#shop_main_banner" data-slide-to="2" class=""></li>
					<li data-target="#shop_main_banner" data-slide-to="3" class=""></li>
				</ol>
				<div class="carousel-inner" role="listbox">
					<div class="item active">
						<img class="first-slide" src="./upload/main1.jpg" alt="" style="margin: auto;">
							<div class="container">
							<div class="carousel-caption">
							</div>
						</div>
					</div>
					<div class="item ">
						<img class="second-slide" src="./upload/main2.jpg" alt="" style="margin: auto;">
						<div class="container">
							<div class="carousel-caption">
							</div>
						</div>
					</div>
					<div class="item">
						<img class="third-slide" src="./upload/main3.jpg" alt="" style="margin: auto;">
						<div class="container">
							<div class="carousel-caption">
							</div>
						</div>
					</div>
					<div class="item">
						<img class="third-slide" src="./upload/main4.jpg" alt="" style="margin: auto;">
						<div class="container">
							<div class="carousel-caption">
<!-- 								<h1>세번째 이미지</h1> -->
<!-- 								<p>세번째 이미지</p> -->
<!-- 								<p><a class="btn btn-lg btn-primary" href="" role="button">자세히</a></p> -->
							</div>
						</div>
					</div>
				</div>
				<a class="left carousel-control" href="#shop_main_banner" role="button" data-slide="prev">
					<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
					<span class="sr-only">Previous</span>
				</a>
				<a class="right carousel-control" href="#shop_main_banner" role="button" data-slide="next">
					<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
					<span class="sr-only">Next</span>
				</a>
	    	</div>
		</div>
		<div class="container" id="main_contents">
			<div class="row">
				<div class="col-xs-12 col-sm-12">
					<div class="row">
						<h2 class="text-center">NEW</h2>
						<hr>
					</div>
					<div class="row">
						<c:forEach var="vo" items="${list}">
							<div class="col-xs-6 col-sm-3">
								<div class="panel panel-default text-center" style="height: 400px;">
									<div class="panel-body">
										<p>
											<a href="./shop_detail?no=${vo.spt_no}">
												<img src="${vo.spt_thumbnail}" alt="..." class="img-thumbnail img-responsive" style="max-height: 250px;">
											</a>
										</p>
										<p style="text-overflow: ellipsis; width: 230px; display: inline-block; overflow: hidden; white-space: nowrap;">${vo.spt_name}</p>
										<p>${vo.spt_price}원</p>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
					<div class="row">
						<div class="col-xs-12 col-sm-12">
							<nav class="text-center">
								<ul class="pagination">
									<li>
										<a href="#" aria-label="Previous">
											<span aria-hidden="true">&laquo;</span>
										</a>
									</li>
									<c:forEach begin="1" end="${pagingEnd}" step="1" varStatus="stsuts">
										<li><a href="./shop_main?page=${ptn1}" class="">${stsuts.index}</a></li>
									</c:forEach>
									<li>
									<a href="#" aria-label="Next">
									<span aria-hidden="true">&raquo;</span>
									</a>
									</li>
								</ul>
							</nav>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
