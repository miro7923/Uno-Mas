function passCk(){
	$.ajax({
			async: true,
			type: "POST",
			url: "check_pw",
			data: {
				'user_id' : $("#id").val(),
				'user_pass': $("#pass").val() 
			},
			success: function(result) {
				if(result != "1") {
					$("#cir_text").html("잘못된 비밀번호입니다.");
				} else {
					window.location.href="http://localhost:8088/user/update_myInfo";
				}
			},
			error: function(error) {
				alert("실패");
			}
		}); 
	
}