/**
 * 
 */

$(document).ready(function() {
	$("#addrBtn").click(function() {
    new daum.Postcode({
        oncomplete: function(data) {
			var addr = '';
			if (data.userSelectedType == 'R') {
				addr = data.roadAddress;
			}else{
				addr = data.jibunAddress;
			}
			$("#spo_post_code").val(data.zonecode);
			$("#spo_addr1").val(addr);
	        }
	    }).open();
	});
});

$(document).ready(function(){
	$("#order_choice2").click(function(){
		$.post(
				"./user_Addr"
				, {}
				, function(data, status){
					if(status == "success"){
						if(data != null && data != 0){
							$.each(data, function(index,vo){
								$("#spo_name").val(vo.sua_name);
								$("#spo_phone").val(vo.sua_phone);
								$("#spo_post_code").val(vo.sua_post_code);
								$("#spo_addr1").val(vo.sua_addr1);
								$("#spo_addr2").val(vo.sua_addr2);
							});
						} else if (data == 0) {
							alert("기본배송지가 등록되어 있지 않습니다.");
						} else{
							alert("잠시 후, 다시 시도해 주세요.");
						}
					} else {
						alert("시스템 관리자에게 문의 바랍니다.");
					}
				}
				, "json"
		);//get
	});
});

$(document).ready(function(){
	$("#order_paymentBtn").click(function(){
		if(!($("input:radio[name=order_choice]").is(":checked"))){
			alert("배송지 구분은 필수 선택 사항입니다.");
			return;
		}
		if($.trim($("#spo_name").val()) == ''){
			alert("수령인/배송지는 필수 입력 사항입니다.");
			$("#spo_name").focus();
			return;
		}
		if($.trim($("#spo_phone").val()) == ''){
			alert("휴대전화번호는 필수 입력 사항입니다.");
			$("#spo_phone").focus();
			return;
		}
		if($.trim($("#spo_post_code").val()) == ''){
			alert("우편번호는 필수 입력 사항입니다.");
			$("#addrBtn").click();
			return;
		}
		if($.trim($("#spo_addr1").val()) == ''){
			alert("주소는 필수 입력 사항입니다.");
			$("#addrBtn").click();
			return;
		}
		if($.trim($("#spo_addr2").val()) == ''){
			alert("상세주소는 필수 입력 사항입니다.");
			$("#spo_addr2").focus();
			return;
		}

		if(!($("input:radio[name=spo_payment]").is(":checked"))){
			alert("결제수단은 필수 선택 사항입니다.");
			return;
		}

		if(!($("#order_agreeChk").is(":checked"))){
			alert("주문자 동의는 필수 선택 사항입니다.");
			$("#order_agreeChk").focus();
			return;
		}
		var goYN = confirm("결제 하시겠습니까?");
		if(goYN == false){
			return;
		}
        window.name = "OrderForm";
        openWin = window.open("./shop_payment", "paymentForm", "width=762, height=570, left=50%, top=50%,scrollbars=no,titlebar=no,status=no,resizable=no,fullscreen=no");  

//		window.open("./upload/payment.PNG","new", "width=762, height=570, left=50%, top=50%,scrollbars=no,titlebar=no,status=no,resizable=no,fullscreen=no");
		
		
	});
	
});

function formsubmit() {
	var form = new FormData(document.getElementById("orderForm"));
	$.ajax({
		url:"./order_add"
		, data:form
		, dataType:'json'
		, processData:false
		, contentType:false
		, type:'POST'
		, success:function(result){
			if(result > 0){
				alert("주문이 완료되었습니다.");
				location.href="./shop_order_end";
			}else if (result == -1) {
				alert("재고가 부족합니다.");
				location.href="./shop_main";
			}else {
				alert("잠시 후, 다시 시도해 주세요.");
			}
		}
		, error:function(xhr){
			alert("시스템 관리자에게 문의 바랍니다.");
		}
	});//ajax
}