<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file ="/include/connection.jsp" %>
<section class="container2">

<%@ include file="/include/header.jsp" %>
<%@ include file ="/include/aside.jsp" %>
<main class="main1">



<style>
	.div_admin_menu {
		width:1300px;
		margin-top:50px;
		margin-left:50px;
	}
	.tb_iteminfo {
		border:1px solid #d9d9d9;
	}
	.div_itemImg {
		float:left;
		margin-right:30px;
	}
	.div_iteminfo {
		margin-top:10px;
		margin-botton:10px;
		margin-left:30px;
	}
	.div_clear {
		clear:both;
		margin-top:50px;
	}
	.frm_btn {
		border:1px solid #d9d9d9;
		cursor:pointer;
		position: relative;
		top: -34px;
	}
	.div_contents {
		padding:30px;
	}
	.div_btn_table {
		margin-top:30px;
	}
	.div_post_table {
		margin-top:30px;
	}
	.post_table {
		width:1280px;
		border:1px solid #d9d9d9;
		border-collapse:collapse;
	}
	.post_table td {
		border:1px solid #d9d9d9;
		border-collapse:collapse;
	}
	
	.font-s {
		font-size: 13px;
	}
	
	.hello {
		margin-left: 57px;
	}
</style>

<script>
	function qnadel() {
		if(confirm("삭제하시겠습니까?")) {
			return true;
		} else {
			return false;
		}
	}
</script>

<div class="join_div2">
<span class="home"><a href="/">HOME</a></span> > Q&A
</div>
<h3 class="join_title_main"><a href="/board/notice">Q&A</a></h3><br>

<div class="div_admin_menu">
	<c:if test="${itemName != null}">
		<div class="div_iteminfobox">
			<table class="tb_iteminfo" width=1280px align=center>
				<tr>
					<td rowspan=4><img src="/upload/${itemFile_s}"></td>
					<td rowspan=4 width=50px></td>
					<td class="font-s" width=1150px>${itemName}</td>
				</tr>
				<tr>
					<td class="font-s">${itemPrice}원</td>
				</tr>
				<tr>
					<td><hr class="thumb_hr"></td>
				</tr>
				<tr>
					<td><input type="button" onclick="location.href='/product/${category}?no=${itemUid}'" value="상품 상세보기 >" style="cursor:pointer;"></td>
				</tr>
					
				
			</table>		
		</div>
	</c:if>
	<div class="div_clear">
		<div><hr class="thumb_hr"></div>
		<div>
			<table>
				<tr>
					<td class="font-s" width=100px>제목</td>
					<td class="font-s">${subject}</td>
				</tr>
			</table>
		</div>
		<div><hr class="thumb_hr"></div>
		<div> 
			<table>
				<tr>
					<td class="font-s" width=100px>작성자</td>
					<td class="font-s" >${name}</td>
				</tr>
			</table>
		</div>
		<div><hr class="thumb_hr"></div>
		<div>
			<table>
				<tr>
					<td class="font-s" width=300px>작성일&nbsp;&nbsp;&nbsp;<span class="hello">${signdate}</span></td>
					<td class="font-s">조회수&nbsp;&nbsp;&nbsp;${ref}</td>
				</tr>
			</table>
		</div>
		<div><hr class="thumb_hr"></div>
		<div class="div_contents">${contents}</div>
		<div><hr class="thumb_hr"></div>

		<div class="div_btn_table">
			<table width=1300px>
				<tr>
					<td align=left>
						<button class="frm_btn" type="button" onclick="location.href='/board/qna'">목록</button>
					</td>

					<form action="/board/qnamodify" method="post">
					<td width=45px align=center>
						
							<c:if test="${userid == sessionScope.userid}">
								<input type="hidden" name="uid" value="${uid}">
								<input type="hidden" name="userid" value="${userid}">
								<input type="hidden" name="item_uid" value="${itemUid}">
								<button class="frm_btn">수정</button>
							</c:if>
						
					</td>
					</form>
					
					<form action="/board/qnadelete" method="post" onsubmit="return qnadel()">
					<td width=45px align=center>
					
							<c:if test="${userid == sessionScope.userid || sessionScope.level == '10'}">
								<input type="hidden" name="uid" value="${uid}">
								<input type="hidden" name="userid" value="${userid}">
								<button class="frm_btn"">삭제</button>
							</c:if>
						
					</td>
					</form>
					<form action="/board/reply" method="post">
					<td width=45px align=center>
						
							<input type="hidden" name="uid" value="${uid}">
							<input type="hidden" name="reply_id" value="${sessionScope.userid}">
							<input type="hidden" name="reply_name" value="${sessionScope.name}">
							<input type="hidden" name="item_uid" value="${itemUid}">
							<input type="hidden" name="item_name" value="${itemName}">
							<input type="hidden" name="fid" value="${fid}">
							<input type="hidden" name="thread" value="${thread}">
							<input type="hidden" name="session_level" value="${sessionScope.level}">
							<button class="frm_btn" style="background-color: #343434; color: white; border: 0;">답변</button>
						
					</td>
					</form>
				</tr>
			</table>
		</div>
	</div>

</div>



</main>

<%@ include file = "/include/footer.jsp" %>



</section>









