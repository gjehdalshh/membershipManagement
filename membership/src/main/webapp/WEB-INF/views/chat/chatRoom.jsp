<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="/res/css/chat/chatRoom.css?ver=2">
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html: charset=UTF-8">
</head>
</html>
<body>
	<div>
		<button onclick="openSocket()">대화방 참여</button>
		<button onclick="closeSocket()">대화방 나가기</button>
		<br/><br/><br/>
		메세지 입력 :
		<input type="text" id="sender" value="${sessionScope.id.user_name}">
		<input type="text" id="messageinput">
		<button onclick="send()">메세지 전송</button>
		<button onclick="javascript:clearText()">대화내용 지우기</button>
		${id.user_name}
	</div>
	
	<div id="messages">
	</div>
	
</body>


<script defer src="/res/js/chat/chatRoom.js?ver=4"></script>