<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta name = "google-signin-client-id" content="3929581950-s7nalaib25kg6qhv9j3eiv4ifga0ru1s.apps.googleusercontent.com">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery-1.11.1.min.js" type="text/javascript"></script>


</head>
<body>


<section class="container">


<%@ include file ="/include/header.jsp" %>

<%@ include file ="/include/aside.jsp" %>


<main class="main1" style="border: 1px solid #D7D5D5; width: 1390px;">
<h1 style="font-size: 20px; font-family: sans-serif; text-align: center;">회원로그인</h1>
<center>
<table>
	<tr>
		<td><input class="login_input" type="text" placeholder="아이디"></td>
		<td rowspan="2"><a href="/"><img src="/image/btn_login.gif"></a></td>
	</tr>
	<tr>
		<td><input class="login_input" type="password" placeholder="비밀번호"></td>	
	</tr>
	<tr>
		<td class="login_img1"><img src="/image/ico_access.gif" style="padding-left: 5px;"> 보안접속</td>
	</tr>
	<tr>
		<td class="login_img2">
			<img src="/image/btn_right.gif"> 아이디찾기 
			<img src="/image/btn_right.gif"> 비밀번호찾기
		</td>
	</tr>
	<tr>
		<td colspan="2" id="GgCustomLogin" style="padding-bottom: 18px;">
			<a href="javascript:void(0)"><img src="/image/btn_google_login.gif"></a>
			<img src="/image/btn_kakao_login.gif">
		</td>
	</tr>
</table>
	<hr class="login_hr">
<table>
	<tr>
		<td style="word-spacing: -1px; padding: 10px 90px 0px 0px; color: #5B5B5C; padding-top: 18px;">회원가입을 하시면 다양하고  특별한<br>혜택이 준비되어 있습니다.</td>
		<td><img src="/image/btn_join.gif"></td>
	</tr>
</table>

<h3 style="padding-top: 50px; word-spacing: 1px;">비회원 로그인</h3>
<table style="padding-top: 5px; ">
	<tr>
		<td colspan="2" style="word-spacing: 1px; color: #757575; padding-bottom: 10px;">비회원의 경우, 주문시의 주문번호로 주문조회가 가능합니다.</td>
	</tr>
	<tr>
		<td width="150px;">
			주문자명
		</td>
		<td>
			<input type="text" class="order_input">
		</td>
	</tr>
	<tr>
		<td width="150px;">
			주문번호
		</td>
		<td>
			<input type="text" placeholder="주문번호" class="order_input">
		</td>
	</tr>
	<tr>
		<td width="150px;" style="word-spacing: 1px;">
			비회원주문 비밀번호
		</td>
		<td>
			<input type="text" class="order_input">
		</td>
	</tr>
	<tr>
		<td></td>
		<td><img src="/image/btn_nomember_login.gif" align="right"></td>
	</tr>
</table>
<br>
<br>
</center>
</main>


<%@ include file = "/include/footer.jsp" %>

</section>

<script>

//처음 실행하는 함수
function init() {
	gapi.load('auth2', function() {
		gapi.auth2.init();
		options = new gapi.auth2.SigninOptionsBuilder();
		options.setPrompt('select_account');
        // 추가는 Oauth 승인 권한 추가 후 띄어쓰기 기준으로 추가
		options.setScope('email profile openid https://www.googleapis.com/auth/user.birthday.read');
        // 인스턴스의 함수 호출 - element에 로그인 기능 추가
        // GgCustomLogin은 li태그안에 있는 ID, 위에 설정한 options와 아래 성공,실패시 실행하는 함수들
		gapi.auth2.getAuthInstance().attachClickHandler('GgCustomLogin', options, onSignIn, onSignInFailure);
	})
}

function onSignIn(googleUser) {
	var access_token = googleUser.getAuthResponse().access_token
	$.ajax({
    	// people api를 이용하여 프로필 및 생년월일에 대한 선택동의후 가져온다.
		url: 'https://people.googleapis.com/v1/people/me'
        // key에 자신의 API 키를 넣습니다.
		, data: {personFields:'birthdays', key:'AIzaSyDQM7aYdy9ksT7wuNzfN0KkbAOwro7RNfw', 'access_token': access_token}
		, method:'GET'
	})
	.done(function(e){
        //프로필을 가져온다.
		var profile = googleUser.getBasicProfile();
		console.log(profile)
	})
	.fail(function(e){
		console.log(e);
	})
}
function onSignInFailure(t){		
	console.log(t);
}
</script>
<script src="https://apis.google.com/js/platform.js?onload=init" async defer></script>

</body>
</html>


</body>
</html>

