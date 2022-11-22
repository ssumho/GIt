<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<%@ include file="/include/connection.jsp" %>

<header>
<span class="menu1">
<c:if test="${sessionScope.level == '10' }"><span style="color: blue; font-weight: bold;">관리자</span>&nbsp;<a href="/admin/index">[관리자페이지]</a></c:if>
<c:choose>
<c:when test="${sessionScope.userid == null }">
<a href="/member/login">LOGIN</a> 
<a href="/member/join">JOIN</a> 
<a href="/myshop/order/list">ORDER</a>
<a href="/myshop/index">MYPAGE</a> 
<a href="/order/basket">MYCART<img src="/image/btn_cart.png"></a> 
<a href="/product/search">SEARCH<img src="/image/btn_search.png"></a>
<a href="https://en.momos.co.kr/" target="_blank" class="header_en" ><img src="/image/en_us.png" class="header_en_img"></a>
</c:when>
<c:otherwise>
<a href="/member/logout">LOGOUT</a> 
<a href="/member/modify">MODIFY</a> 
<a href="/myshop/order/list">ORDER</a>
<a href="/myshop/index">MYPAGE</a> 
<a href="/order/basket">MYCART<img src="/image/btn_cart.png"></a> 
<a href="/product/search">SEARCH<img src="/image/btn_search.png"></a>
<a href="https://en.momos.co.kr/" target="_blank" class="header_en"><img src="/image/en_us.png" class="header_en_img"></a>

</c:otherwise>
</c:choose>

</span>
</header>