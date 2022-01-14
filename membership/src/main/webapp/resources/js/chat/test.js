con()

var setionIuser = document.querySelector('.setionIuser')

let load = document.querySelector('.load')

load.onclick = function() {
	
	var param = {
		i_user : 6
	}
	
	console.log(param)
	fetch('/chat/test', {
		method : 'POST',
		headers : {
			'Content-Type' : 'application/json'
		},
		body:JSON.stringify(param)
	}).then(function(res) {
		return res.json()
	}).then(function(data) {
		console.log(data.result)
		aa(data.result)
	})
}

function con() {
	var param = {
		i_user : 6
	}
	
	console.log(param)
	fetch('/chat/test', {
		method : 'POST',
		headers : {
			'Content-Type' : 'application/json'
		},
		body:JSON.stringify(param)
	}).then(function(res) {
		return res.json()
	}).then(function(data) {
		console.log(data.result)
		aa(data.result)
	})
}

function aa(data) {
	var test = document.getElementById('test')
	console.log(data[0].user_name)
	
	for(let i = 0; i < data.length; i++) {
		test.innerHTML += data[i].user_name
	} 
}


