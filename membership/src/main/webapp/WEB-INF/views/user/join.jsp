<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="/res/css/user/join.css?ver=1">

<div id="main_div">
	<div class="main_logo">
		<img alt="" src="/res/img/title_logo.png">
	</div>
	<div class="input_div">
		<div>
			<div class="textId">아이디</div>
			<div>
				<input class="user_id" type="text" name="user_id"
					placeholder="이메일 형식">
			</div>
		</div>
		<div>
			<div class="textPw">비밀번호</div>
			<div>
				<input class="user_pw" type="password" name="user_pw">
			</div>
		</div>
		<div>
			<div class="textPw">비밀번호 확인</div>
			<div>
				<input class="user_ckPw" type="password" name="user_ckPw">
			</div>
		</div>
		<div>
			<div class="textName">이름</div>
			<div>
				<input class="user_name" type="text" name="user_nm">
			</div>
		</div>
		<div>
			<div class="textPw">휴대전화</div>
			<div>
				<input class="user_ph" type="text" name="user_ph" placeholder="-제외">
			</div>
		</div>
		<div>
			<div class="textNick">닉네임</div>
			<div>
				<input class="user_nick" type="text" name="user_nick">
			</div>
		</div>
		<div>
			<div class="flex_div">
				<div>
					<input type="text" id="postcode" placeholder="우편번호">
				</div>
				<div>
					<input class="addrBtn" type="button" onclick="execDaumPostcode()" value="우편번호 찾기">
				</div>
			</div>
			<input type="text" id="roadAddr" placeholder="주소"><br>
			<input type="text" id="detailAddr" placeholder="상세주소">
			<input type="text" id="extraAddr" placeholder="참고항목">
		</div>
		<div>
			<div>
				<input class="join_btn" type="submit" value="회원가입">
			</div>
		</div>
	</div>
</div>

<script defer src="/res/js/user/join.js?ver=6"></script>
<script defer src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script defer
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
