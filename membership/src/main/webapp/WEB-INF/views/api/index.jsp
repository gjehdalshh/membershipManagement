<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="/res/css/api/index.css?ver=18">

<div class="flex">
	<div class="mainLeftDiv">
		<div class="leftSubTitle">MS API 목록</div>
		<div class="listUlDiv">
			<ul class="listUl">
				<li class="listLi"><a href="#introduce">소개</a></li>
				<li class="listLi"><a href="#common">공통사항</a></li>
				<li class="listLi"><span class="colorWhite"
					onclick="subListOpen()">User</span>
					<ul class="subListUl">
						<li class="subListLi"><a href="#user/join">회원가입</a></li>
						<li class="subListLi"><a href="#user/login">로그인</a></li>
						<li class="subListLi"><a href="#user/findId">아이디찾기</a></li>
						<li class="subListLi"><a href="#user/findPw">비밀번호찾기</a></li>
					</ul></li>
				<li class="listLi"><a href="#chat">Chat</a></li>
			</ul>
		</div>
	</div>
	<div class="mainRightDiv">
		<div id="introduce">
			<div class="rightMainTitle">MemBerShip Program Ver1 API
				Document</div>
			<div class="introductTitle">소개</div>
			<div>
				<h4>멤버쉽 프로그램 API 문서입니다.</h4>
			</div>
			<div class="borderBottom">
				<h5>본 프로그램은 카카오톡을 모방하여 만들었습니다.</h5>
			</div>
		</div>
		<div id="common">
			<div>
				<h1>공통사항</h1>
			</div>
			<div>
				<h2>Domain</h2>
			</div>
			<table class="domainTable">
				<tr>
					<th>환경</th>
					<th>Domain</th>
				</tr>
				<tr>
					<td>Tomcat 개발서버</td>
					<td>http://localhost:8090</td>
				</tr>
			</table>
			<div>
				<h2>Base header</h2>
			</div>
			<table class="baseHeaderTable">
				<tr>
					<th>이름</th>
					<th>입력</th>
					<th>설명</th>
				</tr>
				<tr>
					<td>Content-Type</td>
					<td>application/json;charset=UTF-8</td>
					<td></td>
				</tr>
				<tr>
					<td>Language-Type</td>
					<td>java</td>
					<td></td>
				</tr>
				<tr>
					<td>Url</td>
					<td>http://java.sun.com/jsp/jstl/core;Prefix=c</td>
					<td></td>
				</tr>
			</table>
		</div>
		<div id="user">
			<div><h1>User</h1></div>
			<div>
				<div><h2><a class="colorBlack" id="user/join">회원가입</a></h2></div>
				<div class="urlH"><h4>/user/join</h4></div>
				<div><h2>Request</h2></div>
				<div><h4>Request Fields:</h4></div>
				<table>
					<tr>
						<th>필드명</th><th>타입</th><th>필수값</th><th>양식</th><th>설명</th>
					</tr>
					<tr>
						<td>id</td><td>string</td><td>true</td><td>email형식</td><td>사용자 아이디</td>
					</tr>
					<tr>
						<td>pw</td><td>string</td><td>true</td><td>bcrypt</td><td>사용자 패스워드</td>
					</tr>
					<tr>
						<td>nick</td><td>string</td><td>true</td><td></td><td>사용자 닉네임</td>
					</tr>
					<tr>
						<td>user_name</td><td>string</td><td>true</td><td></td><td>사용자 이름</td>
					</tr>
					<tr>
						<td>ph</td><td>string</td><td>true</td><td>- 없이 작성</td><td>사용자 전화번호</td>
					</tr>
					<tr>
						<td>postcode</td><td>string</td><td>true</td><td></td><td>우편번호</td>
					</tr>
					<tr>
						<td>roadAddr</td><td>string</td><td>true</td><td></td><td>도로명</td>
					</tr>
					<tr>
						<td>detailAddr</td><td>string</td><td>true</td><td></td><td>상세주소</td>
					</tr>
					<tr>
						<td>extraAddr</td><td>string</td><td>true</td><td></td><td>참고항목</td>
					</tr>
				</table>
			</div>
		</div>
		<div id="chat">
			<div>
				<h1>Chat</h1>
			</div>
		</div>
	</div>
</div>


<script defer src="/res/js/api/index.js?ver=55"></script>



