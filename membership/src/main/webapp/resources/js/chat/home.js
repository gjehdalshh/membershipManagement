var change_img = document.querySelector('.change_img')
var main_div = document.querySelector('#main_div')
var search_div = document.querySelector('#search_div')
var search_input = document.querySelector('.search_input')
var position_img = document.querySelector('#position_img')

position_img.onclick = function() {
	
}


change_img.onclick = function() {
	location.href = '/chat/changeInfo'
}

function movePage(page) {
	location.href="/chat/home?page="+page
}


var page = location.search
var result = page.substring(6,7)

if(result == 1) {
	main_div.style.display = 'block'
	search_div.style.display = 'none'
}
if(result == 2) {
	
}

if(result == 3) {
	main_div.style.display = 'none'
	search_div.style.display = 'block'
}

