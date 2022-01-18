var friendSearchDiv = document.querySelector('.friendSearchDiv')
var phInsert = document.querySelector('.phInsert')
var idInsert = document.querySelector('.idInsert')
var insertState1 = document.querySelector('.insertState1')
var insertState2 = document.querySelector('.insertState2')
var setionIuser = document.querySelector('.setionIuser')
var param = document.querySelector('.param')
friendListAnswer()

friendInsert(1)

function logout() {
	location.href=`/user/logout`
}

function friendSearchOpen() {
	friendSearchDiv.style.display = 'flex'
}
function friendSearchClose() {
	friendSearchDiv.style.display = 'none'
}

// 모달창 띄우기 디테일페이지
var mw_temp = document.querySelector('#mw_temp')
var mw_temp_change = document.querySelector('#mw_temp_change')

function window_open(page) {
	if(page == 1) {
		friendInsert(1)
		mw_temp.style.display = 'block'	
	}
	if(page == 2) {
		mw_temp_change.style.display = 'block'	
	}
}
function window_close() {
	friendInsert(1)
	mw_temp.style.display = 'none'
	mw_temp_change.style.display = 'none'
}

function friendInsert(check) {
	if (check == 1) {
		phInsert.style.color = 'black'
		idInsert.style.color = 'gray'
		phInsert.style.borderBottom = '0.1px solid black'
		idInsert.style.borderBottom = '0.1px solid darkgray'
		insertState1.style.display = 'block'
		insertState2.style.display = 'none'

	} else {
		phInsert.style.color = 'gray'
		idInsert.style.color = 'black'
		idInsert.style.borderBottom = '0.1px solid black'
		phInsert.style.borderBottom = '0.1px solid darkgray'
		insertState2.style.display = 'block'
		insertState1.style.display = 'none'
	}
}

function friendNameInsertBtn() {
	var friendName = document.querySelector('.friendName')
	var friendPh = document.querySelector('.friendPh')
	
	param = {
		user_name: friendName.value,
		ph: friendPh.value,
		i_user: setionIuser.value
	}
	
	console.log(param)
	
	fetch(`/chat/insNameFriend`, {
		method: 'POST',
		headers: {
			'Content-Type': 'application/json'
		},
		body:JSON.stringify(param)
	}).then(function(res) {
		return res.json()
	}).then(function(data) {
		switch(data.result) {
			case 1:
				alert('친구 추가 되었습니다.')
				window_close()
				break;
			case 2:
				alert('해당 유저는 존재하지 않습니다.')
				break;
			case 3:
				alert('이미 친구 상태입니다.')
		}
	})
}


function friendIdInsertBtn() {
	var friendId = document.querySelector('.friendId')
	
	var param = {
		id: friendId.value,
		i_user: setionIuser.value
	}
	
	console.log(param)
	
	fetch(`/chat/insIdFriend`, {
		method: 'POST',
		headers: {
			'Content-Type': 'application/json'
		},
		body:JSON.stringify(param)
	}).then(function(res) {
		return res.json()
	}).then(function(data) {
		switch(data.result) {
			case 1:
				alert('친구 추가 되었습니다.')
				window_close()
				break;
			case 2:
				alert('해당 유저는 존재하지 않습니다.')
				break;
			case 3:
				alert('이미 친구 상태입니다.')
				break;
		}
	})
}


var right_div_chatList = document.querySelector('.right_div_chatList')
var right_div_home = document.querySelector('.right_div_home')
var chatSearchDiv = document.querySelector('.chatSearchDiv')


if(param.value == 1) {
	friendSearchDiv.style.display = 'none'
} else if(param.value == 2) {
	chatSearchDiv.style.display = 'none'
}

function chatSearchOpen() {
	chatSearchDiv.style.display = 'flex'
}

function chatSearchClose() {
	chatSearchDiv.style.display ='none'
}

function chatHomeMove() {
	location.href=`/chat/home?page=`+1
}

function chatListMove() {
	location.href=`/chat/home?page=`+2
}

function friendListAnswer() {
	var param = {
		i_user : setionIuser.value
	}
	
	console.log(param)
	fetch('/chat/home/friendListAjax', {
		method : 'POST',
		headers : {
			'Content-Type' : 'application/json'
		},
		body:JSON.stringify(param)
	}).then(function(res) {
		return res.json()
	}).then(function(data) {
		friendListAjax(data.selFriendList)
		friendCountAjax(data.selFriendCount.friendCount)
	})
}

/* --------------------- 친구 리스트 뿌리기 -------------------- */
let friendList = document.getElementById('friendListAjax')
function friendListAjax(data) {
	
	for(let i = 0; i < data.length; i++) {
		friendList.innerHTML += `
			<div><img class="friendProfileImg" alt="" src="/res/img/person.jpg"></div>
			<div>
				<div>${data[i].user_name}</div>
				<div>${data[i].stateMes}</div>
			</div>
		`
	} 
}


/* ------------------ 친구 수 ----------------------- */
let friendCount = document.getElementById('friendCount')
function friendCountAjax(data) {
	
	friendCount.innerHTML = `
		<div>친구 ${data}</div>
	`
}

/* ----------------------- 친구 검색 리스트 뿌리기 ------------------ */
let friendSearchName = document.querySelector('.friendSearchInput')

function friendSearchAnswer() {
	
	var param = {
		i_userFrom : setionIuser.value,
		user_name : friendSearchName.value
	}
	
	console.log(param)
	fetch('/chat/home/friendSearchAjax', {
		method : 'POST',
		headers : {
			'Content-Type' : 'application/json'
		},
		body:JSON.stringify(param)
	}).then(function(res) {
		return res.json()
	}).then(function(data) {
		console.log(data.selFrinedSearch)
		friendSearchAjax(data.selFrinedSearch)
	})
	friendSearchName.value = ``
	friendSearchDiv.style.display = 'none'
}

let friendSearch = document.getElementById('friendSearchAjax')
function friendSearchAjax(data) {
	
	friendList.innerHTML = ``
	friendSearch.innerHTML = ``
	
	for(let i = 0; i < data.length; i++) {
		friendSearch.innerHTML += `
			<div><img class="friendProfileImg" alt="" src="/res/img/person.jpg"></div>
			<div>
				<div>${data[i].user_name}</div>
				<div>${data[i].stateMes}</div>
			</div>
		`
	} 
}



