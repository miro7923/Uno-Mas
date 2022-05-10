function memberCk() {
		if ($("#ch_pass").val() == "") {
			$("#cir_text").text("새로운 비밀번호를 입력하세요.");
			$("#ch_pass").focus();
			return false;
		};

		if ($("#ch_pass2").val() == "") {
			$("#cir_text").text("입력한 비밀번호를 확인하세요.");
			$("#ch_pass2").focus();
			return false;
		};
		
		if ($("#ch_pass").val() != $("#ch_pass2").val()) {
			$("#cir_text").text("비밀번호가 다릅니다. 확인하세요.");
			$("#ch_pass2").focus();
			return false;
		};

	}