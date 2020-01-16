/**
 * 
 */

$(document).ready(function(){
	$("#allChk").click(function() {
		if($("#allChk").prop("checked")) {
			$("input[type=checkbox]").prop("checked",true);
		} else {
			$("input[type=checkbox]").prop("checked",false);
		}
	});
});
;
$(document).ready(function(){
	$("#cart_delBtn").click(function(){
		if($('input:checkbox[name=rowChk]:checked').length == 0){
			alert("삭제 대상을 체크해주세요.");
			return;
		}else{
			var goYN = confirm("삭제 하시겠습니까?");
			if(goYN == false){
				return;
			}
			$("#cartForm").attr("action","./cart_del");
			$("#cartForm").submit();

		
		}
	});
	
});