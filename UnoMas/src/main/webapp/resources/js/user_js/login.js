function memberCk(){
	if($("#id").val() == "") {
		$("#cir_text").text("아이디를 입력하세요."); 
		$("#id").focus();
		return false;
	};
	
	if($("#pass").val() == "") {
		$("#cir_text").text("비밀번호를 입력하세요.");
		$("#pass").focus();
		return false;
	};


}