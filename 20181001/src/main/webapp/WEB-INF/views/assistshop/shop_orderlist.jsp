<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>shop_orderlist.jsp</title>
    	<link href="./resources/bootstrap-3.3.2-dist/css/bootstrap.min.css" rel="stylesheet">
    	<link href="./resources/assistshop/css/shop_table.css" rel="stylesheet">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    	<script src="./resources/bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>
	</head>
	<body>
		<%@include file="./shop_menu.jsp" %>
		<div class="container contents_padding_top" id="main_contents">
			<table class="table table-bordered">
				<thead>
					<tr class="text-center">
						<th>번호</th>
						<th>상품정보</th>
						<th>주문일자</th>
						<th>주문번호</th>
						<th>결제금액</th>
						<th>주문상태</th>
				    </tr>
				</thead>
				<tbody>
					<c:forEach begin="0" end="9" step="1" varStatus="status">
						<tr class="text-center" id="table_vertical_middle">
							<td>${status.count}</td>
							<td><img src="./upload/123.jpg" alt="" class="img-rounded"></td>
							<td>2018.11.08</td>
							<td>20181108000001</td>
							<td>330원</td>
							<td>구매확정</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
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
