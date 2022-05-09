let pwCode = "";

function reqEmailCode() {
	let name = $("[name=name]").val();
	let id = $("[name=id]").val();
	let email = $("[name=email]").val();
	
	if (name == "") {
		$("#cir_text").text("이름을 입력하세요.");
		$("#[name=name]").focus();
		return false;
	};

	if (id == "") {
		$("#cir_text").text("아이디를 입력하세요.");
		$("[name=id]").focus();
		return false;
	};

	if (email == "") {
		$("#cir_text").text("이메일을 입력하세요.");
		$("[name=email]").focus();
		return false;
	};
	
	
	
	$.ajax({
		async: true,
		type: 'POST',
		data: { 'user_id': id, 'user_name':name, 'user_email':email },
		url: "find_pw",
		dataType : "JSON",
		success: function(data) {
			if (data.find_pw == '1') {
				pwCode = data.pwCode;
				$("#cir_text").text("코드를 이메일로 보냈습니다.");
				
				if($('[name=authNum]').length == 0) {
					$('.input_box').append (
					'<input type="text" name="authNum" class="findpw_input" placeholder="인증번호 6자리 숫자 입력"> <p id="cir_text" name="code_text"></p>'
					);
				}
				$("[name=authNum]").focus();
			} else if(data.find_pw == '0'){
				$("#cir_text").text("이메일을 보내는데 실패했습니다.");
			} else {
				$("#cir_text").text("회원 정보가 없습니다.");
			}
		},
		error: function(error) {
			$("#id").text("*잠시 후 다시 시도해주세요.");
		}

	});
}

function delWarnText() {
	$("#cir_text").text("");
}


function findPWFunc() {
	if($("[name=authNum]").val() == "") {
		$("[name=code_text]").text("인증번호(6자리)를 입력하세요.");
		$("[name=authNum]").focus();
		return false;
	};
	
	if($("[name=authNum]").val() == pwCode) {
		location.href='change_pw'
	} else {
		$("[name=code_text]").text("인증번호가 틀립니다.");
	}

}