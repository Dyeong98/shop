/**
 * 
 */

function ptn2Fun(ptn2) {
	$("#ptn2").val(ptn2);
	$("#sort_type").val("0");
	$("#sort_form").submit();
}

$(document).ready(function(){
	$("#sort_type_sel").change(function(){
		$("#ptn2").val($("#ptn2").val());
		$("#sort_type").val($("#sort_type_sel").val());
		$("#sort_form").submit();
	});//click
});//ready

function pageFun(page) {
	$("#ptn2").val($("#ptn2").val());
	$("#sort_type").val($("#sort_type_sel").val());
	$("#page").val(page);
	$("#sort_form").submit();
}