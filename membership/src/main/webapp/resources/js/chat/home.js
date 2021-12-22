var friendSearchDiv = document.querySelector('.friendSearchDiv')
var phInsert = document.querySelector('.phInsert')
var idInsert = document.querySelector('.idInsert')
var insertState1 = document.querySelector('.insertState1')
var insertState2 = document.querySelector('.insertState2')
var setionIuser = document.querySelector('.setionIuser')

friendSearchDiv.style.display = 'none'
friendInsert(1)

function friendSearchOpen() {
	friendSearchDiv.style.display = 'flex'
}
function friendSearchClose() {
	friendSearchDiv.style.display = 'none'
}


// 모달창 띄우기 디테일페이지
var mw_temp = document.querySelector('#mw_temp')

function window_open() {
	friendInsert(1)
	mw_temp.style.display = 'block'
}
function window_close() {
	friendInsert(1)
	mw_temp.style.display = 'none'
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

function friendInsertBtn() {
	var friendName = document.querySelector('.friendName')
	var friendPh = document.querySelector('.friendPh')
	
	param = {
		user_name: friendName.value,
		ph: friendPh.value,
		i_user: setionIuser.value
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
				alert('친구 추가 되었습니다.')
				window_close()
				break;
			case 2:
				alert('해당 유저는 존재하지 않습니다.')
				break;
		}
	})
}


/* --------------- main js ------------------- */








