function agreeCheck() {
	if($("[name=agreeCheckBox]").is(":checked") == true) {
		location.href="register";
	} else {
		$("[name=warn_text]").text("전체 동의를 해주세요");
	}
}