var changeNmBtn = document.querySelector('.changeNmBtn')
var changePwBtn = document.querySelector('.changePwBtn')
var changeNickBtn = document.querySelector('.changeNickBtn')
var i_user = document.querySelector('.i_user')

changeNmBtn.onclick = function() {
	var changeNm = document.querySelector('.changeNm')
	
	var param = {
		user_name: changeNm.value,
		i_user: i_user.value
	}
	console.log(param)
	
	fetch(`/user/changeNm`, {
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
				alert('이름이 변경되었습니다')
				location.href='/chat/home?page=1'
				break;
			case 2:
				alert('이름을 입력해주세요')
				break;
			case 3:
				alert('현재 이름과 같습니다')
				break;
		}
	})
}


changePwBtn.onclick = function() {
	var nowPw = document.querySelector('.nowPw')
	var new_pw = document.querySelector('.new_pw')
	var new_chkPw = document.querySelector('.new_chkPw')
	
	var param = {
		i_user: i_user.value,
		pw: nowPw.value,
		new_pw: new_pw.value,
		new_chkPw: new_chkPw.value
	}
	
	console.log(param)
	
	fetch(`/user/changePw`, {
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
				alert('비밀번호가 변경되었습니다')
				location.href='/chat/home?page=1'
				break;
			case 2:
				alert('현재 사용중인 비밀번호를 입력해주세요')
				break;
			case 3:
				alert('새 비밀번호를 입력해주세요')
				break;
			case 4:
				alert('새 비밀번호 확인을 입력해주세요')
				break;
			case 5:
				alert('현재 사용중인 비밀번호가 일치하지 않습니다')
				break;
			case 6:
				alert('새 비밀번호와 새 비밀번호 확인이 일치하지 않습니다')
				break;
			
		}
	})
}

changeNickBtn.onclick = function() {
	var changeNick = document.querySelector('.changeNick')	
	
	param = {
		i_user: i_user.value,
		nick: changeNick.value
	}
	
	fetch(`/user/changeNick`, {
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
				alert('별명이 변경되었습니다')
				location.href='/chat/home?page=1'
				break;
			case 2:
				alert('별명을 입력해주세요')
				break;
			case 3:
				alert('이미 존재하는 별명입니다.')
				break;
		}
	})
}





