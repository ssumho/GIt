<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.4.1.min.js"></script>
<style>
	#div_registForm {
		display:inline-block;
		position:absolute;
	}
	#div_option2,#div_option3,#div_option4,#div_option5 {
		display:none;
	}
	.span_option {
		cursor:pointer;
	}
</style>
<script>
	function cate1(cate) {
		$.ajax({
			url: "regist_category1", //전송받을 페이지 경로
			type: "post", //데이터 읽어오는 방식
			dataType: "text", //데이터 방식
			data: "category1="+cate, //데이터 전달
			error:function(){ //실패일 경우
				alert("실패");
			},
			success:function(text){ //성공일 경우
				$("#category2").html(text);
			}
		});
	}
	function productRegist() {
		$.ajax({
			url: "regist_productnameBlank", //전송받을 페이지 경로
			type: "post", //데이터 읽어오는 방식
			dataType: "text", //데이터 방식
			data: "productName="+$("#productName").val(), //데이터 전달
			error:function(){ //실패일 경우
				alert("실패");
			},
			success:function(text){ //성공일 경우
				if(text == 1){
					$("#productName_text").html("<font color=red>필수 항목입니다.</font>");
				} else if(text == 0) {
					$("#productName_text").html("");
				}				
			}
		});
		$.ajax({
			url: "regist_productsubnameBlank", //전송받을 페이지 경로
			type: "post", //데이터 읽어오는 방식
			dataType: "text", //데이터 방식
			data: "productSubname="+$("#productSubname").val(), //데이터 전달
			error:function(){ //실패일 경우
				alert("실패");
			},
			success:function(text){ //성공일 경우
				if(text == 1){
					$("#productSubname_text").html("<font color=red>필수 항목입니다.</font>");
				} else if(text == 0) {
					$("#productSubname_text").html("");
				}				
			}
		});
		$.ajax({
			url: "regist_productpriceBlank", //전송받을 페이지 경로
			type: "post", //데이터 읽어오는 방식
			dataType: "text", //데이터 방식
			data: "productPrice="+$("#productPrice").val(), //데이터 전달
			error:function(){ //실패일 경우
				alert("실패");
			},
			success:function(text){ //성공일 경우
				if(text == 1){
					$("#productPrice_text").html("<font color=red>필수 항목입니다.</font>");
				} else if(text == 0) {
					$("#productPrice_text").html("");
				}				
			}
		});
		$.ajax({
			url: "regist_productdeliveryBlank", //전송받을 페이지 경로
			type: "post", //데이터 읽어오는 방식
			dataType: "text", //데이터 방식
			data: "productDelivery="+$("#productDelivery").val(), //데이터 전달
			error:function(){ //실패일 경우
				alert("실패");
			},
			success:function(text){ //성공일 경우
				if(text == 1){
					$("#productDelivery_text").html("<font color=red>필수 항목입니다.</font>");
				} else if(text == 0) {
					$("#productDelivery_text").html("");
				}				
			}
		});
		if(productName.value == "") {
			return false;
		}
		if(productSubname.value == "") {
			return false;
		}
		if(productPrice.value == "") {
			return false;
		}
		if(productDelivery.value == "") {
			return false;
		}
	}
</script>

<a href="/">[홈]</a>
<div id="div_registForm">
	<form action="/category/regist_insert" method="post" enctype="multipart/form-data" onsubmit="return productRegist()">
	<div>
		<select name="productCate1" onchange="cate1(this.value)">
			<option selected disabled>- [필수] 카테고리를 선택해주세요 -</option>
			<option disabled>---------------</option>
			<option value="beans">원두</option>
			<option value="dripbag">드립백</option>
			<option value="coldbrew">콜드브루 RTD</option>
			<option value="capsule">캡슐</option>
		</select>
		<span id="category2">
		</span>
	</div>
	<div>선물세트 <input type="checkbox" name="productGiftset"></div>
	<div>상품명 <input id="productName" name="productName" value=""><span id="productName_text"></span></div>
	<div>상품 설명 <input id="productSubname" name="productSubname" value=""><span id="productSubname_text"></span></div>
	<div>가격 <input id="productPrice" name="productPrice" value="">원<span id="productPrice_text"></span></div>
	<div>배송료 <input id="productDelivery" name="productDelivery" value="">원<span id="productDelivery_text"></span></div>
	<div><input type="file" name="productImg"></div>
	<div><button>상품등록</button></div>
	</form>
</div>
