<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<style type="text/css">
	* {box-sizing:border-box;}
	body {margin:0px;}
	.header {
		background-color:lightgray;
		padding:20px;
		text-align:center;
	}
	.topnav {
		overflow:hidden;
		background-color:black;
	}
	.topnav a {
		float:left;
		display:block;
		color:white;
		padding:14px 16px;
		text-align:center;
		text-decoration:none;
	}
	.topnav a:hover {
		background-color:white;
		color:black;
	}
	.column {
		float:left;
		width:33.33%;
		padding:15px;
	}
	.row:after {
		content:"";
		display:table;
		clear:both;
	}
	@media screen and (max-width:600px) {
		.column {width:100%;}
	}
	.footer{
		background-color:lightgray;
		padding:10px;
		text-align:center;
	}
	.header a:visited, a:active, a{
		text-decoration: none;
		color: black;
	}
</style>
<div class="header">
	<h1><a href="./shopmain">HEADER</a></h1>
</div>
<div class="topnav">
	<a href="#">ABOUT</a>
	<a href="#">PRODUCT</a>
	<a href="./freeBrdList">자유게시판</a>
</div>