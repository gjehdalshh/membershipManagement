var join_btn = document.querySelector('.join_btn')

join_btn.onclick = function() {
	var id = document.querySelector('.user_id')
	var pw = document.querySelector('.user_pw')
	var ckPw = document.querySelector('.user_ckPw')
	var nm = document.querySelector('.user_name')
	var nick = document.querySelector('.user_nick')
	var postcode = document.querySelector('#postcode')
	var roadAddr = document.querySelector('#roadAddr')
	var detailAddr = document.querySelector('#detailAddr')
	var extraAddr = document.querySelector('#extraAddr')

	var param = {
		id: id.value,
		pw: pw.value,
		ckPw: ckPw.value,
		user_name: nm.value,
		nick: nick.value,
		postcode: postcode.value,
		roadAddr: roadAddr.value,
		detailAddr: detailAddr.value,
		extraAddr: extraAddr.value
	}

	console.log(param)

	fetch(`/user/joinProc`, {
		method: 'POST',
		headers: {
			'Content-Type': 'application/json'
		},
		body: JSON.stringify(param)
	}).then(function(res) {
		return res.json()
	}).then(function(data) {
		switch (data.result) {
			case 1:
				alert('회원가입이 성공하셨습니다.')
				location.href = '/user/login'
				break;
			case 2:
				alert('비밀번호가 일치하지 않습니다.')
				break;
			case 3:
				alert('아이디가 이미 존재합니다.')
				break;
			case 4:
				alert('닉네임이 이미 존재합니다.')
				break;

		}
	})
}


function execDaumPostcode() {
	new daum.Postcode({
		oncomplete: function(data) {
			// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

			// 각 주소의 노출 규칙에 따라 주소를 조합한다.
			// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			var addr = ''; // 주소 변수
			var extraAddr = ''; // 참고항목 변수

			//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
			if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
				addr = data.roadAddress;
			} else { // 사용자가 지번 주소를 선택했을 경우(J)
				addr = data.jibunAddress;
			}

			// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
			if (data.userSelectedType === 'R') {
				// 법정동명이 있을 경우 추가한다. (법정리는 제외)
				// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
				if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
					extraAddr += data.bname;
				}
				// 건물명이 있고, 공동주택일 경우 추가한다.
				if (data.buildingName !== '' && data.apartment === 'Y') {
					extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
				}
				// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
				if (extraAddr !== '') {
					extraAddr = ' (' + extraAddr + ')';
				}
				// 조합된 참고항목을 해당 필드에 넣는다.
				document.getElementById("extraAddr").value = extraAddr;

			} else {
				document.getElementById("extraAddr").value = '';
			}

			// 우편번호와 주소 정보를 해당 필드에 넣는다.
			document.getElementById('postcode').value = data.zonecode;
			document.getElementById("roadAddr").value = addr;
			// 커서를 상세주소 필드로 이동한다.
			document.getElementById("detailAddr").focus();
		}
	}).open();
}








