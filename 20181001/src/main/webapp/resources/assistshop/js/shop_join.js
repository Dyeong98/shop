/**
 * 
 */
var chkid = '';
var chkidyn = 0;
var rdoVal = 0;

//이름
$(document).ready(function(){
	$("#user_name").focusout(function(){
		var val = $(this).val(),
		regex = /^[가-힣]+$/;
		if(val=="" | val==null){
			$("#user_name_div").removeClass("has-success");
			$("#user_name_span").removeClass("glyphicon-ok");
			$("#user_name_div").addClass("has-error");
			$("#user_name_span").addClass("glyphicon-remove");
		}else if(!regex.test(val)){
			$("#user_name_div").removeClass("has-success");
			$("#user_name_span").removeClass("glyphicon-ok");
			$("#user_name_div").addClass("has-error");
			$("#user_name_span").addClass("glyphicon-remove");
		}else{
			$("#user_name_div").removeClass("has-error");
			$("#user_name_span").removeClass("glyphicon-remove");
			$("#user_name_div").addClass("has-success");
			$("#user_name_span").addClass("glyphicon-ok");
		}
	});
});

//아이디
$(document).ready(function(){
	$("#user_id").focusout(function(){
		var val = $(this).val(),
		regex = /^[A-Za-z0-9+]{4,16}$/;
		if(val=="" | val==null){
			$("#user_id_div").removeClass("has-success");
			$("#user_id_span").removeClass("glyphicon-ok");
			$("#user_id_div").addClass("has-error");
			$("#user_id_span").addClass("glyphicon-remove");
		}else if(!regex.test(val)){
			$("#user_id_div").removeClass("has-success");
			$("#user_id_span").removeClass("glyphicon-ok");
			$("#user_id_div").addClass("has-error");
			$("#user_id_span").addClass("glyphicon-remove");
		}
	});
});

//비밀번호
$(document).ready(function(){
	$("#user_pwd").focusout(function(){
		var val = $(this).val(),
		regex = /^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{4,16}$/;
		if(val=="" | val==null){
			$("#user_pwd_div").removeClass("has-success");
			$("#user_pwd_span").removeClass("glyphicon-ok");
			$("#user_pwd_div").addClass("has-error");
			$("#user_pwd_span").addClass("glyphicon-remove");
		}else if(!regex.test(val)){
			$("#user_pwd_div").removeClass("has-success");
			$("#user_pwd_span").removeClass("glyphicon-ok");
			$("#user_pwd_div").addClass("has-error");
			$("#user_pwd_span").addClass("glyphicon-remove");
		}else{
			$("#user_pwd_div").removeClass("has-error");
			$("#user_pwd_span").removeClass("glyphicon-remove");
			$("#user_pwd_div").addClass("has-success");
			$("#user_pwd_span").addClass("glyphicon-ok");
		}
	});
});

//비밀번호 확인
$(document).ready(function(){
	$("#user_pwdChk").focusout(function(){
		var orgin = $("#user_pwd").val()
		val = $(this).val();
		if(val=="" | val==null){
			$("#user_pwdChk_div").removeClass("has-success");
			$("#user_pwdChk_span").removeClass("glyphicon-ok");
			$("#user_pwdChk_div").addClass("has-error");
			$("#user_pwdChk_span").addClass("glyphicon-remove");
		}else if(val!=orgin){
			$("#user_pwdChk_div").removeClass("has-success");
			$("#user_pwdChk_span").removeClass("glyphicon-ok");
			$("#user_pwdChk_div").addClass("has-error");
			$("#user_pwdChk_span").addClass("glyphicon-remove");
		}else{
			$("#user_pwdChk_div").removeClass("has-error");
			$("#user_pwdChk_span").removeClass("glyphicon-remove");
			$("#user_pwdChk_div").addClass("has-success");
			$("#user_pwdChk_span").addClass("glyphicon-ok");
		}
	});
});

