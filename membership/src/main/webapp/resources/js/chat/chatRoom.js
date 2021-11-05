var ws;
var messages = document.getElementById("messages")

function openSocket() {
	if(ws !== undefined && ws.readyState !== WebSocket.CLOSED) {
		writeResponse("WebSocket is already opend.")
		return;
	}
	
	ws = new WebSocket("ws://localhost:8090/chat/chatRoom")
	
	ws.onopen = function(event) {
		if(event.data === undefined) {
			return;
		}
		writeResponse(event.data);
	}
	
	ws.onmessage = function(event) {
		console.log('writeResponse')
		console.log(event.data)
		writeResponse(event.data)
	}
	
	ws.onclose = function(event) {
		writeResponse("대화 종료")
	}
}

function send() {
	var text = document.getElementById("messageinput").value+","+document.getElementById("sender").value
	ws.send(text)
	text = ""
}

function closeSocket() {
	ws.close()
}

function writeResponse(text) {
	messages.innerHTML += "<br/>"+text;
}

function clearText() {
	console.log(messages.parentNode)
	messages.parentNode.removeChild(messages)
}







