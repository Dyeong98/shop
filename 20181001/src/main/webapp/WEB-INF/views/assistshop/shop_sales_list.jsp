<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>shop_sales_list.jsp</title>
    	<link href="./resources/bootstrap-3.3.2-dist/css/bootstrap.min.css" rel="stylesheet">
    	<link href="./resources/assistshop/css/shop_table.css" rel="stylesheet">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    	<script src="./resources/bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>
	</head>
	<body>
		<%@include file="./shop_menu.jsp" %>
		<div class="container contents_padding_top" id="main_contents">
			<div class="row">
				<div class="col-xs-12 col-sm-12">
					<div class="text-center">
						<button type="button" class="btn btn-default">전체보기</button>
						<div class="btn-group">
							<button type="button" class="btn btn-default">주문접수단계</button>
							<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
									<span class="caret"></span>
									<span class="sr-only">Toggle Dropdown</span>
							</button>
							<ul class="dropdown-menu" role="menu">
								<li><a href="#">입금전</a></li>
								<li><a href="#">입금확인중</a></li>
							</ul>
						</div>
						<div class="btn-group">
							<button type="button" class="btn btn-default">배송전/구매취소</button>
							<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
									<span class="caret"></span>
									<span class="sr-only">Toggle Dropdown</span>
							</button>
							<ul class="dropdown-menu" role="menu">
								<li><a href="#">배송전</a></li>
								<li><a href="#">배송준비중</a></li>
								<li><a href="#">구매취소</a></li>
								<li><a href="#">구매취소완료</a></li>
							</ul>
						</div>
						<div class="btn-group">
							<button type="button" class="btn btn-default">배송중/구매완료</button>
							<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
									<span class="caret"></span>
									<span class="sr-only">Toggle Dropdown</span>
							</button>
							<ul class="dropdown-menu" role="menu">
								<li><a href="#">배송중</a></li>
								<li><a href="#">구매완료</a></li>
							</ul>
						</div>
						<div class="btn-group">
							<button type="button" class="btn btn-default">반품/환불</button>
							<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
									<span class="caret"></span>
									<span class="sr-only">Toggle Dropdown</span>
							</button>
							<ul class="dropdown-menu" role="menu">
								<li><a href="#">반품요청</a></li>
								<li><a href="#">반품완료</a></li>
								<li><a href="#">환불요청</a></li>
								<li><a href="#">환불완료</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<hr>
			<div class="row">
				<div class="col-xs-12 col-sm-12">
					<form class="form-horizontal">
						<div class="form-group">
							<label for="product_list_sort" class="col-xs-12 col-sm-2 control-label">제품분류</label>
							<div class="col-xs-12 col-sm-10">
								<div class="row">
									<div class="col-xs-12 col-sm-4">
										<label for="product_list_sort_1" class="control-label">대분류</label>
										<select class="form-control" id="product_list_sort1">
											<option>Top</option>
											<option>Outer</option>
											<option>One piece</option>
											<option>bottom</option>
											<option>shoes</option>
											<option>Under wear</option>
											<option>Bag</option>
										</select>
									</div>
									<div class="col-xs-12 col-sm-4">
										<label for="product_list_sort_2" class="control-label">중분류</label>
										<select class="form-control" id="product_list_sort_2">
											<option>반팔 티셔츠</option>
											<option>긴팔 티셔츠</option>
											<option>민소매 티셔츠</option>
											<option>니트/스웨터</option>
											<option>셔츠/블라우스</option>
										</select>
									</div>
									<div class="col-xs-12 col-sm-4">
										<label for="product_list_sort_3" class="control-label">소분류</label>
										<select class="form-control" id="product_list_sort_3">
											<option>니트</option>
											<option>스웨터</option>
										</select>
									</div>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label for="product_list_date1" class="col-xs-12 col-sm-2 control-label">주문일</label>
							<div class="col-xs-2 col-sm-2">
								<input type="date" class="form-control" id="product_list_date1">
							</div>
							<div class="col-xs-1 col-sm-1">
								<span>~</span>
							</div>
							<div class="col-xs-2 col-sm-2">
								<input type="date" class="form-control" id="product_list_date2">
							</div>
						</div>
						<div class="form-group">
							<label for="product_list_search_option" class="col-xs-12 col-sm-2 control-label">조건검색</label>
							<div class="col-xs-12 col-sm-10">
								<div class="row">
									<div class="col-xs-6 col-sm-3">
										<select class="form-control" id="product_list_search_option">
											<option>주문번호</option>
											<option>구매자ID</option>
											<option>구매자</option>
											<option>수령인</option>
										</select>
									</div>
									<div class="col-xs-6 col-sm-9">
										<input type="text" class="form-control" id="product_list_search" placeholder="">
									</div>
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-10">
								<button type="submit" class="btn btn-default">조회</button>
							</div>
						</div>
					</form>
				</div>
			</div>
			<hr>
			<div class="row">
				<div class="col-xs-12 col-sm-12">
					<table class="table table-bordered">
						<thead>
							<tr class="text-center">
								<th>주문번호</th>
								<th>상품명</th>
								<th>구매자정보</th>
								<th>판매자</th>
								<th>구매가격</th>
								<th>현재상태</th>
								<th>주문일</th>
								<th>관리자메뉴</th>
						    </tr>
						</thead>
						<tbody>
							<c:forEach begin="0" end="9" step="1" varStatus="status">
								<tr class="text-center" id="table_vertical_middle">
									<td>${status.count}</td>
									<td>사탕</td>
									<td>
										<div>
											<p>구매자 ID : spark / 받는분 : 김동영 </p>
										</div>
									</td>
									<td>김동영</td>
									<td>300원</td>
									<td>김동영</td>
									<td>2018.11.09 14:17:08</td>
									<td>
										<a class="btn btn-default" id="product_size_add_row" role="button">수정</a>
										<a class="btn btn-default" id="product_size_add_row" role="button">삭제</a>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<div class="rows">
				<div>
						<button class="btn btn-default text-center">제출</button>
				</div>
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
							<li><a href="#" class="active">1</a></li>
							<li><a href="#">2</a></li>
							<li><a href="#">3</a></li>
							<li><a href="#">4</a></li>
							<li><a href="#">5</a></li>
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
