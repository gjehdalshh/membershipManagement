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
				<tr><th>환경</th><th>Domain</th></tr>
				<tr><td>Tomcat 개발서버</td><td>http://localhost:8090</td></tr>
			</table>
			<div><h2>Base header</h2></div>
			<table class="baseHeaderTable">
				<tr><th>이름</th><th>입력</th><th>필수값</th><th>설명</th></tr>
				<tr><td>Accept</td><td>application/json;charset=UTF-8</td><td>true</td><td></td></tr>
				<tr><td>Content-Type</td><td>application/json;charset=UTF-8</td><td>true</td><td></td></tr>
				<tr><td>Url</td><td>http://java.sun.com/jsp/jstl/core;Prefix=c</td><td>true</td><td></td></tr>
			</table>
		</div>
		<div id="user">
			<div><h1>User</h1></div>
			
			<!-- 회원가입 -->
			
			<div id="join">
				<div><h1><a class="colorBlack" id="user/join">회원가입</a></h1></div>
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
				<div><h4>Request body:</h4></div>
				<div class="requestBody">
<pre class="requestBodyCode">
	<code>
{
	"id" : "gjehdalshh@naver.com",
	"pw" : "$2a$10$JFk5Ok.d8luM8MMtfn3WdeskmzRv8Ln0yz3bhwl6Qt9ZrShy5Muf6",
	"nick" : "admin",
	"user_name" : "admin",
	"ph" : "01011111111",
	"postcode" : "27472",
	"roadAddr" : "충북 충주시 대소원면 대소마을길 10",
	"detailAddr" : "비둘기아파트 101동410호",
	"extraAddr" : "(비둘기마을)"
}
	</code>
</pre>
				</div>
				<div><h4>Request HTTP Example:</h4></div>
				<div class="requestHttp">
<pre class="requestHttpCode">
	<code>
<span class="colorOrange">POST</span> <span class="colorGreen">/user/loginProc</span> <span class="colorGray">HTTP/1.1</span>
<span class="colorOrange">Content-Type</span>: application/json;charset=UTF-8
<span class="colorOrange">Accept</span>: application/json;charset=UTF-8
<span class="colorOrange">Content-Length</span>: 195
<span class="colorOrange">Host</span>: localhost	
	
{
	"id" : <span class="colorGreen">"gjehdalshh@naver.com"</span>,
	"pw" : <span class="colorGreen">"$2a$10$JFk5Ok.d8luM8MMtfn3WdeskmzRv8Ln0yz3bhwl6Qt9ZrShy5Muf6"</span>,
	"nick" : <span class="colorGreen">"admin"</span>,
	"user_name" : <span class="colorGreen">"admin"</span>,
	"ph" : <span class="colorGreen">"01011111111"</span>,
	"postcode" : <span class="colorGreen">"27472"</span>,
	"roadAddr" : <span class="colorGreen">"충북 충주시 대소원면 대소마을길 10"</span>,
	"detailAddr" : <span class="colorGreen">"비둘기아파트 101동410호"</span>,
	"extraAddr" : <span class="colorGreen">"(비둘기마을)"</span>
}
	</code>
</pre>
				</div>
				<div><h2>Response</h2></div>
				<div><h4>Response Fields:</h4></div>
				<table>
					<tr>
						<th>필드명</th><th>타입</th><th>필수값</th><th>양식</th><th>설명</th>
					</tr>
					<tr>
						<td>stateCode</td><td>Number</td><td>true</td><td></td><td>상태 코드</td>
					</tr>
					<tr>
						<td>stateMessage</td><td>string</td><td>true</td><td></td><td>상태 메시지</td>
					</tr>
					<tr>
						<td>resultCode</td><td>string</td><td>true</td><td></td><td>결과 코드</td>
					</tr>
					<tr>
						<td>message</td><td>string</td><td>true</td><td></td><td>결과 메시지</td>
					</tr>
				</table>
				<div><h4>Response HTTP Example:</h4></div>
				<div class="responseHttp">
<pre class="responseHttpCode">
	<code>
<span class="colorGray">HTTP/1.1</span> <span class="colorBlue">200</span> OK
<span class="colorOrange">Content-Type</span>: application/json;charset=UTF-8
<span class="colorOrange">Content-Length</span>: 195
	
