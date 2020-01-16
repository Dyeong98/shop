/**
 * 
 */
$(document).ready(function(){
	$("#product_type1").change(function(){
		if($("#product_type1").val() != '0'){
			$.get(
					"./shop_product_type2"
					, {ptt_type1_no:$("#product_type1").val()}
					, function(data, status){
						$("#product_type2").empty();
						$("#product_type2").append("<option value=0 selected>전체</option>");
						$.each(data, function(index,vo){
							$("#product_type2").append("<option value="+vo.ptt_type2_no+">"+vo.ptt_type2_nm+"</option>");
						});
					}
					, "json"
			);//get
		} else{
			$("#product_type2").empty();
			$("#product_type2").append("<option value=0 selected>전체</option>");
		}//if
	});//click
});//ready

$(document).ready(function(){
	$("#style_type1").change(function(){
		if($("#style_type1").val() != '0'){
			$.get(
					"./shop_style_type"
					, {stt_type_no:$("#style_type1").val()}
					, function(data, status){
						$("#product_size_thead").empty();
						$("#product_size_tbody").empty();
						$("#product_size_thead").append("<th>사이즈</th>");
						$("#product_size_tbody").append("<tr id='product_size_tbody_1'><td><input type='text' class='form-control' id='trsize0' name='sps_size'></td></tr>");
						$.each(data, function(index,vo){
							$("#product_size_thead").append("<th>"+vo.stt_size_nm+"</th>");
							$("#product_size_tbody_1").append("<td><input type='text' class='form-control' name='"+vo.stt_size+"'></td>");
						});
						
					}
					, "json"
			);//get
		} else{
			$("#product_size_thead").empty();
			$("#product_size_tbody").empty();
			$("#product_size_thead").append("<th>사이즈</th>");
			$("#product_size_tbody").append("<tr id='product_size_tbody_1'><td><input type='text' class='form-control' id='trsize0' name='sps_size'></td></tr>");
		}//if
	});//click
});//ready

$(document).ready(function(){
	var trcnt = 1;
	$("#product_color_add_row").click(function(){
		var color_thCnt = 0;
		var table_row = "";
		color_thCnt = $("#product_color thead tr th").length;
		for (var i = 0; i < color_thCnt; i++) {
			table_row = table_row +"<td><input id=trcolor"+trcnt+" type='text' class='form-control' name='spc_color'></td>";
		}
		$("#product_color_tbody").append("<tr>"+table_row+"</tr>");
		trcnt++;
	});
	$('#product_color_add_remove').click(function(){
		if (trcnt > 1) {
			$('#product_color > tbody:last > tr:last').remove();
			trcnt--;
		}
	});
	
});

$(document).ready(function(){
	var trcnt = 1;
	$("#product_size_add_row").click(function(){
		var size_thCnt = 0;
		var table_row = "";
		size_thCnt = $("#product_size thead tr th").length;
		for (var i = 0; i < size_thCnt; i++) {
			tbname = $("#product_size_tbody_1 td input").eq(i).attr("name");
			table_row = table_row +"<td><input id=trsize"+trcnt+" type='text' class='form-control' name='"+tbname+"'></td>";
		}
		$("#product_size_tbody").append("<tr>"+table_row+"</tr>");
		trcnt++;
	});
	$('#product_size_add_remove').click(function(){
		if (trcnt > 1) {
			$('#product_size > tbody:last > tr:last').remove();
			trcnt--;
		}
	});
	
});





$(document).ready(function() { 
	$("input:radio[name=spt_delivery]").click(function() { 
		var del_radio = $('input:radio[name=spt_delivery]:checked').val();
		var del_price_txt = $("#spt_delivery_price")
		 	if (del_radio == 0) {
		 		del_price_txt.attr("disabled", "disabled");
		 		del_price_txt.val("0");
			}else if (del_radio == 1) {
				del_price_txt.removeAttr("disabled");
				del_price_txt.val("");
			}
	    }) 
});//배송비구분

$(document).ready(function(){
	$("#product_add_thumbnail").change(function(){

		var file_kind = this.value.lastIndexOf('.');
		var file_name = this.value.substring(file_kind+1,this.length);
		var file_type = file_name.toLowerCase();
		
		var check_file_type = ['jpg','gif','png','jpeg','bmp'];
		
		
		
		if(check_file_type.indexOf(file_type)==-1){
			alert('이미지 파일만 선택할 수 있습니다.');        
			
			var parentObj  = this.parentNode
	        var node = parentObj.replaceChild(this.cloneNode(true),this);

	        return;
		}else if (this.files && this.files[0]) {
	    	
	        var reader = new FileReader();
	 
	        reader.onload = function (e) {
	            $('#img_preview').attr('src', e.target.result);
	        }
	 
	        reader.readAsDataURL(this.files[0]);
	    }


	    
	});
});//메인이미지 미리보기


//등록 버튼
$(document).ready(function() {
	$("#productInsBtn").click(function() {
		if($("#product_type1").val() == '0'){
			alert("제품분류-대분류는 필수 선택 사항입니다.");
			$("#product_type1").focus();
			return;
		}
		if($("#product_type2").val() == '0'){
			alert("제품분류-소분류는 필수 선택 사항입니다.");
			$("#product_type2").focus();
			return;
		}
		if($.trim($("#spt_name").val()) == ''){
			alert("상품명은 필수 입력 사항입니다.");
			$("#spt_name").focus();
			return;
		}
		if($("#style_type1").val() == '0'){
			alert("제품스타일은 필수 선택 사항입니다.");
			$("#style_type1").focus();
			return;
		}
		if($.trim($("#spt_price").val()) == ''){
			alert("상품가격은 필수 입력 사항입니다.");
			$("#spt_price").focus();
			return;
		}
		if($.trim($("#spt_count").val()) == ''){
			alert("상품수량은 필수 입력 사항입니다.");
			$("#spt_count").focus();
			return;
		}
		if(!($("input:radio[name=spt_delivery]").is(":checked"))){
			alert("배송구분은 필수 선택 사항입니다.");
			return;
		}
		if($('input:radio[name=spt_delivery]:checked').val() == 0){
			$("#spt_delivery_price").val("0");
		}
		if($('input:radio[name=spt_delivery]:checked').val() == 1){
			if($.trim($('#spt_delivery_price').val()) == ''){
				alert("배송구분이 구매자 부담일때 배송비는 필수 입력 사항입니다.");
				$("#spt_delivery_price").focus();
				return;
			}
		}
		if(!($("input:radio[name=spt_status]").is(":checked"))){
			alert("배송구분은 필수 선택 사항입니다.");
			return;
		}
		if($('#product_add_thumbnail').val()==''){
			alert("메인이미지는 필수 입력 사항입니다.");
			return;
		}
		var cnts = CKEDITOR.instances.product_add_detail;
		if(cnts.getData() == ""){
			alert("내용을 확인 하세요.");
			cnts.focus();
			return;
		}

		var goYN = confirm("글을 입력 하시겠습니까?");
		if(goYN == false){
			return;
		}

		var form = new FormData(document.getElementById("product_add_form"));
		form.append('stt_type_no',$("#style_type1").val());
		form.append('spt_seller_no',$("#hiduserNo").val());
		form.append('spt_ins_no',$("#hiduserNo").val());
		form.append('spt_seller_id',$("#hiduserID").val());
		form.append('spt_detail',cnts.getData());
		$.ajax({
			url:"./shop_product_ins"
			, data:form
			, dataType:'json'
			, processData:false
			, contentType:false
			, type:'POST'
			, success:function(result){
				if(result > 0){
					alert("글이 저장되었습니다.");
					location.href="./shop_main";
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