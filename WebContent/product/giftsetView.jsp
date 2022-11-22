<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



<%@ include file="/include/connection.jsp" %>


<style>
	#div_item {
		display:inline-block;
		position:absolute;
	}
	#div_itemImg {
		display:inline-block;
		position:relative;
		margin-right:150px;
	}
	#div_itemContents {
		background-color:lightyellow;
		width:450px;
		display:inline-block;
		position:absolute;
	}
	#div_item img {
		margin-left:90px;
		width:705px;
		object-fit:cover;
	}
</style>
<script>
	$(document).ready(function () {
		
	});
</script>
<section class="container">

<%@ include file="/include/header.jsp" %>

<%@ include file="/include/aside.jsp" %>

<main class="main1">

<div id="div_item">
	<div id="div_itemImg"><img src="/upload/${filename}"></div>
	<div id="div_itemContents">
		<div>${name}</div>
		<div>판매가 ${price}</div>
		<div>배송비 ${delivery} (30,000원 이상 구매 시 무료)</div>
		<div>선물포장선택
			<select>
				<option selected>- [필수] 옵션을 선택해 주세요 -</option>
				<option disabled>---------------</option>
				<option>${option1}</option>
				<c:if test="${!option2.equals('')}"><option>${option2}</option></c:if>
				<c:if test="${!option3.equals('')}"><option>${option3}</option></c:if>
				<c:if test="${!option4.equals('')}"><option>${option4}</option></c:if>
				<c:if test="${!option5.equals('')}"><option>${option5}</option></c:if>
			</select>
		</div>
		<div></div>
		<div></div>
	</div>
</div>

</main>

<%@ include file="/include/footer.jsp" %>
</section>