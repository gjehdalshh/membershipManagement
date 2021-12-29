var subListUl = document.querySelector('.subListUl')
var listLi = document.querySelector('.listLi')
var check = 0

function subListOpen() {
	if(check == 0) {
		subListUl.style.display = 'block'
		check = 1
	} else {
		subListUl.style.display = 'none'
		check = 0
	}
}

