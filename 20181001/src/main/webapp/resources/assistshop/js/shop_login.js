/**
 * 
 */

$(document).ready(function(){
	$("#user_id, #user_pwd").keydown(function(key) {
		if (key.keyCode == 13) {
			if($.trim($("#user_id").val()) == ""){
				alert("아이디를 확인하세요.");
				$("#user_id").focus();
				return;
			}
			if($.trim($("#user_pwd").val()) == ""){
				alert("비밀번호를 확인하세요.");
				$("#user_pwd").focus();
				return;
			}

			$.post(
					"./shop_login_form"
					,{
						user_id:$("#user_id").val()
						,user_pwd:$("#user_pwd").val()
					}
					,function(data,status){
						if(status == "success"){
							if(data > 0){
								location.href="./shop_main";
							} else if (data == 0) {
								alert("등록되어 있지 않습니다.\n아이디 또는 비밀번호를 다시 확인하세요.");
							} else{
								alert("잠시 후, 다시 시도해 주세요.");
							}
						} else {
							alert("시스템 관리자에게 문의 바랍니다.");
						}
					}
			);//post
		}
	});
});





$(document).ready(function(){
	$("#shop_loginBtn").click(function() {
		if($.trim($("#user_id").val()) == ""){
			alert("아이디를 확인하세요.");
			$("#user_id").focus();
			return;
		}
		if($.trim($("#user_pwd").val()) == ""){
			alert("비밀번호를 확인하세요.");
			$("#user_pwd").focus();
			return;
		}

		$.post(
				"./shop_login_form"
				,{
					user_id:$("#user_id").val()
					,user_pwd:$("#user_pwd").val()
				}
				,function(data,status){
					if(status == "success"){
						if(data > 0){
							location.href="./shop_main";
						} else if (data == 0) {
							alert("등록되어 있지 않습니다.\n아이디 또는 비밀번호를 다시 확인하세요.");
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

$(document).ready(function(){
    $("#findidBtn").click(function(){
    	window.open("find_id","아이디 찾기","width=500px, height=500px");
    	
    });
 
});

$(document).ready(function(){
    $("#findpwdBtn").click(function(){
    	window.open("find_pwd","비밀번호 찾기","width=500px, height=500px");
    	
    });
 
});

$(document).ready(function(){
    $("#joinuserBtn").click(function(){
    	$(location).attr("href", "./shop_join");

    });
 
});