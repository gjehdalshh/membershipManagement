<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="/res/css/chat/home.css?ver=12">

<input class="setionIuser" type="hidden" value="${id.i_user}">

<div id="mw_temp" class="mw">
	<div class="bg" onclick="window_close()">
		<!--전체를 깔아주는 div-->
	</div>
	<div class="fg">
		<div onclick="window_close()" class="window_close">
			<img class="modal_close" alt="" src="/res/img/x.png">
		</div>
		<div class="friendInsertDiv">
			<div class="friendInsertTitle">친구 추가</div>
			<div class="flex_border">
				<div onclick="friendInsert(1)" class="phInsert">연락처로 추가</div>
				<div onclick="friendInsert(2)" class="idInsert">ID로 추가</div>
			</div>
			<div class="insertState1">
				<div>
					<div>
						<input class="friendName" type="text" name="friendName" placeholder="친구이름">
					</div>
					<div>
						<input class="friendPh" type="text" name="friendPh" placeholder="전화번호">
					</div>
					<div class="notice">친구의 이름과 전화번호를 입력해주세요.</div>
				</div>
				<div>
					<input onclick="friendInsertBtn()" class="friendNameInsertBtn" type="button" value="친구 추가">
				</div>
			</div>
			<div class="insertState2">
				<div>
					<input class="friendId" type="text" placeholder="ID">
				</div>
				<div class="notice">아이디 검색응 허용한 친구만 찾을 수 있습니다.</div>
				<div>
					<input onclick="" class="friendIdInsertBtn" type="button" value="친구 추가">
				</div>
			</div>
		</div>
	</div>
</div>

<div id="main_div">
	<div class="title_div">
		<div>
			<img class="main_logo" alt="" src="/res/img/title_logo.png">
		</div>
	</div>
	<div class="flex">
		<div class="left_div">
			<div>
				<img class="person_img" alt="" src="/res/img/person.jpg">
			</div>
			<div>
				<img class="talk_img" alt="" src="/res/img/talk.png">
			</div>
			<div>
				<img class="jum_img" alt="" src="/res/img/jum.png">
			</div>
			<div>
				<img class="emoji_img" alt="" src="/res/img/emoji.png">
			</div>
			<div>
				<img class="alarm_img" alt="" src="/res/img/alarm.jpg">
			</div>
			<div>
				<img class="change_img" alt="" src="/res/img/change.png">
			</div>
		</div>
		<div class="right_div">
			<div class="flex_between">
				<div class="sub_title">친구</div>
				<div class="flex">
					<div>
						<img onclick="friendSearchOpen()" class="friendSearch_img" alt=""
							src="/res/img/search.svg">
					</div>
					<div>
						<img onclick="window_open()" class="firendInsert_img" alt=""
							src="/res/img/friendInsert.png">
					</div>
				</div>
			</div>

			<div class="friendSearchDiv">
				<div class="border_div">
					<input class="friendSearchInput" type="text" name=""> <span
						class="middleLine">|</span> <input class="friendSearchBtn"
						type="button" value="친구검색">
				</div>
				<div>
					<img onclick="friendSearchClose()" class="close_img" alt="" src="/res/img/x.png">
				</div>
			</div>

			<div class="friendStateListDiv">
				<div class="flex_profile">
					<div>
						<img class="myProfileImg" alt="" src="/res/img/person.jpg">
					</div>
					<div>
						<div class="name">허동민</div>
						<div class="stateMessage">안녕하세요 허동민입니다</div>
					</div>
				</div>
				<div class="friendCount">친구 674</div>
				<div class="friendDiv">
					<div>
						<img class="friendProfileImg" alt="" src="/res/img/person.jpg">
					</div>
					<div>
						<div class="name">허동민</div>
						<div class="stateMessage">안녕하세요 허동민입니다</div>
					</div>
				</div>
				<div class="friendDiv">
					<div>
						<img class="friendProfileImg" alt="" src="/res/img/person.jpg">
					</div>
					<div>
						<div class="name">허동민</div>
						<div class="stateMessage">안녕하세요 허동민입니다</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


<script defer src="/res/js/chat/home.js?ver=39"></script>














