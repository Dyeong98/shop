<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>shop_mysize.jsp</title>
    	<link href="./resources/bootstrap-3.3.2-dist/css/bootstrap.min.css" rel="stylesheet">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    	<script src="./resources/bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>
    	<script src="./resources/assistshop/js/shop_mysize.js"></script>
	</head>
	<body>
		<%@include file="./shop_menu.jsp" %>
		<div class="container contents_padding_top" id="main_contents">
			<div class="row" >
				<div class="col-xs-8 col-sm-8">
	                <c:choose>
	                	<c:when test="${StyleListAll eq null or StyleListAll[0].stt_size_no == ''}">
							<div class="panel panel-default text-center">
								<div class="panel-body">
									<h1>우측에서 스타일을 선택해주세요.</h1>
								</div>
							</div>
		                </c:when>
	                	<c:when test="${StyleListAll ne null and StyleListAll[0].stt_size_no != ''}">
							<div class="panel panel-default text-center">
								<div class="panel-body">
									<p><a ><img src="./upload/styletypedetail/${StyleListAll[0].stt_type_no}.png" alt="..." class="img-thumbnail img-responsive"></a></p>
									<form class="form-horizontal" id="mysize_form">
										<div class="form-group" id="div_formGroup">
											<c:forEach var="vo" items="${StyleListAll}" varStatus="status">
												<div class="col-xs-12 col-sm-6">
													<div class="row">
														<label for="mysize_${status.count}" class="col-xs-4 col-sm-4 control-label">${status.count}. ${vo.stt_size_nm}</label>
		   												<div class="col-xs-8 col-sm-8">
															<input type="text" class="form-control" name="user_size" id="mysize_${status.count}" placeholder="${vo.stt_size_nm}">
														</div>
													</div>
												</div>
												<input type="hidden" name="stt_size_no" value="${vo.stt_size_no}"/>
											</c:forEach>
										</div>
										<div class="form-group">
											<div class="col-xs-12">
												<div class="text-center">
													<input type="button" class="btn btn-default" id="resetBtn" value="초기화"/>
													<input type="button" class="btn btn-primary" id="saveBtn" value="저장"/>
												</div>
											</div>
										</div>
										<input type="hidden" name="user_no" value="${userSess.user_no}"/>
										<input type="hidden" name="stt_type_no" value="${StyleListAll[0].stt_type_no}"/>
									</form>
								</div>
							</div>
		                </c:when>
		        	</c:choose>
				</div>
				<div class="col-xs-4 col-sm-4">
					<c:forEach var="vo" items="${StyleList}" varStatus="status">
						<div class="col-xs-12 col-sm-6">
							<div class="panel panel-default text-center">
								<div class="panel-body">
									<p><a href="./shop_mysize?stn=${vo.stt_type_no}"><img src="${vo.stt_comment}" alt="..." class="img-thumbnail img-responsive"></a></p>
									<p>${vo.stt_type_nm}</p>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</body>
</html>
