<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="/res/css/user/login.css?ver=2">

<div id="main_div">
	<div class="title_div">
		<div>
			<img class="main_logo" alt="" src="/res/img/title_logo.png">
		</div>
		<div class="title">사내 메신저</div>
	</div>
	<div class="login_div">
		<div>
			<input class="user_id" type="text">
		</div>
		<div>
			<input class="user_pw" type="password">
		</div>
		<div>
			<input class="login_btn" type="button" value="로그인">
		</div>
		<div id="naver_id_login">
			<a href="${url}"> <img
				src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png" /></a>
		</div>
	</div>
	<div class="find_div">
		<div class="findSub_div">
			<div>아이디 찾기</div>
			<div>비밀번호 찾기</div>
			<div class="move_join">회원가입</div>
		</div>
	</div>
</div>


<script defer src="/res/js/user/login.js?ver=8"></script>