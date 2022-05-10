function changePWFunc() {
	var obj = $("form[role='form']");
	console.log("받은거: " + $("#ch_pass").val() + " " + $("[name=id]").val())
	
	if ($("#ch_pass").val() == "") {
		$("#cir_text").text("새로운 비밀번호를 입력하세요.");
		$("#ch_pass").focus();
		return false;
	};

	if ($("#ch_pass2").val() == "") {
		$("#cir_text").text("비밀번호를 한번 더 적어주세요.");
		$("#ch_pass2").focus();
		return false;
	};

	if ($("#ch_pass").val() != $("#ch_pass2").val()) {
		$("#cir_text").text("비밀번호가 서로 다릅니다.");
		$("#ch_pass2").focus();
		return false;
	};

	obj.submit();
}