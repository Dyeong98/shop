<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>shop_sort.jsp</title>
    	<link href="./resources/bootstrap-3.3.2-dist/css/bootstrap.min.css" rel="stylesheet">
		<link href="./resources/assistshop/css/shop_search.css" rel="stylesheet">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    	<script src="./resources/bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>
	</head>
	<body>
		<%@include file="./shop_menu.jsp" %>
		<div class="container contents_padding_top" id="main_contents">
			<div class="row">
				<div class="col-xs-12 col-sm-12">
				</div>
			</div>
			<hr>
			<div class="row">
				<div class="col-xs-12 col-sm-12">
					<div class="text-center" id="search_result_txt">
						<strong>${stxt}</strong>검색으로 <strong>${totalCnt}</strong>건의 제품이 검색되었습니다.
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-xs-12 col-sm-12">
					<div class="text-center">
		   				<form class="navbar-form navbar-right" id="nav_search_form" name="nav_search_form" action="./shop_search">
							<div class="form-group" id="nav_search_txt">
								<div class="input-group">
									<input type="text" placeholder="search" class="form-control" id="stxt" name="stxt">
								    <span class="input-group-btn">
										<button type="submit" class="btn btn-success" id="nav_search_btn">
											<span class="glyphicon glyphicon-search"></span>
										</button>
								    </span>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-xs-3 col-xs-offset-9">
					<select class="form-control">
						<option>신상품</option>
						<option>판매량</option>
						<option>조회수</option>
						<option>높은가격</option>
						<option>낮은가격</option>
					</select>
				</div>
			</div>
			<hr>
			<div class="row">
				<c:forEach var="vo" items="${list}">
					<div class="col-xs-6 col-sm-3">
						<div class="panel panel-default text-center" style="height: 350px;">
							<div class="panel-body">
								<p><a href="./shop_detail?no=${vo.spt_no}"><img src="${vo.spt_thumbnail}" alt="..." class="img-thumbnail img-responsive" style="max-height: 250px;"></a></p>
								<p style="text-overflow: ellipsis; width: 230px; display: inline-block; overflow: hidden; white-space: nowrap;">${vo.spt_name}</p>
								<p>${vo.spt_price}원</p>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
			<hr>
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
								<li><a href="./shop_sort?ptn1=2&page=${stsuts.index}" class="">${stsuts.index}</a></li>
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
	</body>
</html>
