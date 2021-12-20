<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="/res/css/chat/changeInfo.css?ver=3">
<div>
${id.i_user}
</div>
<input class="i_user" type="hidden" value=${id.i_user }>
<div id="changeInfo_div">
	<div class="top_div">
		<img class="main_logo" alt="" src="/res/img/title_logo.png">
	</div>
	<div class="sub_div">
		<div>이름 변경</div>
		<div>비밀번호 변경</div>
		<div>별명 변경</div>
		<div>주소 변경</div>
	</div>
	
	
	<div>
		<div>이름 변경</div>
		<div>
			<div>변경할 이름</div>
			<input class="changeNm" type="text" placeholder="변경할 이름">
		</div>
		<button class="changeNmBtn">이름 변경</button>
	</div>
	
	<div>
		<div>비밀번호 변경</div>
		<div>
			<div>현재 비밀번호</div>
			<input class="nowPw" type="password" placeholder="현재 비밀번호" name="pw">
		</div>
		<div>
			<div>새 비밀번호</div>
			<div>
				<input class="new_pw" type="password" placeholder="새 비밀번호" name="new_pw">
				<input class="new_chkPw" type="password" placeholder="새 비밀번호 확인" name="new_chkPw">
			</div>
		</div>
		<button class="changePwBtn">비밀번호 변경</button>
	</div>
	
	<div>
		<div>별명 변경</div>
		<div>
			<div>변경할 별명</div>
			<input class="changeNick" type="text" placeholder="변경할 별명" name="nick">
		</div>
		<button class="changeNickBtn">별명 변경</button>
	</div>
	<div>
		<div>주소 변경</div>
		<div><input class="changeAddr" type="text"></div>
		<div>주소 변경</div>
	</div>
</div>






<script defer src="/res/js/chat/changeInfo.js?ver=27"></script>

