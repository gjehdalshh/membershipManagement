var findIdBtn = document.querySelector('.findIdBtn')
var pwChange = document.querySelector('.pwChange')
var findPwBtn = document.querySelector('.findPwBtn')
var loginBtn = document.querySelector('.loginBtn')

pwChange.style.display = 'none';


function loginBtn() {
	location.href=`/user/login`
}

function findId() {
	var user_name = document.querySelector('.user_name')
	var user_ph = document.querySelector('.user_ph')
	
	var param = {
		user_name: user_name.value,
		ph: user_ph.value
	}
	
	console.log(param)
	
	fetch(`/user/findIdProc`, {
		method: 'POST',
		headers: {
			'Content-Type': 'application/json'
		},
		body:JSON.stringify(param)
	}).then(function(res) {
		return res.json()
	}).then(function(data) {
		if(data.id == 'error') {
			alert('아이디가 존재하지 않습니다.')	
		} else {
			alert('아이디는 : '+data.id+'입니다.')
		}
	})
}

function findPw() {
	var user_id = document.querySelector('.user_id')
	var user_ph = document.querySelector('.user_ph')
	
	var param = {
		id: user_id.value,
		ph: user_ph.value
	}
	
	fetch(`/user/findPwProc`, {
		method: 'POST',
		headers: {
			'Content-Type': 'application/json'
		},
		body:JSON.stringify(param)
	}).then(function(res) {
		return res.json()
	}).then(function(data) {
		if(data.id == 'error') {
			alert('아이디가 존재하지 않습니다.')	
		} else {
			pwChange.style.display = 'block'
			findPwBtn.style.display = 'none'
			loginBtn.style.display = 'none'
		}
	})
}

function changePw() {
	var user_id = document.querySelector('.user_id')
	var new_pw = document.querySelector('.new_pw')
	var new_chkPw = document.querySelector('.new_chkPw')
	
	var param = {
		id: user_id.value,
		new_pw: new_pw.value,
		new_chkPw: new_chkPw.value
	}
	
	fetch(`/user/changePwProc`, {
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
				alert('비밀번호가 변경되었습니다.')
				location.href=`/user/login`
				break;
			case 2:
				alert('새 비밀번호와 새 비밀번호 확인이 일치하지 않습니다.')
				break;
			case 3:
				alert('새 비밀번호를 입력해주세요.')
				break;
			case 4:
				alert('새 비밀번호 확인을 입력해주세요.')
				break;
		}
	})
	
	console.log(param)
}

