// user/signUp.jsp페이지의 자바스크립트 파일
let checkedID = "";
let authCode = -1;

// 우편번호 가져오는 함수.
function searchPostNum() {
	new daum.Postcode({
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
			document.getElementById('postnum').value = data.zonecode;
			document.getElementById("roadAddr").value = roadAddr;
			document.getElementById("jibunAdd").value = data.jibunAddress;
		}
	}).open();
}	


// 아이디 중복 체크 버튼 함수
function idCheckFunc() {
	let userid = $("[name=user_id]").val();
	if(userid == ""){
        $("#id").text("*아이디를 입력해주세요");
        $("[name=user_id]").focus();
        return false;
	} 
	$.ajax({
		async: true,
		type: 'GET',
		data: { 'user_id': userid },
		url: "idCheck",
		success: function(result) {
			console.log("로그인 중복 결과: ", result);
			if (result == '1') {
				$("#id").text("*이미 사용중인 아이디입니다.");
				$('[name=idCheckBtn]').val("중복확인");
				$("[name=user_id]").focus();
			} else {
				$("#id").text("");
				$('[name=idCheckBtn]').val("사용가능✔");
			}
		},
		error: function(error) {
			$("#id").text("*잠시 후 다시 시도해주세요.");
		}

	});
}


/// 아이디 중복 체크 이후 다시 바꿨을 때
function changeIDCheck() {
	if($("[name=idCheckBtn]").val() == "사용가능✔") {
		if($("[name=user_id]").val() != checkedID) {
			$('[name=idCheckBtn]').val("중복확인");
			$("[name=user_id]").focus();
		}
	}
}


// 핸드폰 인증번호 보내기
function phoneCheckFunc() {
	let phoneN = $('[name=user_phone]').val();
	
	if($("[name=user_phone]").val() == ""){
		$("#phone").text("*핸드폰 번호를 적어주세요.");
        $("[name=user_phone]").focus();
        return false;
    }

	$('[name=user_phone]').css('margin-bottom', '0px');
	if ($('[name=phoneCode]').length == 0) {
		$('[name=phoneCheckDiv]').append(
			'<input type="text" class="register_field" name="phoneCode" placeholder="인증번호 입력"> <input type="button" name="phoneCheck_btn" value="확인" onclick="phoneCodeCheck()" class="check-button"><br>'
		);
	}
	$.ajax({
		async: true,
		type: 'GET',
		data: { 'p': phoneN },
		url: "auth_phone",
		success: function(result) {
			authCode = result[1];
			if (result[0] == '1') {
				$('[name=phoneSend_text]').text("인증번호를 보냈습니다. 잠시 기다려주세요.");
				$("[name=phoneCode]").focus();
			} else {
				$('[name=phoneSend_text]').text("인증번호보내기에 실패했습니다. 다시 시도해주세요.");
			}
		},
		error: function(error) {
			$("#id").text("*잠시 후 다시 시도해주세요.");
		}

	});
}


function phoneCodeCheck() {
	if($('[name=phoneCode]').val() == authCode) {
		$('[name=phoneCheck_btn]').val("✔");
	} else {
		$('[name=phoneSend_text]').text("인증번호가 틀립니다.");
	}
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
				$("select[name=birth-day]").append("<option value='"+i+"'>"+i+"</option>")
			}
			break;
		case "4":
		case "6":
		case "9":
		case "11":
			for(var i=1; i<=30; i++) {
				$("select[name=birth-day]").append("<option value='"+i+"'>"+i+"</option>")
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
				$("select[name=birth-day]").append("<option value='"+i+"'>"+i+"</option>")
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

				
// 회원가입 유효성 검사 함수.
function signUpCheckFunc() {
	var useridCheck = RegExp(/^[가-힣a-zA-Z0-9]{3,20}$/);
	var passwdCheck = RegExp(/^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^*()\-_=+\\\|\[\]{};:\'",.<>\/?]).{8,16}$/);	
	var nameCheck = RegExp(/^[가-힣a-zA-Z]{2,15}$/);
	var phonNumberCheck = RegExp(/^01[0179][0-9]{7,8}$/);
	var emailCheck = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
	
	// 아이디
	if($("[name=user_id]").val() == ""){
        $("#id").text("*아이디를 입력해주세요");
        $("[name=user_id]").focus();
        return false;
    }
	if(!useridCheck.test($("[name=user_id]").val())){
		$("#id").text("*아이디는 한글,영문, 숫자만 가능합니다.");
        $("[name=user_id]").focus();
        return false;
    }
	if($("[name=user_id]").val().indexOf("탈퇴") > -1) {
		$("#id").text("*포함할 수 없는 단어가 있습니다.");
         $("[name=user_id]").val("");
        $("[name=user_id]").focus();
        return false;
	}
		
	
	// 아이디 중복 체크 여부
	if($("[name=idCheckBtn]").val() != "사용가능✔") {
		$("#id").text("*아이디 중복체크를 해주세요.");
		$("[name=user_id]").focus();
		return false;
	}
	
	
	//비밀번호
	if (!passwdCheck.test($("[name=user_pass]").val())) {
		$("#pw").text("*대소문자,특수문자 포함 8~16자로 입력.");
		$("[name=user_pass]").val("");
		$("[name=user_pass]").focus();
		return false;
	}
	
	// 비번 확인
	if ($("[name=user_pass]").val() !== $("[name=pwCheck]").val()) {
		$("#pwCheck").text("*비밀번호가 다릅니다.");
		$("[name=pwCheck]").val("");
		$("[name=pwCheck]").focus();
		return false;
	}
	
	// 이름
	if(!nameCheck.test($("[name=user_name").val())){
		$("#name").text("*이름은 한글,영문만 가능합니다.");
        $("[name=user_name").focus();
        return false;
    }
	
	// 생년월일
	if($("select[name=birth-day]").val()==""){
		$("#birth").text("*생년월일을 입력해주세요.");
        $("[name=birth-years]").focus();
        return false;
    }
    
	
	// 핸드폰 번호
	if(!phonNumberCheck.test($("[name=user_phone]").val())){
		$("#phone").text("*정확하게 입력되었는지 확인해주세요.");
        $("[name=user_phone]").focus();
        return false;
    }
	
	// 핸드폰 인증
	if($("[name=phoneCheck_btn]").val() != "✔") {
		$("#phone").text("*핸드폰 인증을 해주세요.");
		return false;
	}
	
		
	// 이메일
	if(!emailCheck.test($("[name=user_email]").val())){
		$("#email").text("*이메일 형식이 다릅니다.");
        $("[name=user_email]").focus();
        return false;
    }
	
	// 주소
	if($("[name=user_postalcode]").val() == "" || $("[name=user_roadaddr]").val() == ""){
        $("#addr").text("*주소를 입력해주세요.");
        $("#bringAddr").focus();
        return false;
    }
	
	var obj = $("form[role='form']");
	obj.submit();
}								