{
	"stateCode" : <span class="colorBlue">200</span>,
	"stateMessage" : <span class="colorGreen">"OK"</span>,
	"resultCode" : <span class="colorGreen">"result"</span>,
	"message" : <span class="colorGreen">"회원가입이 성공하였습니다."</span>
}
	</code>
</pre>
				</div>
			</div>
			
			<!-- 로그인 -->
			
			<div id="login">
				<div><h1><a class="colorBlack" id="user/login">로그인</a></h1></div>
				<div class="urlH"><h4>/user/login</h4></div>
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
				</table>
				<div><h4>Request body:</h4></div>
				<div class="requestBody">
<pre class="requestBodyCode">
	<code>
{
	"id" : "gjehdalshh@naver.com",
	"pw" : "$2a$10$JFk5Ok.d8luM8MMtfn3WdeskmzRv8Ln0yz3bhwl6Qt9ZrShy5Muf6"
}
	</code>
</pre>
				</div>
				<div><h4>Request HTTP Example:</h4></div>
				<div class="requestHttp">
<pre class="requestHttpCode">
	<code>
<span class="colorOrange">POST</span> <span class="colorGreen">/user/loginProc</span> <span class="colorGray">HTTP/1.1</span>
<span class="colorOrange">Content-Type</span>: application/json;charset=UTF-8
<span class="colorOrange">Accept</span>: application/json;charset=UTF-8
<span class="colorOrange">Content-Length</span>: 195
<span class="colorOrange">Host</span>: localhost	
	
{
	"id" : <span class="colorGreen">"gjehdalshh@naver.com"</span>,
	"pw" : <span class="colorGreen">"$2a$10$JFk5Ok.d8luM8MMtfn3WdeskmzRv8Ln0yz3bhwl6Qt9ZrShy5Muf6"</span>
}
	</code>
</pre>
				</div>
				<div><h2>Response</h2></div>
				<div><h4>Response Fields:</h4></div>
				<table>
					<tr>
						<th>필드명</th><th>타입</th><th>필수값</th><th>양식</th><th>설명</th>
					</tr>
					<tr>
						<td>stateCode</td><td>Number</td><td>true</td><td></td><td>상태 코드</td>
					</tr>
					<tr>
						<td>stateMessage</td><td>string</td><td>true</td><td></td><td>상태 메시지</td>
					</tr>
					<tr>
						<td>resultCode</td><td>string</td><td>true</td><td></td><td>결과 코드</td>
					</tr>
					<tr>
						<td>message</td><td>string</td><td>true</td><td></td><td>결과 메시지</td>
					</tr>
				</table>
				<div><h4>Response HTTP Example:</h4></div>
				<div class="responseHttp">
<pre class="responseHttpCode">
	<code>
<span class="colorGray">HTTP/1.1</span> <span class="colorBlue">200</span> OK
<span class="colorOrange">Content-Type</span>: application/json;charset=UTF-8
<span class="colorOrange">Content-Length</span>: 195
	
{
	"stateCode" : <span class="colorBlue">200</span>,
	"stateMessage" : <span class="colorGreen">"OK"</span>,
	"resultCode" : <span class="colorGreen">"result"</span>,
	"message" : <span class="colorGreen">"로그인이 성공하였습니다."</span>
}
	</code>
</pre>
				</div>
			</div>
			
			<!-- 아이디 찾기  -->
			<div id="findId">
				<div><h1><a class="colorBlack" id="user/findId">아이디찾기</a></h1></div>
				<div class="urlH"><h4>/user/findInfo?page=1</h4></div>
				<div><h2>Request</h2></div>
				<div><h4>Request Fields:</h4></div>
				<table>
					<tr>
						<th>필드명</th><th>타입</th><th>필수값</th><th>양식</th><th>설명</th>
					</tr>
					<tr>
						<td>user_name</td><td>string</td><td>true</td><td></td><td>사용자 이름</td>
					</tr>
					<tr>
						<td>ph</td><td>string</td><td>true</td><td>- 없이 작성</td><td>사용자 전화번호</td>
					</tr>
				</table>
				<div><h4>Request body:</h4></div>
				<div class="requestBody">
<pre class="requestBodyCode">
	<code>
{
	"user_name" : "admin",
	"ph" : "01011111111"
}
	</code>
