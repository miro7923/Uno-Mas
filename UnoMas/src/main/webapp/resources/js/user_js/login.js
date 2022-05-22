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
		
		async: true,
		type: "POST",
		url: "login",
		data: {
			'user_id': $("#id").val(), 
			'user_pass': $("#pass").val() 
		},
		success: function(result) {
			if(result != "1") {
				$("#cir_text").html("잘못된 아이디 혹은 비밀번호입니다.");
			} else {
				window.location.replace(document.referrer);
//				window.location.href="http://localhost:8088/index" // 위 코드 안될경우
			}
		},
		error: function(error) {
			alert("실패");
		}
	}); 
}