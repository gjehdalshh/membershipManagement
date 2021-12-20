<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="/res/css/user/findInfo.css?ver=5">

<div id="main_div">
	<div class="title_div">
		<div>
			<img class="main_logo" alt="" src="/res/img/title_logo.png">
		</div>
		<c:if test="${param.page == 1}">
			<div class="title">아이디 찾기</div>
		</c:if>
		<c:if test="${param.page == 2}">
			<div class="title">비밀번호 찾기</div>
		</c:if>
	</div>
	<c:if test="${param.page == 1}">
		<div>
			<div>
				<div class="textName">이름</div>
				<div>
					<input class="user_name" type="password" name="user_name">
				</div>
			</div>
			<div>
				<div class="textPh">휴대전화</div>
				<div>
					<input class="user_ph" type="password" name="user_ph">
				</div>
			</div>
		</div>
		<div>
			<div>
				<input class="findIdBtn" type="submit" value="아이디찾기">
			</div>
		</div>
	</c:if>
	<c:if test="${param.page == 2}">
		<div>
			<div>
				<div class="textId">아이디</div>
				<div>
					<input class="user_id" type="password" name="user_id">
				</div>
			</div>
			<div>
				<div class="textPh">휴대전화</div>
				<div>
					<input class="user_ph" type="password" name="user_ph">
				</div>
			</div>
		</div>
		<div>
			<div>
				<input class="findIdBtn" type="submit" value="비밀번호찾기">
			</div>
		</div>
	</c:if>
</div>

<script defer src="/res/js/user/findInfo.js?ver=2"></script>