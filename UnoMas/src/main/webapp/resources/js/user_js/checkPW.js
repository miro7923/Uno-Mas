function passCk(){
	$.ajax({
			async: true,
			type: "POST",
			data: {
				'user_id' : $("[name=user_id]").val(),
				'user_pass': $("[name=user_pass]").val() 
			},
			url: "check_pw",
			success: function(result) {
				if(result != "1") {
					$("#cir_text").html("잘못된 비밀번호입니다.");
				} else {
					window.location.href="/UnoMas/user/update_myInfo";
				}
			},
			error: function(error) {
				alert("실패");
			}
		}); 
	
}