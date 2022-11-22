<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/include/connection.jsp" %>
   




<script>
	function option() {
		$.ajax({
			url: "beans_option", //전송받을 페이지 경로
			type: "post", //데이터 읽어오는 방식
			dataType: "text", //데이터 방식
			data: "option="+beansOption.value+"&price=${price}&name=${itemName}",
			//data: {"option":$("#beansOption").val(),"price":${price}},
			error:function(){ //실패일 경우
				alert("실패");
			},
			success:function(text){ //성공일 경우
				$(".span_weight").html(text);
			}
		});
	}
</script>

<section class="container2">

<%@ include file="/include/header.jsp" %>

<%@ include file="/include/aside.jsp" %>

<main class="main1" >
<div class="join_div2">
<span class="home"><a href="/">HOME</a></span> > 원두
</div>

<div id="div_item">
	<div id="div_itemImg" class="view_image"><img src="/image/${itemImg}"></div>
	<div class="item_buy">
		<div id="div_itemName">${itemName}</div>
	<div class="view_font">
		<div id="div_itemPrice">판매가 ${itemPrice}원</div>
		<div id="div_itemDelivery">배송비 </div><div class="div_deli">${itemDelivery}원 (30,000원 이상 구매 시 무료)</div>
		<hr class="view_hr">
		<div class="beans_option">분쇄상태
			<select id="beansOption" name="beansOption" onchange="option()">
				<option selected disabled >- [필수] 옵션을 선택해주세요 -</option>
				<option disabled>---------------</option>
				<option value="op1">분쇄 안함 Whole Bean</option>
				<option value="op2">핸드 드립 Hand Drip</option>
				<option value="op3">커피 메이커 Coffee Maker</option>
				<option value="op4">가정용 더치 Dutch</option>
				<option value="op5">모카 포트 Moka Pot</option>
				<option value="op6">가정용 에스프레소 ESP Machine</option>
			</select>
		</div>
		<div class="weight">중량 </div><span class="span_weight">200g&nbsp;&nbsp;&nbsp; 500g</span>
		<div id="div_weightText">[필수] 옵션을 선택해주세요</div>
		<hr class="view_hr">
		<div id="div_ordercountText">(최소주문수량 1개 이상)</div>
		</div>
		<div>
		<input type="hidden" id="checkbox1" name="checkbox1" value="">
		<input type="hidden" id="checkbox2" name="checkbox2" value="">
		<input type="hidden" id="checkbox3" name="checkbox3" value="">
		<input type="hidden" id="checkbox4" name="checkbox4" value="">
		<input type="hidden" id="checkbox5" name="checkbox5" value="">
		<input type="hidden" id="checkbox6" name="checkbox6" value="">
		<input type="hidden" id="checkbox7" name="checkbox7" value="">
		<input type="hidden" id="checkbox8" name="checkbox8" value="">
		<input type="hidden" id="checkbox9" name="checkbox9" value="">
		<input type="hidden" id="checkbox10" name="checkbox10" value="">
		<input type="hidden" id="checkbox11" name="checkbox11" value="">
		<input type="hidden" id="checkbox12" name="checkbox12" value="">
		</div>
		<div id="div_itemSelect">
			<div id="div_itemSelect2"></div>
		</div>
		<div id="div_allPrice"><label id="label_price"></label></div>
		<div id="div_buy"><button class="view_btn1">바로 구매하기</button></div>
		<div id="div_cartbox">
		</div>
		<div id="div_addCart"><button onclick="addcart()" class="view_btn2">ADD TO CART</button></div>
		<form action="/product/BeansWishlist" method="post">
		<input type="hidden" name="item_uid" value="${itemUid}">
		<input type="hidden" name="item_user" value="${sessionScope.userid}">
		<input type="hidden" name="item_name" value="${itemName}">
		<input type="hidden" name="item_price" value="${price}">
		<input type="hidden" name="item_delivery" value="${delivery}">
		<div id="div_wishList"><button class="view_btn3">WISH LIST</button></div>
		</form>
	</div>
</div>

</main>

<%@ include file="/include/footer.jsp" %>

