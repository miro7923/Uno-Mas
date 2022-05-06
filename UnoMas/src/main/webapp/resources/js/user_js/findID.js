function memberCk() {
		if ($("#id").val() == "") {
			$("#cir_text").text("이름을 입력하세요.");
			$("#id").focus();
			return false;
		};

		if ($("#email1").val() == "") {
			$("#cir_text").text("이메일을 입력하세요.");
			$("#email1").focus();
			return false;
		};

	}