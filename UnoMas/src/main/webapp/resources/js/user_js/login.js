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
	
	$.ajax({
		type: "get",
		url: "${contextPath}/user/login",
		data: {loginVO},
		success: function(loginVO) {
			if(result != loginVO)
				$("#cir_text").text("잘못된 아이디 혹은 비밀번호입니다.");
			return false;	
		
		}
	}); 
}