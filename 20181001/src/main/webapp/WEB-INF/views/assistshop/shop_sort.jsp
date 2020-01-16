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
		<link href="./resources/assistshop/css/shop_sort.css" rel="stylesheet">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    	<script src="./resources/bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>
    	<script src="./resources/assistshop/js/shop_sort.js"></script>
	</head>
	<body>
		<%@include file="./shop_menu.jsp" %>
		<div class="container contents_padding_top" id="main_contents">
			<div class="row">
				<div class="col-xs-12 col-sm-12">
					<ul class="nav nav-pills nav-justified" id="sort_nav">
						<li role="presentation" class="active" style="white-space:pre;"><a href="#" onclick="ptn2Fun(0);">전체 보기<br><span class="badge">${totalCnt}</span></a></li>
						<c:forEach var="vo" items="${SortTypeList}" varStatus="status">
							<li role="presentation" class="" style="white-space:pre;"><a href="#" onclick="ptn2Fun(${vo.ptt_type2_no})">${vo.ptt_type2_nm}<br><span class="badge">${vo.typecnt}</span></a></li>
						</c:forEach>
					</ul>
				</div>
			</div>
			<hr>
			<div class="row">
				<div class="col-xs-12 col-sm-12">
					<div class="text-center">
						<h2>${SortTypeList[0].ptt_type1_nm}</h2>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-xs-3 col-xs-offset-9">
					<select class="form-control" id="sort_type_sel" name="sort_type_sel">
						<option value="0" selected="selected">신상품</option>
						<option value="1">인기순</option>
						<option value="2">조회수</option>
						<option value="3">높은가격</option>
						<option value="4">낮은가격</option>
					</select>
				</div>
			</div>
			<hr>
			<div class="row" id="product_list">
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
								<li><a href="#" onclick="pageFun(${stsuts.index});" class="">${stsuts.index}</a></li>
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
			<form action="./shop_sort" id="sort_form" name="sort_form">
				<input type="hidden" id="ptn1" name="ptn1" value="${ptn1}"/>
				<input type="hidden" id="ptn2" name="ptn2" value="${ptn2}"/>
				<input type="hidden" id="sort_type" name="sort_type" value="${sort_type}"/>
			</form>
		</div>
	</body>
</html>
