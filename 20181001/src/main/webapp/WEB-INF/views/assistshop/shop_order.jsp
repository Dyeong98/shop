<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>shop_detail.jsp</title>
    	<link href="./resources/bootstrap-3.3.2-dist/css/bootstrap.min.css" rel="stylesheet">
		<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    	<script src="./resources/bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>
    	<script src="./resources/assistshop/js/shop_order.js"></script>
	</head>
	<body>
		<%@include file="./shop_menu.jsp" %>
		<div class="container contents_padding_top" id="main_contents">
			<div class="row">
				<div class="col-xs-12 col-sm-12">
					<div class="row">
						<div class="col-xs-12 col-sm-10 col-sm-offset-2">
							<table class="table table-bordered">
								<thead>
									<tr class="text-center">
										<th class="text-center">상품</th>
										<th class="text-center">색상 | 사이즈</th>
										<th class="text-center">수량</th>
										<th class="text-center">상품금액</th>
										<th class="text-center">배송비</th>
										<th class="text-center">주문금액</th>
								    </tr>
								</thead>
								<tbody>
									<c:forEach var="vo" items="${list}">
										<tr>
											<td class="text-center" style="vertical-align: middle;"><img src="${vo.spt_thumbnail}" alt="..." class="img-thumbnail img-responsive" style="max-height: 60px;"> ${vo.spt_name}</td>
											<td class="text-center" style="vertical-align: middle;">${vo.sct_color} | ${vo.sct_size}</td>
											<td class="text-center" style="vertical-align: middle;">${vo.spt_count}</td>
											<td class="text-center" style="vertical-align: middle;">${vo.spt_price}</td>
											<td class="text-center" style="vertical-align: middle;">${vo.spt_delivery_price}</td>
											<td class="text-center" style="vertical-align: middle;">${vo.sct_price}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-12 col-sm-12">
							<form class="form-horizontal" id="orderForm">
								<div class="form-group">
									<label for="order_choice1" class="col-sm-2 control-label">배송지 선택</label>
									<div class="col-sm-10">
										<label class="radio-inline">
											<input type="radio" name="order_choice" id="order_choice1" value="0"> 직접입력
										</label>
										<label class="radio-inline">
											<input type="radio" name="order_choice" id="order_choice2" value="1"> 기본 배송지
										</label>
										<label class="checkbox-inline">
											<input type="checkbox" id="default_order" name="default_order" value="1"> 기본 배송지로 등록
										</label>
									</div>
								</div>
								<div class="form-group">
									<label for="order_name" class="col-sm-2 control-label">수령인/배송지</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" id="spo_name" name="spo_name" placeholder="Name">
									</div>
								</div>
								<div class="form-group">
									<label for="order_phone" class="col-sm-2 control-label">휴대전화</label>
									<div class="col-sm-10">
										<input type="text" id="spo_phone" name="spo_phone" class="form-control" placeholder="-없이 입력" required="" maxlength="11">
									</div>
								</div>
								<div class="form-group">
									<label for="order_addr1" class="col-sm-2 control-label">배송지 주소</label>
									<div class="col-sm-10">
										<div class="row">
											<div class="col-xs-2 col-sm-2">
												<input type="text" id="spo_post_code" name="spo_post_code" class="form-control" readonly="readonly">
											</div>
											<div class="col-xs-10 col-sm-10">
												<button type="button" class="btn btn-default" id="addrBtn">우편번호 찾기</button>
											</div>
										</div>
										<div class="row">
											<div class="col-xs-8 col-sm-8">
												<input type="text" id="spo_addr1" name="spo_addr1" class="form-control" readonly="readonly">
											</div>
											<div class="col-xs-4 col-sm-4">
												<input type="text" id="spo_addr2" name="spo_addr2" class="form-control" placeholder="상세주소">
											</div>
										</div>
									</div>
								</div>
								<div class="form-group">
									<label for="del_msg" class="col-sm-2 control-label">배송 메모</label>
									<div class="col-sm-10">
					 					<textarea class="form-control" rows="3" id="spo_msg" name="spo_msg"></textarea>
									</div>
									<p class="col-sm-10 col-sm-offset-2">택배기사님께 전할 말씀을 남겨주세요.</p>
								</div>
								<div class="form-group">
									<label for="order_payment1" class="col-sm-2 control-label">결제수단 선택</label>
									<div class="col-sm-10">
										<label class="radio-inline">
											<input type="radio" name="spo_payment" id="spo_payment1" value="card"> 신용 카드
										</label>
										<label class="radio-inline">
											<input type="radio" name="spo_payment" id="spo_payment2" value="deposit"> 무통장 입금
										</label>
									</div>
								</div>
								<div class="form-group">
									<label for="order_agree" class="col-sm-2 control-label">주문자 동의</label>
									<div class="col-sm-10">
				     				    <input type="checkbox" id="order_agreeChk" name="order_agreeChk"> 동의합니다.
					 					<textarea class="form-control" rows="3" id="order_agree" readonly="readonly">약관내용</textarea>
									</div>
								</div>
								<div class="form-group">
									<input type="hidden" id="user_no" name="user_no" value="${userSess.user_no}"/>
									<c:forEach var="vo" items="${list}">
										<input type="hidden" id="spt_no" name="spt_no" value="${vo.spt_no}"/>
										<input type="hidden" id="spt_thumbnail" name="spt_thumbnail" value="${vo.spt_thumbnail}"/>
										<input type="hidden" id="spt_name" name="spt_name" value="${vo.spt_name}"/>
										<input type="hidden" id="sct_color" name="sct_color" value="${vo.sct_color}"/>
										<input type="hidden" id="sct_size" name="sct_size" value="${vo.sct_size}"/>
										<input type="hidden" id="spt_count" name="spt_count" value="${vo.spt_count}"/>
										<input type="hidden" id="spt_price" name="spt_price" value="${vo.spt_price}"/>
										<input type="hidden" id="spt_delivery_price" name="spt_delivery_price" value="${vo.spt_delivery_price}"/>
										<input type="hidden" id="sct_price" name="sct_price" value="${vo.sct_price}"/>
										<input type="hidden" id="spt_seller_id" name="spt_seller_id" value="${vo.spt_seller_id}"/>
										<input type="hidden" id="sct_no" name="sct_no" value="${vo.sct_no}"/>
									</c:forEach>
								</div>
								<div class="form-group">
									<div class="col-sm-offset-4 col-sm-2">
										<button class="btn btn-default btn-block">취소</button>
									</div>
									<div class="col-sm-2">
										<button type="button" class="btn btn-primary btn-block" id="order_paymentBtn">결제하기</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
