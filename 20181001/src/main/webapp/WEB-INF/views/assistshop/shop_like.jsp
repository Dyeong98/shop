<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>shop_list.jsp</title>
    	<link href="./resources/bootstrap-3.3.2-dist/css/bootstrap.min.css" rel="stylesheet">
    	<link href="./resources/assistshop/css/shop_table.css" rel="stylesheet">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    	<script src="./resources/bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>
	</head>
	<body>
		<%@include file="./shop_menu.jsp" %>
		<div class="container contents_padding_top" id="main_contents">
			<form>
				<table class="table table-bordered">
					<thead>
						<tr class="text-center">
							<th>
								<div class="checkbox">
							        <label>
							        	<input type="checkbox" value="1">
							        </label>
					        	</div>
					        </th>
							<th>상품</th>
							<th>상품정보</th>
							<th>판매금액</th>
							<th>할인률</th>
							<th>할인금액</th>
							<th>판매자</th>
							<th>배송비</th>
					    </tr>
					</thead>
					<tbody>
						<c:forEach begin="0" end="9" step="1" varStatus="status">
							<tr class="text-center" id="table_vertical_middle">
								<td class="form-group"><input type="checkbox" value="check"></td>
								<td><img src="./upload/123.jpg" alt="" class="img-rounded"></td>
								<td>사탕</td>
								<td>300원</td>
								<td>10%</td>
								<td>30원</td>
								<td>김동영</td>
								<td style="vertical-align: middle;">2500</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="rows">
					<div>
 						<button class="btn btn-default text-center">제출</button>
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
