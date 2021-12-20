<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="/res/css/chat/home.css?ver=3">

<div id="search_div">
	<div class="top_div">
		<img class="main_logo" alt="" src="/res/img/title_logo.png">
	</div>
	<div class="sub_div">
		<div class="flex_bet">
			<div class="search_title">친구 검색</div>
			<div id="position_rel" class="flex">
					<form class="form" action="/chat/home?page=3" method="get">
						<input type="hidden" name="page=3">
						<div><input class="search_input" tpye="text" name="user_name"></div>
						<input id="position_img" type="image" src="/res/img/search.svg">
					</form>
				<div onclick="movePage(1)" class="back_div">취소</div>
			</div>
		</div>
		<div class="friend_list">친구</div>
		<div class="friend_div">
			<c:forEach var="userList" items="${userList}">
				<c:if test="${userList.i_user != id.i_user}">
					<div class="flex_div">
						<div class="flex_div">
							<div>
								<img class="friendImg" alt="" src="/res/img/change.png">
							</div>
							<div class="friend_name">${userList.user_name}</div>
						</div>
						<div class="flex_div">
							<div class="">상태 메세지</div>
							<div class="insFriend" onclick="insFriend(${userList.i_user}, ${id.i_user})">친구 신청</div>
						</div>
					</div>
				</c:if>
			</c:forEach>
		</div>
	</div>
</div>

<div id="main_div">
	<div class="top_div">
		<img class="main_logo" alt="" src="/res/img/title_logo.png">
		<div class="title_div">사내 메신저</div>
	</div>
	<div class="sub_div">
		<div class="flex_div">
			<div class="sub_title">친구</div>
			<div class="flex">
				<div onclick="movePage(3)">
					<img class="search_friend" alt="" src="/res/img/search.svg">
				</div>
				<div>
					<img class="change_img" alt="" src="/res/img/change.png">
				</div>
			</div>
		</div>
		<div></div>
		<div class="flex_div" id="border">
			<div class="flex_div">
				<div>
					<img class="profile_img" alt="" src="/res/img/change.png">
				</div>
				<div class="my_name">${id.user_name}</div>
			</div>
			<div class="font_size">${id.quotes}</div>
		</div>
		<div class="flex_div">
			<div class="font_size20">친구 목록</div>
			<div class="font_size15">내 친구의 친구</div>
		</div>
		<div>
			<div class="friend_div">
				<c:forEach var="friendList" items="${friendList}">
					<c:if test="${friendList.user_name != id.user_name}">
						<div class="flex_div">
							<div class="flex_div">
								<div>
									<img class="friendImg" alt="" src="/res/img/change.png">
								</div>
								<div class="friend_name">${friendList.user_name}</div>
							</div>
							<div>
								<div>${friendList.quotes}</div>
								<div onclick="delFriend(${friendList.i_user}, ${id.i_user})">친구삭제</div>
							</div>
						</div>
					</c:if>
				</c:forEach>		
			</div>
		</div>

		<div class="flex">
			<div onclick="movePage(1)" class="category">친구</div>
			<div onclick="moveChannel()" class="category">채팅</div>
		</div>

		<div class="div1"></div>
	</div>
</div>



<script defer src="/res/js/chat/home.js?ver=32"></script>