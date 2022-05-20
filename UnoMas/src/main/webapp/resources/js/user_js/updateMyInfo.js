//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
function execDaumPostcode(num) {

	new daum.Postcode(
			{
				oncomplete : function(data) {
					// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

					// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
					// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
					var roadAddr = data.roadAddress; // 도로명 주소 변수
					var extraRoadAddr = ''; // 참고 항목 변수

					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
						extraRoadAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if (data.buildingName !== '' && data.apartment === 'Y') {
						extraRoadAddr += (extraRoadAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}
					// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if (extraRoadAddr !== '') {
						extraRoadAddr = ' (' + extraRoadAddr + ')';
					}

					// 우편번호와 주소 정보를 해당 필드에 넣는다.
					if(num=='0'){
						document.getElementById('postalcode').value = data.zonecode;
						document.getElementById("roadaddr").value = roadAddr;
					}
					if(num=='1') {
						document.getElementById('postalcode1').value = data.zonecode;
						document.getElementById("roadaddr1").value = roadAddr;
					}
					if(num=='2') {
						document.getElementById('postalcode2').value = data.zonecode;
						document.getElementById("roadaddr2").value = roadAddr;
					}
				}
			}).open();
			
}

// 생년월일
function birthCheck() {
	if($("select[name=birth-year]").val()== "" || $("select[name=birth-month]").val()== ""){
		$("select[name=birth-month]").val("");
		$("select[name=birth-month]").attr('disabled', true);
		$("select[name=birth-day]").val("");
		$("select[name=birth-day]").attr('disabled', true)
	}
	
	if($("select[name=birth-year]").val() != "") {
		$("select[name=birth-month]").attr('disabled', false);
	} 
	
	if($("select[name=birth-month]").val() != "") {
		$("select[name=birth-day]").attr('disabled', false);
		
		switch ($("select[name=birth-month]").val()) {
		case "2":
			for(var i=1; i<=28; i++) {
				$("select[name=birth-day]").append("<option value='"+i+"'>"+i+"일"+"</option>")
			}
			break;
		case "4":
		case "6":
		case "9":
		case "11":
			for(var i=1; i<=30; i++) {
				$("select[name=birth-day]").append("<option value='"+i+"'>"+i+"일"+"</option>")
			}
			break;
		case "1":
		case "3":
		case "5":
		case "7":
		case "8":
		case "10":
		case "12":
			for(var i=1; i<=31; i++) {
				$("select[name=birth-day]").append("<option value='"+i+"'>"+i+"일"+"</option>")
			}
			break;
		default:
			break;
		}
		
	} 
}

function combineBirth() {
	if($("select[name=birth-day]").val() != "") {
		let combine = $("select[name=birth-year]").val()+"-"+$("select[name=birth-month]").val()+"-"+$("select[name=birth-day]").val();  
		$("[name=user_birth]").val(combine);
	}
}

// 핸드폰 인증번호
function phoneCheckFunc() {
	$('[name=phone]').css('margin-bottom', '0px');
	$('[name=phoneCheckDiv]').html (
		'<input type="text" class="input-field" name="phoneCode" placeholder="인증번호 입력"> <input type="button" name="phoneCodeCheck" value="확인" class="check-button"><br>'
	);
	$('[name=phoneCode]').css({
		'border': '1px solid #c3c3c3',
		'margin': '10px',
		'height': '40px',
		'border-radius':'3px',
		'width': '30%',
		'font-size':'12px'
		});
	
}			
