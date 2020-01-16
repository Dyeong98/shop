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
		<link href="./resources/assistshop/css/shop_detail.css" rel="stylesheet">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    	<script src="./resources/bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>
    	<script src="./resources/assistshop/js/shop_detail.js"></script>
	</head>
	<body>
		<%@include file="./shop_menu.jsp" %>
		<div class="container contents_padding_top" id="main_contents">
			<div class="row">
				<div class="col-xs-12 col-sm-12">
					<div class="row">
						<div class="col-xs-12 col-sm-6">
							<img src="${pvo.spt_thumbnail}" alt="..." class="img-rounded img-responsive">
						</div>
						<div class="col-xs-12 col-sm-6">
							<div class="row">
								<div class="col-xs-12 col-sm-12">
									<div class="form_contents_margin">
										<span>${pvo.spt_name}</span>
									</div>
								</div>
								<div class="col-xs-12 col-sm-12">
									<div class="form_contents_margin">
										<span>판매가 : </span>
										<span>${pvo.spt_price}</span>
										<span>원</span>
									</div>
								</div>
								<div class="form_contents_margin">
									<div class="col-xs-12 col-sm-12">
										<span>배송정보 : </span>
										<span>${pvo.spt_delivery_price}</span>
										<span>원</span>
									</div>
								</div>
								<form class="form-join" id="order_form" method="post">
									<div class="col-xs-12 col-sm-12">
										<div class="form-group form_contents_margin">
											<div class="" id="detailOptionColor">
												<label for="detailColor">색상</label>
												<select class="form-control" id="detailColor" name="sct_color">
													<option value="0">색상</option>
													<c:forEach var="vo" items="${clist}">
														<option value="${vo.spc_color}">${vo.spc_color}</option>
													</c:forEach>
												</select>
											</div>
											<div class="" id="detailOptionSize">
												<label for="detailSize">사이즈</label>
												<select class="form-control" id="detailSize" name="sct_size">
													<option value="0">사이즈</option>
													<c:forEach var="vo" items="${slist}">
														<option value="${vo.sps_size}">${vo.sps_size}</option>
													</c:forEach>
												</select>
											</div>
											<div class="" id="detailOptionQuantity">
												<label for="detailQuantity">수량</label>
												<input type="number" id="detailQuantity" name="spt_count" class="form-control" >
											</div>
										</div>
									</div>
									<input type="hidden" id="user_no" name="user_no" value="${userSess.user_no}"/>
									<input type="hidden" id="spt_no" name="spt_no" value="${pvo.spt_no}"/>
									<input type="hidden" id="spt_thumbnail" name="spt_thumbnail" value="${pvo.spt_thumbnail}"/>
									<input type="hidden" id="spt_name" name="spt_name" value="${pvo.spt_name}"/>
									<input type="hidden" id="spt_price" name="spt_price" value="${pvo.spt_price}"/>
									<input type="hidden" id="spt_delivery_price" name="spt_delivery_price" value="${pvo.spt_delivery_price}"/>
									<input type="hidden" id="spt_seller_id" name="spt_seller_id" value="${pvo.spt_seller_id}"/>
								</form>
								<div class="col-xs-12 col-sm-6">
									<div class="form_contents_margin">
										<button class="btn btn-lg btn-default btn-block" id="detailCartBtn">장바구니</button>
									</div>
								</div>
								<div class="col-xs-12 col-sm-6">
									<div class="form_contents_margin">
										<button class="btn btn-lg btn-primary btn-block" id="detailOrderBtn">구매하기</button>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-12 col-sm-12">
							<div class="form_contents_margin">
								<table class="table table-bordered">
									<thead>
										<tr class="text-center">
												<th>사이즈</th>
											<c:forEach var="vo" items="${stypelist}" varStatus="vs">
												<th><input type="hidden" name="diff_range_${vs.index}" value="5"/>${vo.stt_size_nm}</th>
											</c:forEach>
									    </tr>
									</thead>
									<tbody>
										<tr>
											<th>my</th>
											<c:if test="${uslist ne null and uslist[0].user_no != ''}">
												<c:forEach var="vo" items="${uslist}">
													<td class="user_size">${vo.user_size}</td>
												</c:forEach>
											</c:if>
											<c:if test="${uslist eq null or uslist[0].user_no == ''}">
												<td colspan="1" class="user_size">사이즈를 입력하고 비교해보세요.</td>
											</c:if>
										</tr>
										<c:forEach var="vo" items="${slist}">
											<tr>
						                		<th>${vo.sps_size}</th>
								                <c:choose>
								                	<c:when test="${vo.stt_type_no eq '101' or vo.stt_type_no eq '102' or vo.stt_type_no eq '104'}">
									                	<td class="pro_size">${vo.top_tot_leng}</td>
									                	<td class="pro_size">${vo.top_shoul_wid}</td>
									                	<td class="pro_size">${vo.top_chest_wid}</td>
									                	<td class="pro_size">${vo.top_sleeve_leng}</td>
									                </c:when>
								                	<c:when test="${vo.stt_type_no eq '103'}">
									                	<td class="pro_size">${vo.top_tot_leng}</td>
									                	<td class="pro_size">${vo.top_shoul_wid}</td>
									                	<td class="pro_size">${vo.top_chest_wid}</td>
									                </c:when>
								                	<c:when test="${vo.stt_type_no eq '201' or vo.stt_type_no eq '202' or vo.stt_type_no eq '203' or vo.stt_type_no eq '204'}">
									                	<td class="pro_size">${vo.out_tot_leng}</td>
									                	<td class="pro_size">${vo.out_shoul_wid}</td>
									                	<td class="pro_size">${vo.out_chest_wid}</td>
									                	<td class="pro_size">${vo.out_sleeve_leng}</td>
									                </c:when>
								                	<c:when test="${vo.stt_type_no eq '301'}">
									                	<td class="pro_size">${vo.one_tot_leng}</td>
									                	<td class="pro_size">${vo.one_shoul_wid}</td>
									                	<td class="pro_size">${vo.one_chest_wid}</td>
									                	<td class="pro_size">${vo.one_sleeve_leng}</td>
									                </c:when>
								                	<c:when test="${vo.stt_type_no eq '401' or vo.stt_type_no eq '402' or vo.stt_type_no eq '404'}">
									                	<td class="pro_size">${vo.bot_outseam}</td>
									                	<td class="pro_size">${vo.bot_waist_wid}</td>
									                	<td class="pro_size">${vo.bot_thigh_wid}</td>
									                	<td class="pro_size">${vo.bot_rise}</td>
									                	<td class="pro_size">${vo.bot_hem}</td>
									                </c:when>
								                	<c:when test="${vo.stt_type_no eq '403'}">
									                	<td class="pro_size">${vo.bot_outseam}</td>
									                	<td class="pro_size">${vo.bot_waist_wid}</td>
									                	<td class="pro_size">${vo.bot_hem}</td>
									                </c:when>
								                	<c:when test="${vo.stt_type_no eq '501'}">
									                	<td class="pro_size">${vo.sho_foot_leng}</td>
									                	<td class="pro_size">${vo.sho_foot_ball}</td>
									                	<td class="pro_size">${vo.sho_ankle_hei}</td>
									                	<td class="pro_size">${vo.sho_hell_hei}</td>
									                </c:when>
								                	<c:when test="${vo.stt_type_no eq '601'}">
									                	<td class="pro_size">${vo.un_waist_wid}</td>
									                </c:when>
								                	<c:when test="${vo.stt_type_no eq '602'}">
									                	<td class="pro_size">${vo.un_cup_size}</td>
									                </c:when>
								                	<c:when test="${vo.stt_type_no eq '603'}">
									                	<td class="pro_size">${vo.un_socks_leng}</td>
									                </c:when>
								                	<c:when test="${vo.stt_type_no eq '701' or vo.stt_type_no eq '702' or vo.stt_type_no eq '704' or vo.stt_type_no eq '706' or vo.stt_type_no eq '707' or vo.stt_type_no eq '708'}">
									                	<td class="pro_size">${vo.bag_height}</td>
									                	<td class="pro_size">${vo.bag_width}</td>
									                	<td class="pro_size">${vo.bag_depth}</td>
									                </c:when>
								                	<c:when test="${vo.stt_type_no eq '703' or vo.stt_type_no eq '705'}">
									                	<td class="pro_size">${vo.bag_height}</td>
									                	<td class="pro_size">${vo.bag_width}</td>
									                	<td class="pro_size">${vo.bag_depth}</td>
									                	<td class="pro_size">${vo.bag_strap_leng}</td>
									                </c:when>
									        	</c:choose>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								<a href="./shop_mysize?stn=${stypelist[0].stt_type_no}" class="btn btn-default" id="mysizeBtn">사이즈 입력</a>
								<input type="button" class="btn btn-default" id="sizeselect" value="사이즈 추천"/>
							</div>
						</div>
					</div>
					<hr>
					<div class="row">
						<div role="tabpanel">
							<div class="col-xs-12 col-sm-12">
								<div class="form_contents_margin">
									<ul class="nav nav-tabs nav-justified" role="tablist" id="detailTab">
										<li role="presentation" class="active">
											<a href="#detail" aria-controls="detail" role="tab" data-toggle="tab">상세정보</a>
										</li>
										<li role="presentation">
											<a href="#review" aria-controls="review" role="tab" data-toggle="tab">구매후기</a>
										</li>
										<li role="presentation">
											<a href="#QNA" aria-controls="QNA" role="tab" data-toggle="tab">상품문의</a>
										</li>
									</ul>
								</div>
							</div>
							<div class="col-xs-12 col-sm-12">
								<div class="tab-content">
									<div role="tabpanel" class="tab-pane active" id="detail">
										${pvo.spt_detail}
									</div>
									<div role="tabpanel" class="tab-pane" id="review">
										<table class="table">
											
										</table>
									</div>
									<div role="tabpanel" class="tab-pane" id="QNA">
										<img src="./upload/QQ1.png" alt="..." class="img-rounded img-responsive">
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