</section>

<script>
    function addcart() {
        var new_form = $('<form></form>');
 
        new_form.attr("name", "addcart");
        new_form.attr("method", "post");
        new_form.attr("action", "/product/BeansAddcart");
 
        new_form.append($('<input/>', {type: 'hidden', name: 'uid', value: itemUid}));
        new_form.append($('<input/>', {type: 'hidden', name: 'userid', value: sessionScopr.userid}));
        if(checkbox1.value != "") { //1번 옵션 선택
        	new_form.append($('<input/>', {type: 'hidden', name: 'addcart1', value: checkbox1.value}));
        	new_form.append($('<input/>', {type: 'hidden', name: 'addcart1_c', value: itemCount1.value}));
        }
        if(checkbox2.value != "") { //2번 옵션 선택
	        new_form.append($('<input/>', {type: 'hidden', name: 'addcart2', value: checkbox2.value}));
	        new_form.append($('<input/>', {type: 'hidden', name: 'addcart2_c', value: itemCount2.value}));
        }
        if(checkbox3.value != "") { //3번 옵션 선택
        	new_form.append($('<input/>', {type: 'hidden', name: 'addcart1', value: checkbox1.value}));
        	new_form.append($('<input/>', {type: 'hidden', name: 'addcart1_c', value: itemCount1.value}));
        }
        if(checkbox4.value != "") { //4번 옵션 선택
	        new_form.append($('<input/>', {type: 'hidden', name: 'addcart2', value: checkbox2.value}));
	        new_form.append($('<input/>', {type: 'hidden', name: 'addcart2_c', value: itemCount2.value}));
        }
        if(checkbox5.value != "") { //5번 옵션 선택
        	new_form.append($('<input/>', {type: 'hidden', name: 'addcart1', value: checkbox1.value}));
        	new_form.append($('<input/>', {type: 'hidden', name: 'addcart1_c', value: itemCount1.value}));
        }
        if(checkbox6.value != "") { //6번 옵션 선택
	        new_form.append($('<input/>', {type: 'hidden', name: 'addcart2', value: checkbox2.value}));
	        new_form.append($('<input/>', {type: 'hidden', name: 'addcart2_c', value: itemCount2.value}));
        }
        if(checkbox7.value != "") { //7번 옵션 선택
        	new_form.append($('<input/>', {type: 'hidden', name: 'addcart1', value: checkbox1.value}));
        	new_form.append($('<input/>', {type: 'hidden', name: 'addcart1_c', value: itemCount1.value}));
        }
        if(checkbox8.value != "") { //8번 옵션 선택
	        new_form.append($('<input/>', {type: 'hidden', name: 'addcart2', value: checkbox2.value}));
	        new_form.append($('<input/>', {type: 'hidden', name: 'addcart2_c', value: itemCount2.value}));
        }
        if(checkbox9.value != "") { //9번 옵션 선택
        	new_form.append($('<input/>', {type: 'hidden', name: 'addcart1', value: checkbox1.value}));
        	new_form.append($('<input/>', {type: 'hidden', name: 'addcart1_c', value: itemCount1.value}));
        }
        if(checkbox10.value != "") { //10번 옵션 선택
	        new_form.append($('<input/>', {type: 'hidden', name: 'addcart2', value: checkbox2.value}));
	        new_form.append($('<input/>', {type: 'hidden', name: 'addcart2_c', value: itemCount2.value}));
        }
        if(checkbox11.value != "") { //11번 옵션 선택
        	new_form.append($('<input/>', {type: 'hidden', name: 'addcart1', value: checkbox1.value}));
        	new_form.append($('<input/>', {type: 'hidden', name: 'addcart1_c', value: itemCount1.value}));
        }
        if(checkbox12.value != "") { //12번 옵션 선택
	        new_form.append($('<input/>', {type: 'hidden', name: 'addcart2', value: checkbox2.value}));
	        new_form.append($('<input/>', {type: 'hidden', name: 'addcart2_c', value: itemCount2.value}));
        }
        
        new_form.appendTo('body');
 
        new_form.submit();
    }
</script>