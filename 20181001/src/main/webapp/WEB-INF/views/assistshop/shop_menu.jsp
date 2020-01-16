<%@page import="kr.co.lnssoft.assistshop.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="./resources/assistshop/css/shop_menu.css" rel="stylesheet">
<script src="./resources/assistshop/js/shop_menu.js"></script>
<div class="container text-right">
	<ul class="nav nav-pills" id="top_my_menu">
		<li role="presentation" class=""><a href="./shop_cart">장바구니</a></li>
		<li role="presentation" class=""><a href="./shop_mysize">My size</a></li>
		<%
			UserVO vo = (UserVO) session.getAttribute("userSess");
			if(vo != null && vo.getUser_level().equals("2")){
		%>
				<li role="presentation" class=""><a href="./shop_product_add">상품등록</a></li>
		<%
			}
			if(vo != null && vo.getUser_level().equals("0")){
		%>
				<li role="presentation" class=""><a href="./shop_product_add">상품등록</a></li>
		<%
			}
			if(vo == null || vo.getUser_no() == ""){
		%>
				<li role="presentation" class=""><a href="./shop_login">로그인</a></li>
		<%
			}else{
		%>
				<li role="presentation" class=""><a href="./shop_logout">로그아웃</a></li>
		<%
			}
		%>
	</ul>
</div>
<div class="container">
	<div class="row">
		<div class="col-xs-12 col-sm-6 col-sm-offset-3">
			<h1 class="text-center"><a href="./shop_main" id="shop_header"><img class="first-slide" src="./upload/shop/shop_title.PNG" alt=""></a></h1>
		</div>
		<div id="search_div" class="col-xs-12 col-sm-3">
			<form class="" id="nav_search_form" name="nav_search_form" action="./shop_search">
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
<nav class="navbar navbar-inverse" id="top_nav">
	<div class="container" id="category">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
				<span class="sr-only">Toggle navigation</span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
		</div>
		<div id="navbar" class="navbar-collapse collapse text-center" aria-expanded="false">
			<ul class="nav navbar-nav" id="nav_ul">
				<li class="active"><a href="./shop_main">Home</a></li>
				<li><a href="./shop_hot">Hot</a></li>
				<li><a href="./shop_sort?ptn1=1&sort_type=0">Top</a></li>
				<li><a href="./shop_sort?ptn1=2&sort_type=0">Outer</a></li>
				<li><a href="./shop_sort?ptn1=3&sort_type=0">One piece</a></li>
				<li><a href="./shop_sort?ptn1=4&sort_type=0">Bottom</a></li>
				<li><a href="./shop_sort?ptn1=5&sort_type=0">Shoes</a></li>
				<li><a href="./shop_sort?ptn1=6&sort_type=0">Under wear</a></li>
				<li><a href="./shop_sort?ptn1=7&sort_type=0">Bag</a></li>
				<li><a href="./shop_event">Event</a></li>
			</ul>
		</div>
	</div>
</nav>
<div class="list-group hidden-xs hidden-sm" id="side_menu">
	<% 
		if(vo == null || vo.getUser_no() == ""){
	%>
			<a href="./shop_login" class="list-group-item">로그인</a>
	<%
		}else{
	%>
			<a href="./shop_logout" class="list-group-item">로그아웃</a>
	<%
		}
		if(vo != null && vo.getUser_level().equals("2")){
	%>
			<a href="./shop_product_add" class="list-group-item">상품등록</a>
	<%
		}
		if(vo != null && vo.getUser_level().equals("0")){
	%>
			<a href="./shop_product_add" class="list-group-item">상품등록</a>
	<%
		}
	%>
	<a href="#" class="list-group-item disabled">옷장</a>
	<a href="./shop_mysize" class="list-group-item">My size</a>
	<a href="./shop_cart" class="list-group-item ">장바구니</a>
	<a href="#" class="list-group-item disabled">찜목록</a>
	<a href="#" class="list-group-item disabled" >결제내역</a>
</div>
