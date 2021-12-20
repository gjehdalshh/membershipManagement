var change_img = document.querySelector('.change_img')
var main_div = document.querySelector('#main_div')
var search_div = document.querySelector('#search_div')

function insFriend(i_userFrom, i_userTo) {
	
	var param = {
		i_userFrom: i_userFrom,
		i_userTo: i_userTo
	}
	console.log(param)
	fetch(`/chat/insFriend`, {
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
				alert('친구 추가 하였습니다.')
				break;
			case 2:
				alert('이미 등록된 친구입니다.')
				break;
		}
	})
}

function delFriend(i_userFrom, i_userTo) {
	
	var param = {
		i_userFrom: i_userFrom,
		i_userTo: i_userTo
	}
	console.log(param)
	fetch(`/chat/delFriend`, {
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
				alert('친구 삭제 하였습니다.')
				break;
		}
	})
}

change_img.onclick = function() {
	location.href = '/chat/changeInfo'
}

function movePage(page) {
	location.href="/chat/home?page="+page
}

delFriend.onclick = function() {
	
}


var page = location.search
var result = page.substring(6,7)

if(result == 1) {
	main_div.style.display = 'block'
	search_div.style.display = 'none'
}

if(result == 3) {
	main_div.style.display = 'none'
	search_div.style.display = 'block'
}

function moveChannel() {
	location.href='/chat/channelList'
}
