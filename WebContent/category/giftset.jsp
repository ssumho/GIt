<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ include file ="/include/connection.jsp" %>

<section class="container">


<%@ include file ="/include/header.jsp" %>

<%@ include file ="/include/aside.jsp" %>


<main class="main1" >

<div class="join_div2">
<span class="home"><a href="/">HOME</a></span> > 선물세트
<div id="div_list">
	<div id="div_title">
		<c:choose>
			<c:when test="${category eq 'beans'||category eq 'blend'||category eq 'estate'||category eq 'easytomake'}">
				원두
			</c:when>
			<c:when test="${category eq 'dripbag'}">
				드립백
			</c:when>
			<c:when test="${category eq 'coldbrew'}">
				콜드브루 RTD
			</c:when>
			<c:when test="${category eq 'capsule'}">
				캡슐
			</c:when>
		</c:choose>
	</div>
	<div id="div_beansCategory">
		<c:if test="${category eq 'beans'||category eq 'blend'||category eq 'estate'||category eq 'easytomake'}">
			<a href="/category/blend">시그니처 블렌드</a>
			&nbsp;&nbsp;&nbsp;
			<a href="/category/estate">싱글 에스테이트</a>
			&nbsp;&nbsp;&nbsp;
			<a href="/category/easytomake">EASY TO MAKE</a>
		</c:if>
	</div>
	<div id="div_count">${productCount} items in this category.</div>
	<div id="div_sort">
		<a href="/category/${category}">신상품순</a> | 
		<a href="/category/${category}?sort_method=1">이름순</a> | 
		<a href="/category/${category}?sort_method=2">낮은 가격순</a> | 
		<a href="/category/${category}?sort_method=3">높은 가격순</a>
	</div>
	<form action="/category/regist" method="post">
	<input type="hidden" name="category" value="${category}">
	<input type="hidden" name="session_level" value="${sessionScope.level}">
	<div><button>글쓰기</button></div>
	</form>
	<c:forEach var="list" items="${list}">
		<div id="div_item">
			<ul>
				<li><a href=""><img src=""></a></li>
				<li><a href="/product/${category}?no=${list.uid}">${list.name}</a></li>
				<li>${list.subname}</li>
				<li><fmt:formatNumber value="${list.price}"/>원</li>
			</ul>
		</div>
	</c:forEach>
</div>



</main>

<%@ include file = "/include/footer.jsp" %>

</section>




</body>
</html>

