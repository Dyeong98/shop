/**
 * 
 */

//수량
$(document).ready(function(){
	$("#detailQuantity").focusout(function(){
		var val = $(this).val(),
		regex = /^[0-9]$/;
		if(val=="" | val==null){
			$("#detailQuantity").val("");
		}else if(!regex.test(val)){
			alert("숫자만 입력해주세요.");
			$("#detailQuantity").val("");
		}
	});
});

$(document).ready(function(){
	$("#detailCartBtn").click(function(){
		if($("#detailColor").val() == '0'){
			alert("색상을 선택해주세요.");
			return;
		}
		if($("#detailSize").val() == '0'){
			alert("사이즈를 선택해주세요.");
			return;
		}
		if($.trim($("#detailQuantity").val()) == ''){
			alert("수량을 입력해주세요.");
			$("#detailQuantity").focus();
			return;
		}
		if($("#user_no").val() == null || $("#user_no").val() == ""){
			alert("로그인 해 주세요.");
			location.href="./shop_login";
		}else{
			var goYN = confirm("장바구니에 추가 하시겠습니까?");
			if(goYN == false){
				return;
			}

			$.post(
					"./cart_add"
					,{
					 	 user_no:$("#user_no").val()
						,spt_no:$("#spt_no").val()
						,spt_thumbnail:$("#spt_thumbnail").val()
						,spt_name:$("#spt_name").val()
						,spt_price:$("#spt_price").val()
						,spt_count:$("#detailQuantity").val()
						,spt_delivery_price:$("#spt_delivery_price").val()
						,sct_color:$("#detailColor").val()
						,sct_size:$("#detailSize").val()
						,spt_seller_id:$("#spt_seller_id").val()
					}
					,function(data,status){
						if(status == "success"){
							if(data > 0){
								var cartgoYN = confirm("장바구니에 추가되었습니다. 확인하시겠습니까?");
								if(cartgoYN == false){
									return;
								}
								location.href="./shop_cart";
							} else {
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
	$("#detailOrderBtn").click(function(){
		if($("#detailColor").val() == '0'){
			alert("색상을 선택해주세요.");
			return;
		}
		if($("#detailSize").val() == '0'){
			alert("사이즈를 선택해주세요.");
			return;
		}
		if($.trim($("#detailQuantity").val()) == ''){
			alert("수량을 입력해주세요.");
			$("#detailQuantity").focus();
			return;
		}
		if($("#user_no").val() == null || $("#user_no").val() == ""){
			alert("로그인 해 주세요.");
			location.href="./shop_login";
		}else{
			var goYN = confirm("구매 하시겠습니까?");
			if(goYN == false){
				return;
			}
			$("#order_form").attr("action","./shop_order");
			$("#order_form").submit();

		
		}
	});
	
});

$(document).ready(function(){
	$("#sizeselect").click(function(){
		var usersize = $(".user_size");
		var prosize = $(".pro_size");
		var is_check = 0;
		for(var i=0; i<usersize.length; i++) {
			var usersize_val = parseFloat(usersize[i].innerHTML);
			var prosize_idx = "";
			var before_diff_prosize = parseFloat($("input[name='diff_range_" + i + "']").val());

			for(var j=0; j<prosize.length; j++) {

				if((j%usersize.length) == i) {

					prosize[j].className = "pro_size";
					var prosize_val = parseFloat(prosize[j].innerHTML);

					if(usersize_val == prosize_val) {
						var prosize_idx = j;
						break;
					} else {
						var diff_prosize = Math.abs(usersize_val - prosize_val);
						if(diff_prosize < before_diff_prosize) {
							var prosize_idx = j;
							before_diff_prosize = diff_prosize;
						}
					}
				}
			}

			if(prosize[prosize_idx] != undefined) {
				prosize[prosize_idx].className = "pro_size size_selected";
				is_check = 1;
			}
		}

		if(is_check == 0) {
			alert("비슷한 사이즈가 없습니다.");
		}
		
	});
	
});

$(document).ready(function() {
	$('#detailTab a').click(function(e) {
	  e.preventDefault()
	  $(this).tab('show')
	});
});