</pre>
				</div>
				<div><h4>Request HTTP Example:</h4></div>
				<div class="requestHttp">
<pre class="requestHttpCode">
	<code>
<span class="colorOrange">POST</span> <span class="colorGreen">/user/findIdProc</span> <span class="colorGray">HTTP/1.1</span>
<span class="colorOrange">Content-Type</span>: application/json;charset=UTF-8
<span class="colorOrange">Accept</span>: application/json;charset=UTF-8
<span class="colorOrange">Content-Length</span>: 195
<span class="colorOrange">Host</span>: localhost	
	
{
	"user_name" : <span class="colorGreen">"admin"</span>,
	"ph" : <span class="colorGreen">"01011111111"</span>
}
	</code>
</pre>
				</div>
				<div><h2>Response</h2></div>
				<div><h4>Response Fields:</h4></div>
				<table>
					<tr>
						<th>필드명</th><th>타입</th><th>필수값</th><th>양식</th><th>설명</th>
					</tr>
					<tr>
						<td>stateCode</td><td>Number</td><td>true</td><td></td><td>상태 코드</td>
					</tr>
					<tr>
						<td>stateMessage</td><td>string</td><td>true</td><td></td><td>상태 메시지</td>
					</tr>
					<tr>
						<td>resultCode</td><td>string</td><td>true</td><td></td><td>결과 코드</td>
					</tr>
					<tr>
						<td>message</td><td>string</td><td>true</td><td></td><td>결과 메시지</td>
					</tr>
				</table>
				<div><h4>Response HTTP Example:</h4></div>
				<div class="responseHttp">
<pre class="responseHttpCode">
	<code>
<span class="colorGray">HTTP/1.1</span> <span class="colorBlue">200</span> OK
<span class="colorOrange">Content-Type</span>: application/json;charset=UTF-8
<span class="colorOrange">Content-Length</span>: 195
	
{
	"stateCode" : <span class="colorBlue">200</span>,
	"stateMessage" : <span class="colorGreen">"OK"</span>,
	"resultCode" : <span class="colorGreen">"result"</span>,
	"message" : <span class="colorGreen">"아이디는 data.id입니다."</span>
}
	</code>
</pre>
				</div>
			</div>
				
				<!-- 비밀번호 찾기 -->
			<div id="findPw">
				<div><h1><a class="colorBlack" id="user/findPw">비밀번호찾기</a></h1></div>
				<div class="urlH"><h4>/user/findInfo?page=2</h4></div>
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
						<td>ph</td><td>string</td><td>true</td><td>- 없이 작성</td><td>사용자 전화번호</td>
					</tr>
				</table>
				<div><h4>Request body:</h4></div>
				<div class="requestBody">
<pre class="requestBodyCode">
	<code>
{
	"id" : "gjehdalshh@naver.com",
	"ph" : "01011111111"
}
	</code>
</pre>
				</div>
				<div><h4>Request HTTP Example:</h4></div>
				<div class="requestHttp">
<pre class="requestHttpCode">
	<code>
<span class="colorOrange">POST</span> <span class="colorGreen">/user/findIdProc</span> <span class="colorGray">HTTP/1.1</span>
<span class="colorOrange">Content-Type</span>: application/json;charset=UTF-8
<span class="colorOrange">Accept</span>: application/json;charset=UTF-8
<span class="colorOrange">Content-Length</span>: 195
<span class="colorOrange">Host</span>: localhost	
	
{
	"id" : <span class="colorGreen">"gjehdalshh@naver.com"</span>,
	"ph" : <span class="colorGreen">"01011111111"</span>
}
	</code>
</pre>
				</div>
				<div><h2>Response</h2></div>
				<div><h4>Response Fields:</h4></div>
				<table>
					<tr>
						<th>필드명</th><th>타입</th><th>필수값</th><th>양식</th><th>설명</th>
					</tr>
					<tr>
						<td>stateCode</td><td>Number</td><td>true</td><td></td><td>상태 코드</td>
					</tr>
					<tr>
						<td>stateMessage</td><td>string</td><td>true</td><td></td><td>상태 메시지</td>
					</tr>
					<tr>
						<td>resultCode</td><td>string</td><td>true</td><td></td><td>결과 코드</td>
					</tr>
					<tr>
						<td>message</td><td>string</td><td>true</td><td></td><td>결과 메시지</td>
					</tr>
				</table>
				<div><h4>Response HTTP Example:</h4></div>
				<div class="responseHttp">
