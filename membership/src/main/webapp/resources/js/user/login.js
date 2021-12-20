var moveJoin = document.querySelector('.move_join')

function findInfo(page) {
	location.href=`/user/findInfo?page=`+page
}

moveJoin.onclick = function() {
	location.href = '/user/join'
}

var login_btn = document.querySelector('.login_btn')

login_btn.onclick = function() {
	var id = document.querySelector('.user_id')
	var pw = document.querySelector('.user_pw')
	
	var param = {
		id: id.value,
		pw: pw.value
	}
	
	console.log(param)
	
	fetch(`/user/loginProc`, {
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
				alert('로그인이 성공하셨습니다.')
				location.href = '/chat/home?page='+1
				break;
			case 2:
				alert('아이디가 존재하지 않습니다.')
				break;
			case 3:
				alert('비밀번호가 일치하지 않습니다.')
				break;
				
		}
	})
}