//전화번호
$(document).ready(function(){
	$("#user_phone").focusout(function(){
		var val = $(this).val(),
		regex = /^[0-9]{9,11}$/;
		if(val=="" | val==null){
			$("#user_phone_div").removeClass("has-success");
			$("#user_phone_span").removeClass("glyphicon-ok");
			$("#user_phone_div").addClass("has-error");
			$("#user_phone_span").addClass("glyphicon-remove");
		}else if(!regex.test(val)){
			alert("숫자만 입력해주세요.");
			$("#user_phone").val("");
			$("#user_phone_div").removeClass("has-success");
			$("#user_phone_span").removeClass("glyphicon-ok");
			$("#user_phone_div").addClass("has-error");
			$("#user_phone_span").addClass("glyphicon-remove");
		}else{
			$("#user_phone_div").removeClass("has-error");
			$("#user_phone_span").removeClass("glyphicon-remove");
			$("#user_phone_div").addClass("has-success");
			$("#user_phone_span").addClass("glyphicon-ok");
		}
	});
});

//id check
$(document).ready(function(){
	$("#user_id_chk").click(function(){
		if($.trim($("#user_id").val()) == ''){
			alert("ID는 필수 입력 사항입니다.");
			$("#user_id").focus();
			return;
		}
		$.post("./shop_join_idchk",
				{user_id:$("#user_id").val()},
				function(data,status){
					if(data == 0){
						$("#user_id_div").removeClass("has-error");
						$("#user_id_span").removeClass("glyphicon-remove");
						$("#user_id_div").addClass("has-success");
						$("#user_id_span").addClass("glyphicon-ok");
						alert("사용 가능한 ID 입니다.");
						chkid = $("#user_id").val();
						chkidyn = 1;
					}else{
						$("#user_id_div").removeClass("has-success");
						$("#user_id_span").removeClass("glyphicon-ok");
						$("#user_id_div").addClass("has-error");
						$("#user_id_span").addClass("glyphicon-remove");
						alert("이미 사용 중인 ID 입니다.");
					}
				}
		);
	});//click
});//ready

//회원가입 버튼
$(document).ready(function() {
	$("#joinBtn").click(function() {
		if($.trim($("#user_name").val()) == ''){
			alert("이름은 필수 입력 사항입니다.");
			$("#user_name").focus();
			return;
		}
		if($.trim($("#user_id").val()) == ''){
			alert("ID는 필수 입력 사항입니다.");
			$("#user_id").focus();
			return;
		}
		if(chkidyn == 0){
			alert("먼저 ID 중복체크를 해주세요.");
			$("#user_id").focus();
			return;
		}
		if($("#user_id").val() != chkid){
			alert("확인한 ID를 변경 하셨습니다.\n다시 ID 확인을 해주세요.");
			$("#user_id").focus();
			return;
		}
		if($.trim($("#user_pwd").val()) == ''){
			alert("비밀번호는 필수 입력 사항입니다.");
			$("#user_pwd").focus();
			return;
		}
		if($("#user_pwd").val() != $("#user_pwdChk").val()){
			alert("비밀번호와 비밀번호 확인이 서로 다릅니다.\n다시 비밀번호를 확인을 해주세요.");
			$("#user_pwdChk").focus();
			return;
		}
		if($.trim($("#user_phone").val()) == ''){
			alert("전화번호는 필수 입력 사항입니다.");
			$("#user_phone").focus();
			return;
		}
		if($.trim($("#user_phone").val()) == ''){
			alert("전화번호는 필수 입력 사항입니다.");
			$("#user_phone").focus();
			return;
		}
		if(!($("#joinagreeChk1").is(":checked"))){
			alert("개인 정보 제공 약관 동의 후 회원 가입 바랍니다.");
			$("#joinagreeChk1").focus();
			return;
		}
		if(!($("#joinagreeChk2").is(":checked"))){
			alert("서비스 이용 약관 동의 후 회원 가입 바랍니다.");
			$("#joinagreeChk2").focus();
			return;
		}
		$.post(
				"./shop_join_ins"
				,{
					 user_name:$("#user_name").val()
					,user_id:$("#user_id").val()
					,user_pwd:$("#user_pwd").val()
					,user_phone:$("#user_phone").val()
					,user_birthday:$("#user_birthday").val()
					,user_sex:$("input[name='user_sex']:checked").val()
				}
				,function(data,status){
					if(status == "success"){
						if(data > 0){
							alert("회원 가입 되었습니다.");
							location.href="./shop_login";
						} else {
							alert("잠시 후, 다시 시도해 주세요.");
						}
					} else {
						alert("시스템 관리자에게 문의 바랍니다.");
					}
				}
		);//post
	});
});