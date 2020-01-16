<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>shop_cart.jsp</title>
    	<link href="./resources/bootstrap-3.3.2-dist/css/bootstrap.min.css" rel="stylesheet">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    	<script src="./resources/bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>
    	<script src="./resources/assistshop/js/shop_cart.js"></script>
	</head>
	<body>
		<%@include file="./shop_menu.jsp" %>
		<div class="container contents_padding_top" id="main_contents">
			<form id="cartForm" method="post">
				<table class="table table-bordered">
					<thead>
						<tr>
							<th class="text-center" style="vertical-align: middle;">
								<div class="checkbox">
							        <label>
							        	<input type="checkbox" id="allChk" value="1">
							        </label>
					        	</div>
					        </th>
							<th class="text-center" style="vertical-align: middle;">상품</th>
							<th class="text-center" style="vertical-align: middle;">색상 | 사이즈 | 수량</th>
							<th class="text-center" style="vertical-align: middle;">상품가격</th>
							<th class="text-center" style="vertical-align: middle;">배송비</th>
							<th class="text-center" style="vertical-align: middle;">주문금액</th>
					    </tr>
					</thead>
					<tbody>
						<c:forEach var="vo" items="${list}">
							<tr>
								<td class="form-group text-center" style="vertical-align: middle;"><input type="checkbox" name="rowChk" value="${vo.sct_no}"></td>
								<td class="text-center" style="vertical-align: middle;"><a href="./shop_detail?no=${vo.spt_no}"><img src="${vo.spt_thumbnail}" alt="..." class="img-thumbnail img-responsive" style="max-height: 60px;"> ${vo.spt_name}</a></td>
								<td class="text-center" style="vertical-align: middle;">${vo.sct_color} | ${vo.sct_size} | ${vo.spt_count}</td>
								<td class="text-center" style="vertical-align: middle;">${vo.spt_price}</td>
								<td class="text-center" style="vertical-align: middle;">${vo.spt_delivery_price}</td>
								<td class="text-center" style="vertical-align: middle;">${vo.sct_price}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="rows">
					<div class="col-xs-1">
 						<button type="button" class="btn btn-default text-center" id="cart_delBtn">삭제</button>
					</div>
					<div class="col-xs-1 col-xs-offset-10">
 						<button type="button" class="btn btn-primary text-center" id="cart_orderBtn">구매하기</button>
					</div>
				</div>
			</form>
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
		</div>
	</body>
</html>
