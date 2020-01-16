<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>shop_product_add.jsp</title>
    	<link href="./resources/bootstrap-3.3.2-dist/css/bootstrap.min.css" rel="stylesheet">
    	<link href="./resources/assistshop/css/shop_product_add.css" rel="stylesheet">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    	<script src="./resources/bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>
		<script src="./resources/ckeditor/ckeditor.js"></script>
    	<script src="./resources/assistshop/js/shop_product_add.js"></script>
		<script type="text/javascript">
			if(${userSess == null || userSess.user_no == ""}){
				if (${userSess.user_level == "1"}) {
					alert("로그인 정보를 확인해 주세요.");
					location.href="./shop_main";
				}
				alert("로그인 해 주세요.");
				location.href="./shop_login";
				
			}
		</script>
	</head>
	<body>
		<%@include file="./shop_menu.jsp" %>
		<div class="container contents_padding_top" id="main_contents">
			<div class="row">
				<div class="col-xs-12 col-sm-12">
					<div class="row">
						<div class="col-xs-12 col-sm-12">
							<div class="text-center">
								<h2>상품등록</h2>
							</div>
						</div>
					</div>
					<hr>
					<form class="form-horizontal" id="product_add_form" name="product_add_form">
						<div class="form-group">
							<label for="product_add_sort" class="col-xs-12 col-sm-2 control-label">제품분류</label>
							<div class="col-xs-12 col-sm-10">
								<div class="row">
									<div class="col-xs-12 col-sm-6">
										<label for="product_type1" class="control-label">대분류</label>
										<select class="form-control" id="product_type1" name="spt_type1_no">
											<option value=0 selected="selected">전체</option>
											<c:forEach var="vo" items="${Type1List}" varStatus="status">
												<option value="${vo.ptt_type1_no}">${vo.ptt_type1_nm}</option>
											</c:forEach>
										</select>
									</div>
									<div class="col-xs-12 col-sm-6">
										<label for="product_type2" class="control-label">소분류</label>
										<select class="form-control" id="product_type2" name="spt_type2_no">
											<option value=0 selected="selected">전체</option>
										</select>
									</div>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label for="product_add_name" class="col-xs-12 col-sm-2 control-label">상품명</label>
							<div class="col-xs-12 col-sm-10">
								<input type="text" class="form-control" id="spt_name" name="spt_name" placeholder="상품명">
							</div>
						</div>
						<div class="form-group">
							<label for="product_add_name" class="col-xs-12 col-sm-2 control-label">색상</label>
							<div class="col-xs-12 col-sm-9">
								<table class="table table-bordered" id="product_color">
									<thead>
										<tr class="text-center" id="product_color_head">
											<th>색상</th>
									    </tr>
									</thead>
									<tbody id="product_color_tbody">
										<tr id="product_color_tbody_1">
											<td><input type="text" class="form-control" id=trcolor0 name='spc_color'></td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="col-xs-12 col-sm-1">
								<a class="btn btn-default" id="product_color_add_row" role="button">
									<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
								</a>
								<a class="btn btn-default" id="product_color_add_remove" role="button">
									<span class="glyphicon glyphicon-minus" aria-hidden="true"></span>
								</a>
							</div>
						</div>
						<div class="form-group">
							<label for="product_add_sort" class="col-xs-12 col-sm-2 control-label">제품스타일</label>
							<div class="col-xs-12 col-sm-10">
								<select class="form-control" id="style_type1" name="spt_style_type_no">
									<option value=0 selected="selected">--제품스타일--</option>
									<c:forEach var="vo" items="${StyleList}" varStatus="status">
										<option value="${vo.stt_type_no}">${vo.stt_type_nm}</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="product_add_name" class="col-xs-12 col-sm-2 control-label">사이즈정보</label>
							<div class="col-xs-12 col-sm-9">
								<table class="table table-bordered" id="product_size">
									<thead>
										<tr class="text-center" id="product_size_thead">
											<th>사이즈</th>
									    </tr>
									</thead>
									<tbody id="product_size_tbody">
										<tr id="product_size_tbody_1">
											<td><input type="text" class="form-control" id=trsize0 name='sps_size'></td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="col-xs-12 col-sm-1">
								<a class="btn btn-default" id="product_size_add_row" role="button">
									<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
								</a>
								<a class="btn btn-default" id="product_size_add_remove" role="button">
									<span class="glyphicon glyphicon-minus" aria-hidden="true"></span>
								</a>
							</div>
						</div>
						<div class="form-group">
							<label for="product_add_price" class="col-xs-12 col-sm-2 control-label">상품가격</label>
							<div class="col-xs-12 col-sm-4">
								<input type="text" class="form-control" id="spt_price" name="spt_price">
							</div>
							<label for="product_add_price" class="col-xs-12 col-sm-2 control-label">상품수량</label>
							<div class="col-xs-12 col-sm-4">
								<input type="number" class="form-control" id="spt_count" name="spt_count">
							</div>
						</div>
						<div class="form-group">
							<label for="product_add_delivery" class="col-xs-12 col-sm-2 control-label">배송구분</label>
							<div class="col-xs-12 col-sm-4" id="product_add_delivery">
								<div id="del_free_div" style="padding: 6px 12px;">
									<input type="radio" name="spt_delivery" id="product_delivery1" value="0" > 무료
								</div>
								<div class="input-group">
									<span class="input-group-addon">
										<input type="radio" name="spt_delivery" id="product_delivery2" value="1" checked="checked"> 구매자부담
									</span>
									<input type="text" class="form-control" name="spt_delivery_price" id="spt_delivery_price"/>
								</div>
							</div>
							<label for="product_add_delivery" class="col-xs-12 col-sm-2 control-label">상품공개여부</label>
							<div class="col-xs-12 col-sm-4" id="product_status">
								<div class="radio">
									<input type="radio" name="spt_status" id="product_status1" value="0"> 비공개
								</div>
								<div class="radio">
									<input type="radio" name="spt_status" id="product_status2" value="1" checked="checked"> 공개
								</div>
							</div>
						</div>
						<div class="form-group">
							<label for="product_add_thumbnail" class="col-xs-12 col-sm-2 control-label">상품메인이미지</label>
							<div class="col-xs-12 col-sm-3" id="preview_div">
								<img alt="" src="#" id="img_preview" class="img-thumbnail img-responsive" width="250px" height="250px">
							</div>
							<div class="col-xs-12 col-sm-7">
								<input type="file" class="form-control" id="product_add_thumbnail" accept="image/*" name="thumbnail">
							</div>
						</div>
						<div class="form-group">
							<label for="product_add_thumbnail" class="col-xs-12 col-sm-2 control-label">상품상세정보</label>
							<div class="col-xs-12 col-sm-10">
								<textarea class="form-control" rows="10" id="product_add_detail" ></textarea>
							</div>
						</div>
						<script type="text/javascript">
							$(document).ready(function(){
								CKEDITOR.replace('product_add_detail',{
									filebrowserUploadUrl:'./ckupload'
								});
							});
						</script>
						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-10">
								<input type="hidden" id="hiduserNo" value="${userSess.user_no}" />
								<input type="hidden" id="hiduserID" value="${userSess.user_id}" />
								<button type="button" class="btn btn-default" id="productInsBtn">등록</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</body>
</html>
