/**
 * 
 */
$(document).ready(function(){
	$("#findBtn").click(function() {
		if($.trim($("#user_name").val()) == ""){
			alert("이름을 확인하세요.");
			$("#user_name").focus();
			return;
		}
		if($.trim($("#user_phone").val()) == ""){
			alert("전화번호를 확인하세요.");
			$("#user_phone").focus();
			return;
		}

		$.post(
				"./shop_find_id_form"
				,{
					user_name:$("#user_name").val()
					,user_phone:$("#user_phone").val()
				}
				,function(data,status){
					if(status == "success"){
						if(data != "" && data != null && data != "null"){
							$("#find_id_form").html('<div class="form-group"><div class="col-xs-12 "><h2 class="form-findid-heading">'+'ID : '+data+'</h2></div></div>');
						} else if (data == "" || data == null|| data == "null") {
							alert("등록되지 않은 정보 입니다.");
						} else{
							alert("잠시 후, 다시 시도해 주세요.");
						}
					} else {
						alert("시스템 관리자에게 문의 바랍니다.");
					}
				}
		);//post
	});
});