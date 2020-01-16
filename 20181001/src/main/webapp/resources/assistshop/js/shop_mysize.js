/**
 * 
 */
$(document).ready(function(){
	$("#resetBtn").click(function(){
		$("#div_formGroup div div div input").val("");
	});//click
});//ready

$(document).ready(function(){
	$("#mysize_1").focusout(function(){
		var val = $(this).val(),
		regex = /^[0-9]+$/;
		if(val=="" | val==null){
			$("#mysize_1").val("");
		}else if(!regex.test(val)){
			alert("숫자만 입력해주세요.");
			$("#mysize_1").val("");
		}
	});
});
$(document).ready(function(){
	$("#mysize_2").focusout(function(){
		var val = $(this).val(),
		regex = /^[0-9]+$/;
		if(val=="" | val==null){
			$("#mysize_2").val("");
		}else if(!regex.test(val)){
			alert("숫자만 입력해주세요.");
			$("#mysize_2").val("");
		}
	});
});
$(document).ready(function(){
	$("#mysize_3").focusout(function(){
		var val = $(this).val(),
		regex = /^[0-9]+$/;
		if(val=="" | val==null){
			$("#mysize_3").val("");
		}else if(!regex.test(val)){
			alert("숫자만 입력해주세요.");
			$("#mysize_3").val("");
		}
	});
});
$(document).ready(function(){
	$("#mysize_4").focusout(function(){
		var val = $(this).val(),
		regex = /^[0-9]+$/;
		if(val=="" | val==null){
			$("#mysize_4").val("");
		}else if(!regex.test(val)){
			alert("숫자만 입력해주세요.");
			$("#mysize_4").val("");
		}
	});
});
$(document).ready(function(){
	$("#mysize_5").focusout(function(){
		var val = $(this).val(),
		regex = /^[0-9]+$/;
		if(val=="" | val==null){
			$("#mysize_5").val("");
		}else if(!regex.test(val)){
			alert("숫자만 입력해주세요.");
			$("#mysize_5").val("");
		}
	});
});
//등록 버튼
$(document).ready(function() {
	$("#saveBtn").click(function() {
		var form = new FormData(document.getElementById("mysize_form"));
		$.ajax({
			url:"./insusersize"
			, data:form
			, dataType:'json'
			, processData:false
			, contentType:false
			, type:'POST'
			, success:function(result){
				if(result > 0){
					alert("저장되었습니다.");
					location.href="./shop_mysize";
				} else {
					alert("잠시 후, 다시 시도해 주세요.");
				}
			}
			, error:function(xhr){
				alert("시스템 관리자에게 문의 바랍니다.");
			}
		});//ajax
	});
});