<pre class="responseHttpCode">
	<code>
<span class="colorGray">HTTP/1.1</span> <span class="colorBlue">200</span> OK
<span class="colorOrange">Content-Type</span>: application/json;charset=UTF-8
<span class="colorOrange">Content-Length</span>: 195
	
{
	"stateCode" : <span class="colorBlue">200</span>,
	"stateMessage" : <span class="colorGreen">"OK"</span>,
	"resultCode" : <span class="colorGreen">"result"</span>,
	"message" : <span class="colorGreen">"아이디가 존재합니다.</span>
}
	</code>
</pre>
				</div>
			</div>	
				<!-- 비밀번호 변경 -->
			<div id="changePw">
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
						<td>new_pw</td><td>string</td><td>true</td><td>bcrypt</td><td>새 비밀번호</td>
					</tr>
					<tr>
						<td>new_chkPw</td><td>string</td><td>true</td><td>bcrypt</td><td>새 비밀번호 확인</td>
					</tr>
				</table>
				<div><h4>Request body:</h4></div>
				<div class="requestBody">
<pre class="requestBodyCode">
	<code>
{
	"id" : "gjehdalshh@naver.com",
	"new_pw" : "$2a$10$JFk5Ok.d8luM8MMtfn3WdeskmzRv8Ln0yz3bhwl6Qt9ZrShy5Muf6",
	"new_chkPw" : "$2a$10$JFk5Ok.d8luM8MMtfn3WdeskmzRv8Ln0yz3bhwl6Qt9ZrShy5Muf6",
}
	</code>
</pre>
				</div>
				<div><h4>Request HTTP Example:</h4></div>
				<div class="requestHttp">
<pre class="requestHttpCode">
	<code>
<span class="colorOrange">POST</span> <span class="colorGreen">/user/findIdProc</span> <span class="colorGray">HTTP/1.1</span>
<span class="colorOrange">Content-Type</span>: application/json;charset=UTF-8
<span class="colorOrange">Accept</span>: application/json;charset=UTF-8
<span class="colorOrange">Content-Length</span>: 195
<span class="colorOrange">Host</span>: localhost	
	
{
	"id" : <span class="colorGreen">"gjehdalshh@naver.com"</span>,
	"new_pw" : <span class="colorGreen">"d8luM8MMtfn3WdeskmzRv8Ln0yz3bhwl6Qt9ZrShy5Muf6"</span>
	"new_chkPw" : <span class="colorGreen">"d8luM8MMtfn3WdeskmzRv8Ln0yz3bhwl6Qt9ZrShy5Muf6"</span>
}
	</code>
</pre>
				</div>
				<div><h2>Response</h2></div>
				<div><h4>Response Fields:</h4></div>
				<table>
					<tr>
						<th>필드명</th><th>타입</th><th>필수값</th><th>양식</th><th>설명</th>
					</tr>
					<tr>
						<td>stateCode</td><td>Number</td><td>true</td><td></td><td>상태 코드</td>
					</tr>
					<tr>
						<td>stateMessage</td><td>string</td><td>true</td><td></td><td>상태 메시지</td>
					</tr>
					<tr>
						<td>resultCode</td><td>string</td><td>true</td><td></td><td>결과 코드</td>
					</tr>
					<tr>
						<td>message</td><td>string</td><td>true</td><td></td><td>결과 메시지</td>
					</tr>
				</table>
			<div><h4>Response HTTP Example:</h4></div>
			<div class="responseHttp">
<pre class="responseHttpCode">
	<code>
<span class="colorGray">HTTP/1.1</span> <span class="colorBlue">200</span> OK
<span class="colorOrange">Content-Type</span>: application/json;charset=UTF-8
<span class="colorOrange">Content-Length</span>: 195
	
{
	"stateCode" : <span class="colorBlue">200</span>,
	"stateMessage" : <span class="colorGreen">"OK"</span>,
	"resultCode" : <span class="colorGreen">"result"</span>,
	"message" : <span class="colorGreen">"비밀번호가 변경되었습니다."</span>
}
	</code>
</pre>
				</div>
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



