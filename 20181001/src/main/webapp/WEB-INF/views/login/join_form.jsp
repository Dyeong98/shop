<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>join form</title>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
//jquery datepicker
$(function() {
	$("#cmpn_start_date").datepicker({
		changeMonth: true
		, changeYear: true
	});
});

//daum address
$(document).ready(function(){
	$("#cmpn_addr1").click(function(){
	    new daum.Postcode({
	        oncomplete: function(data) {
 	        	$("#cmpn_addr1").val(data.address);
	        }//oncomplete
	    }).open();
	});//click
});//ready

</script>
</head>
<body>
	<%@ include file="../topmenu.jsp" %>
	<script type="text/javascript">
	var chkid = '';
	var chkidyn = 0;
	var rdoVal = 0;

	//id check
	$(document).ready(function(){
		$("#id_chk").click(function(){
			if($.trim($("#mbr_id").val()) == ''){
				alert("ID는 필수 입력 사항입니다.");
				$("#mbr_id").focus();
				return;
			}
			$.post("./joinidchk",
					{mbr_id:$("#mbr_id").val()},
					function(data,status){
						if(data == 0){
							alert("사용 가능한 ID 입니다.");
							chkid = $("#mbr_id").val();
							chkidyn = 1;
						}else{
							alert("이미 사용 중인 ID 입니다.");
						}
					}
			);
		});//click
	});//ready

	//radio & checkbox & eng
	$(document).ready(function(){
		$(":checkbox").click(function(){
			if($(this).val() == 0) {
				$(this).val(1);
			} else if($(this).val() == 1) {
				$(this).val(0);
			}
		});//click

		$(".onlyEng").change(function(){
			//alert($(this).val());
			var engStd = /^[0-9a-zA-Z@.]+$/;
			if($(this).val().match(engStd)){
				//alert("ok");
			}else{
				alert("영문과 숫자만 입력 가능한 필드 입니다.");
				$(this).val("");
				$(this).focus();
				return;
			}
		});//change

		$(":radio").click(function(){
			if($(this).val() == 1) {
				rdoVal = 1;
				$(".cmpn_join").css("display","none");
			} else {
				rdoVal = 2;
				$(".cmpn_join").css("display","table-row");
			}
		});//click
	});//ready

	//data check
	$(document).ready(function(){
		$("#join_btn").click(function(){
			if($("#agree1").val() == 0){
				alert("서비스 이용 약관 동의 후 회원 가입 바랍니다.");
				$("#agree1").focus();
				return;
			}
			if($("#agree2").val() == 0){
				alert("개인 정보 제공 약관 동의 후 회원 가입 바랍니다.");
				$("#agree2").focus();
				return;
			}
			if($.trim($("#mbr_id").val()) == ''){
				alert("ID는 필수 입력 사항입니다.");
				$("#mbr_id").focus();
				return;
			}
			if(chkidyn == 0){
				alert("먼저 ID 확인을 해주세요.");
				$("#id_chk").focus();
				return;
			}
			if($("#mbr_id").val() != chkid){
				alert("확인한 ID를 변경 하셨습니다.\n다시 ID 확인을 해주세요.");
				$("#mbr_id").focus();
				return;
			}
			if($.trim($("#mbr_pwd").val()) == ''){
				alert("PWD는 필수 입력 사항입니다.");
				$("#mbr_pwd").focus();
				return;
			}
			if($("#mbr_pwd").val() != $("#mbr_pwd_re").val()){
				alert("PWD와 Confirm PWD가 서로 다릅니다.\n다시 PWD 확인을 해주세요.");
				$("#mbr_pwd").focus();
				return;
			}
			if($.trim($("#mbr_nm").val()) == ''){
				alert("Name은 필수 입력 사항입니다.");
				$("#mbr_nm").focus();
				return;
			}
			if($.trim($("#mbr_tel1").val()) == ''){
				alert("Tel은 필수 입력 사항입니다.");
				$("#mbr_tel1").focus();
				return;
			}
			if($.trim($("#mbr_tel2").val()) == ''){
				alert("Tel은 필수 입력 사항입니다.");
				$("#mbr_tel2").focus();
				return;
			}
			if($.trim($("#mbr_tel3").val()) == ''){
				alert("Tel은 필수 입력 사항입니다.");
				$("#mbr_tel3").focus();
				return;
			}
			$("#mbr_tel").val($("#mbr_tel1").val()
								+"-"+$("#mbr_tel2").val()
								+"-"+$("#mbr_tel3").val());
			if($.trim($("#mbr_email").val()) == ''){
				alert("eMail은 필수 입력 사항입니다.");
				$("#mbr_email").focus();
				return;
			}
			if($("#mbr_email").val().indexOf('@') == '-1'
				|| $("#mbr_email").val().lastIndexOf('.') == '-1'){
				alert("eMail 형식이 잘못되었습니다.");
				$("#mbr_email").focus();
				return;
			}
			if(rdoVal == 0){
				alert("회원 유형을 확인을 해주세요.");
				$("#mbr_lvl1").focus();
				return;
			}
			if(rdoVal == 2){
				if($.trim($("#cmpn_reg_no1").val()) == ''){
					alert("사업자 등록 번호는 필수 입력 사항입니다.");
					$("#cmpn_reg_no1").focus();
					return;
				}
				if($.trim($("#cmpn_reg_no2").val()) == ''){
					alert("사업자 등록 번호는 필수 입력 사항입니다.");
					$("#cmpn_reg_no2").focus();
					return;
				}
				if($.trim($("#cmpn_reg_no3").val()) == ''){
					alert("사업자 등록 번호는 필수 입력 사항입니다.");
					$("#cmpn_reg_no3").focus();
					return;
				}
				$("#cmpn_reg_no").val($("#cmpn_reg_no1").val()
									+"-"+$("#cmpn_reg_no2").val()
									+"-"+$("#cmpn_reg_no3").val());
				if($.trim($("#cmpn_nm").val()) == ''){
					alert("사업자명은 필수 입력 사항입니다.");
					$("#cmpn_nm").focus();
					return;
				}
				if($.trim($("#cmpn_ceo_nm").val()) == ''){
					alert("사업자 대표자명은 필수 입력 사항입니다.");
					$("#cmpn_ceo_nm").focus();
					return;
				}
				if($.trim($("#cmpn_start_date").val()) == ''){
					alert("사업자 시작일은 필수 입력 사항입니다.");
					$("#cmpn_start_date").focus();
					return;
				}
				if($.trim($("#cmpn_addr1").val()) == ''){
					alert("사업자 주소는 필수 입력 사항입니다.");
					$("#cmpn_addr1").focus();
					return;
				}
				if($.trim($("#cmpn_addr2").val()) == ''){
					alert("사업자 주소는 필수 입력 사항입니다.");
					$("#cmpn_addr2").focus();
					return;
				}
				$("#cmpn_addr").val($("#cmpn_addr1").val()
						+" "+$("#cmpn_addr2").val());
			}//사업자

			$.post(
					"./joinins"
					,{
						mbr_id:$("#mbr_id").val()
						,mbr_pwd:$("#mbr_pwd").val()
						,mbr_nm:$("#mbr_nm").val()
						,mbr_tel:$("#mbr_tel").val()
						,mbr_email:$("#mbr_email").val()
						,mbr_level:rdoVal
						,cmpn_reg_no:$("#cmpn_reg_no").val()
						,cmpn_nm:$("#cmpn_nm").val()
						,cmpn_ceo_nm:$("#cmpn_ceo_nm").val()
						,cmpn_start_date:$("#cmpn_start_date").val()
						,cmpn_addr:$("#cmpn_addr").val()
						,cmpn_desc:$("#cmpn_desc").val()
					}
					,function(data,status){
						if(status == "success"){
							if(data > 0){
								alert("회원 가입 되었습니다.");
								location.href="./";
							} else {
								alert("잠시 후, 다시 시도해 주세요.");
							}
						} else {
							alert("시스템 관리자에게 문의 바랍니다.");
						}
					}
			);//post
		});//click
	});//ready
	</script>
	<div class="row">
		<div class="column">
			<h2 style="text-align:center;">서비스 이용 약관</h2>
			<p style="border:1px solid black;height:200px;">서비스 이용 약관 내용<p>
			<br />
			<input type="checkbox" id="agree1" name="agree1" value="0" />
			서비스 이용 약관 동의 (*)
		</div>
		<div class="column">
			<h2 style="text-align:center;">회원 가입</h2>
			<p>
				<form id="join_form" name="join_form" method="post">
				<table width="100%">
					<colgroup>
						<col width="30%">
						<col width="70%">
					</colgroup>
					<tr>
						<td style="text-align:right;">I D (*)</td>
						<td><input type="text" id="mbr_id" name="mbr_id"
									placeholder="30자 이내"
									maxlength="30" class="onlyEng" /></td>
					</tr>
					<tr>
						<td style="text-align:right;">I D 확인 (*)</td>
						<td><input type="button" id="id_chk" value="I D 확인 (*)"
									style="width:48%" /></td>
					</tr>
					<tr>
						<td style="text-align:right;">P W D (*)</td>
						<td><input type="password" id="mbr_pwd" name="mbr_pwd"
									placeholder="30자 이내"
									maxlength="30" class="onlyEng" /></td>
					</tr>
					<tr>
						<td style="text-align:right;">Confirm P W D (*)</td>
						<td><input type="password" id="mbr_pwd_re" name="mbr_pwd_re"
									maxlength="30" /></td>
					</tr>
					<tr>
						<td style="text-align:right;">Name (*)</td>
						<td><input type="text" id="mbr_nm" name="mbr_nm"
									placeholder="10자 이내"
									maxlength="10" /></td>
					</tr>
					<tr>
						<td style="text-align:right;">Tel (*)</td>
						<td>
							<input type="number" id="mbr_tel1" name="mbr_tel1"
									style="width:54px;" maxlength="3" />
							<input type="number" id="mbr_tel2" name="mbr_tel2"
									style="width:54px;" maxlength="4" />
							<input type="number" id="mbr_tel3" name="mbr_tel3"
									style="width:54px;" maxlength="4" />
							<input type="hidden" id="mbr_tel" name="mbr_tel" />
						</td>
					</tr>
					<tr>
						<td style="text-align:right;">eMail (*)</td>
						<td><input type="text" id="mbr_email" name="mbr_email"
									placeholder="example@example.com"
									maxlength="50" class="onlyEng" /></td>
					</tr>
					<tr>
						<td style="text-align:right;">회원 유형 (*)</td>
						<td>
							<input type="radio" id="mbr_lvl1"
									name="mbr_level" value="1" /> 구직
							<input type="radio" id="mbr_lvl2"
									name="mbr_level" value="2" /> 구인
						</td>
					</tr>
					<tr class="cmpn_join" style="display:none;">
						<td style="text-align:right;">사업자 등록 번호 (*)</td>
						<td>
							<input type="number" id="cmpn_reg_no1" name="cmpn_reg_no1"
									style="width:54px;" maxlength="3" />
							<input type="number" id="cmpn_reg_no2" name="cmpn_reg_no2"
									style="width:54px;" maxlength="2" />
							<input type="number" id="cmpn_reg_no3" name="cmpn_reg_no3"
									style="width:54px;" maxlength="5" />
							<input type="hidden" id="cmpn_reg_no" name="cmpn_reg_no" />
						</td>
					</tr>
					<tr class="cmpn_join" style="display:none;">
						<td style="text-align:right;">사업자명 (*)</td>
						<td><input type="text" id="cmpn_nm" name="cmpn_nm"
									placeholder="20자 이내"
									maxlength="20" /></td>
					</tr>
					<tr class="cmpn_join" style="display:none;">
						<td style="text-align:right;">사업자 대표자명 (*)</td>
						<td><input type="text" id="cmpn_ceo_nm" name="cmpn_ceo_nm"
									placeholder="10자 이내"
									maxlength="10" /></td>
					</tr>
					<tr class="cmpn_join" style="display:none;">
						<td style="text-align:right;">사업자 시작일 (*)</td>
						<td><input type="text" id="cmpn_start_date" name="cmpn_start_date"
									readonly="readonly" /></td>
					</tr>
					<tr class="cmpn_join" style="display:none;">
						<td style="text-align:right;">사업자 주소 (*)</td>
						<td>
							<input type="text" id="cmpn_addr1" name="cmpn_addr1"
									readonly="readonly" />
							<br>
							<input type="text" id="cmpn_addr2" name="cmpn_addr2"
									maxlength="50" />
							<input type="hidden" id="cmpn_addr" name="cmpn_addr" />
						</td>
					</tr>
					<tr class="cmpn_join" style="display:none;">
						<td style="text-align:right;">사업자 가입 인사</td>
						<td>
							<textarea id="cmpn_desc" name="cmpn_desc"
										style="width:48%;height:70px;resize:none;"></textarea>
						</td>
					</tr>
					<tr>
						<td></td>
						<td><input type="button" id="join_btn" value="회원 가입"
									style="width:48%" /></td>
					</tr>
				</table>
				</form>
			</p>
		</div>
		<div class="column">
			<h2 style="text-align:center;">개인 정보 제공 약관</h2>
			<p style="border:1px solid black;height:200px;">개인 정보 제공 약관 내용<p>
			<br />
			<input type="checkbox" id="agree2" name="agree2" value="0" />
			개인 정보 제공 약관 동의 (*)
		</div>
	</div><!-- row -->
	<%@ include file="../footer.jsp" %>
</body>
</html>
