<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="/res/css/chat/home.css?ver=14">

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



<div id="main_div">
	<div class="title_div">
		<div>
			<img class="main_logo" alt="" src="/res/img/title_logo.png">
		</div>
	</div>
	<div class="flex">
		<div class="left_div">
			<div>
				<img class="person_img" alt="" src="/res/img/person.png">
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
				<img class="alarm_img" alt="" src="/res/img/alarm.png">
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
					<form action="/chat/home" method="post">
						<input class="friendSearchInput" type="text" name="user_name">
						<span class="middleLine">|</span> <input
							onclick="friendSearchBtn()" class="friendSearchBtn" type="submit"
							value="친구검색">
					</form>
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
					<div class="friendCount">친구 ${selFriendCount.friendCount}${searchListCount.friendCount}</div>
					<div>
						<form action="/chat/home" method="get">
							<input class="seeAllFriend" type="submit" value="전체보기">
						</form>
					</div>
				</div>
				<c:choose>
					<c:when test="${empty searchList}">
						<c:forEach var="friendList" items="${friendList}">
							<div class="friendDiv">
								<div>
									<img class="friendProfileImg" alt="" src="/res/img/person.jpg">
								</div>
								<div>
									<div class="name">${friendList.user_name}</div>
									<div class="stateMessage">${friendList.stateMes}</div>
								</div>
							</div>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<c:forEach var="searchList" items="${searchList}">
							<c:if test="${searchList.i_user != id.i_user}">
								<div class="friendDiv">
									<div>
										<img class="friendProfileImg" alt="" src="/res/img/person.jpg">
									</div>
									<div>
										<div class="name">${searchList.user_name}</div>
										<div class="stateMessage">${searchList.stateMes}</div>
									</div>
								</div>
							</c:if>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
</div>

<script defer src="/res/js/chat/home.js?ver=40"></script>














