var changeNmBtn = document.querySelector('.changeNmBtn')
var changeNmBtn = document.querySelector('.changeNmBtn')

changeNmBtn.onclick = function() {
	var changeNm = document.querySelector('.changeNm')
	console.log(changeNm.value)
	var param = {
		user_name: changeNm.value
	}
	
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
			
		}
	})
}