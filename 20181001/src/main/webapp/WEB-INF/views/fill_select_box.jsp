<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>fill_select_box</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>
<script>
$(document).ready(function(){
	$("#select1").change(function(){
		if($("#select1").val() != '0'){
			$.get(
					"./fillsb2"
					, {l_no:$("#select1").val()}
					, function(data, status){
						$("#select2").empty();
						$("#select2").append("<option value=0 selected>전체</option>");
						$.each(data, function(index,vo){
							$("#select2").append("<option value="+vo.m_no+">"+vo.m_nm+"</option>");
						});
					}
					, "json"
			);//get
		} else{
			$("#select2").empty();
			$("#select2").append("<option value=0 selected>전체</option>");
			$("#select3").empty();
			$("#select3").append("<option value=0 selected>전체</option>");
		}//if
	});//click
});//ready
</script>

<script>
$(document).ready(function(){
	$("#select2").change(function(){
		if($("#select2").val() != '0'){
			$.get(
					"./fillsb3"
					, {l_no:$("#select1").val()
						, m_no:$("#select2").val()}
					, function(data, status){
						$("#select3").empty();
						$("#select3").append("<option value=0 selected>전체</option>");
						$.each(data, function(index,vo){
							$("#select3").append("<option value="+vo.s_no+">"+vo.s_nm+"</option>");
						});
					}
					, "json"
			);//get
		} else{
			$("#select3").empty();
			$("#select3").append("<option value=0 selected>전체</option>");
		}//if
	});//click
});//ready
</script>

<select id="select1">
	<option value=0 selected="selected">전체</option>
	<c:forEach var="vo" items="${classLargeList}" varStatus="status">
		<option value="${vo.l_no}">${vo.l_nm}</option>
	</c:forEach>
</select>

<select id="select2">
	<option value=0 selected="selected">전체</option>
</select>

<select id="select3">
	<option value=0 selected="selected">전체</option>
</select>

</body>
</html>










