<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>	
		<meta charset="EUC-KR">
		<title>json1</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	</head>
	<body>
		<button id="btnB">brd list call</button>
		<table border="1">
			<colgroup>
				<col width="5%">
				<col width="15%">
				<col width="10%">
				<col width="70%">
			</colgroup>
			<thead>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>내용</th>
			</thead>
			<tbody id="table">
			</tbody>
		</table>
		<script type="text/javascript">
			$(document).ready(function() {
				$("#btnB").click(function() {
					$.get(
							"./jsonBrdList"
							,{}
							,function(data, status){
								$("#table").empty();
								$.each(data, function(index, vo){
									$("#table").append("<tr>");
									$("#table").append("<td>"+vo.no+"</td>");
									$("#table").append("<td>"+vo.tatle+"</td>");
									$("#table").append("<td>"+vo.writer+"</td>");
									$("#table").append("<td>"+vo.contents+"</td>");
									$("#table").append("</tr>");
								});//each
// 								var tmp = "";
// 								$.each(data, function(index, vo){
// 									tmp = tmp +"<tr> <td>"+vo.no+"</td>"
// 									+ "<td>"+vo.tatle+"</td>"
// 									+ "<td>"+vo.writer+"</td>"
// 									+ "<td>"+vo.contents+"</td> </tr>";
// 								});//each
// 								$("#table").html(tmp);
							}//function
					,"json");//get
				});//click
			});//document
		</script>
		
		<button id="btnJ">Json call</button>
		<script type="text/javascript">
			$(document).ready(function() {
				$("#btnJ").click(function() {
					$.get(
						"./json1call"
						, function(data,status){
							alert(data);
							$.each(data, function(index, vo){
								alert(vo.name);
								alert(vo.age);
								alert(vo.job);
						});//each	
					},"json");//get
				});//btn.click
			});//document
		</script>
	</body>
</html>