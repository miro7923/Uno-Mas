function memberCk() {
		if ($("#name").val() == "") {
			$("#cir_text").text("이름을 입력하세요.");
			$("#name").focus();
			return false;
		};
		
		if ($("#id").val() == "") {
			$("#cir_text").text("아이디를 입력하세요.");
			$("#id").focus();
			return false;
		};

		if ($("#email2").val() == "") {
			$("#cir_text").text("이메일을 입력하세요.");
			$("#email2").focus();
			return false;
		};
		
		if ($("#num").val() == "") {
			$("#cir_text").text("인증번호(6자리)를 입력하세요.");
			$("#num").focus();
			return false;
		};

	}