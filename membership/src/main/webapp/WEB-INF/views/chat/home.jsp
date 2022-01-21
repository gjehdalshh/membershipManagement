<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="/res/css/chat/home.css?ver=15">

<c:if test="${id == null}">
	<script>
		alert('로그인 후 이용해주세요')
		location.href="/user/login"
	</script>
</c:if>

<input class="setionIuser" type="hidden" value="${id.i_user}">
<input class="param" type="hidden" value="${param.page}">

<!-- 친구 추가 모달창 -->

<div id="mw_temp" class="mw">
	<div class="bg" onclick="window_close()">
		<!--전체를 깔아주는 div-->
	</div>
	<div class="fg">
		<div class="window_close">
			<img onclick="window_close()" class="modal_close" alt=""
				src="/res/img/x.png">
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
						<input class="friendName" type="text" name="friendName"
							placeholder="친구이름">
					</div>
					<div>
						<input class="friendPh" type="text" name="friendPh"
							placeholder="전화번호">
					</div>
					<div class="notice">친구의 이름과 전화번호를 입력해주세요.</div>
				</div>
				<div>
					<input onclick="friendNameInsertBtn()" class="friendNameInsertBtn"
						type="button" value="친구 추가">
				</div>
			</div>
			<div class="insertState2">
				<div>
					<input class="friendId" type="text" placeholder="ID">
				</div>
				<div class="notice">아이디 검색응 허용한 친구만 찾을 수 있습니다.</div>
				<div>
					<input onclick="friendIdInsertBtn()" class="friendIdInsertBtn"
						type="button" value="친구 추가">
				</div>
			</div>
		</div>
	</div>
</div>



<!-- 설정 모달 창 -->

<div id="mw_temp_change" class="mw">
	<div class="bg" onclick="window_close()">
		<!--전체를 깔아주는 div-->
	</div>
	<div class="fg_change">
		<div class="window_close">
			<img onclick="window_close()" class="modal_close" alt=""
				src="/res/img/x.png">
		</div>
		<div class="myStateChange">설정</div>
		<div class="myStateChange">잠금모드</div>
		<div onclick="logout()" class="myStateChange">로그아웃</div>
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
				<img onclick="chatHomeMove()" class="person_img" alt=""
					src="/res/img/person.png">
			</div>
			<div>
				<img onclick="chatListMove()" class="talk_img" alt=""
					src="/res/img/talk.png">
			</div>
			<div>
				<img class="jum_img" alt="" src="/res/img/jum.png">
			</div>
			<div>
				<img class="emoji_img" alt="" src="/res/img/emoji.png">
			</div>
			<div>
				<img class="alarm_img" alt="" src="/res/img/alarm.png">
			</div>
			<div>
				<img onclick="window_open(2)" class="change_img" alt=""
					src="/res/img/change.png">
			</div>
		</div>

		<!-- 첫번째 페이지 -->
		<c:if test="${param.page == 1}">
			<div class="right_div_home">
				<div class="flex_between">
					<div class="sub_title">친구</div>
					<div class="flex">
						<div>
							<img onclick="friendSearchOpen()" class="friendSearch_img" alt=""
								src="/res/img/search.svg">
						</div>
						<div>
							<img onclick="window_open(1)" class="firendInsert_img" alt=""
								src="/res/img/friendInsert.png">
						</div>
					</div>
				</div>

				<div class="friendSearchDiv">
					<div class="border_div">
						<input class="friendSearchInput" type="text" name="user_name">
						<span class="middleLine">|</span>
						<span onclick="friendSearchAnswer()" class="friendSearchBtn"> 친구검색</span>
					</div>
					<div>
						<img onclick="friendSearchClose()" class="close_img" alt=""
							src="/res/img/x.png">
					</div>
				</div>

				<div class="friendStateListDiv">
					<div class="flex_profile">
						<div>
							<img class="myProfileImg" alt="" src="/res/img/person.jpg">
						</div>
						<div>
							<div class="name">${id.user_name}</div>
							<div class="stateMessage">${id.stateMes}</div>
						</div>
					</div>
					<div class="flex_between">
						<div id="friendCount" class="friendCount">친구</div>
						<div onclick="seeAllFriend()" class="seeAllFriend">전체보기</div>
					</div>
					
					<!-- innerHtml friendListAjax -->
					<div id="friendListAjax" class="friendDiv"></div>
				</div>
			</div>
		</c:if>

		<!-- 두번째 페이지 -->
		<c:if test="${param.page == 2}">
			<div class="right_div_chatList">
				<div class="flex_between">
					<div class="sub_title">채팅</div>
					<div class="flex">
						<div>
							<img onclick="chatSearchOpen()" class="chatRoomSearch_img" alt=""
								src="/res/img/search.svg">
						</div>
						<div>
							<img onclick="" class="openChat_img" alt=""
								src="/res/img/openChat.png">
						</div>
						<div>
							<img onclick="" class="chatInsert_img" alt=""
								src="/res/img/chatInsert.png">
						</div>
					</div>
				</div>

				<div class="chatSearchDiv">
					<div class="border_div">
						<form action="/chat/home?page=${param.page}" method="post">
							<input class="chatSearchInput" type="text" name="user_name">
							<span class="middleLine">|</span> <input
								onclick="chatSearchBtn()" class="chatSearchBtn" type="submit"
								value="채팅검색">
						</form>
					</div>
					<div>
						<img onclick="chatSearchClose()" class="close_img" alt=""
							src="/res/img/x.png">
					</div>
				</div>

				<div class="friendStateListDiv">
					<div class="flex_chatList">
						<div>
							<img class="chatRoomImg" alt="" src="/res/img/person.jpg">
						</div>
						<div>
							<div class="flexChatList">
								<div class="flex">
									<div class="chatRoomName">실감응용데이터베이스</div>
									<div class="chatRoomPersonCount">9</div>
								</div>
								<div class="r_dt">2021-12-27</div>
							</div>
							<div class="currentMessage">${id.stateMes}</div>
						</div>
					</div>
					<div class="flex_chatList">
						<div>
							<img class="chatRoomImg" alt="" src="/res/img/person.jpg">
						</div>
						<div>
							<div class="flexChatList">
								<div class="flex">
									<div class="chatRoomName">실감응용데이터베이스</div>
									<div class="chatRoomPersonCount">9</div>
								</div>
								<div class="r_dt">2021-12-27</div>
							</div>
							<div class="currentMessage">${id.stateMes}</div>
						</div>
					</div>
				</div>
			</div>
		</c:if>
	</div>
</div>

	<script defer src="/res/js/chat/home.js?ver=79"></script>