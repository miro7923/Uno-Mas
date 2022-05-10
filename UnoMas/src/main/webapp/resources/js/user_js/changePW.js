function changePWFunc() {
	
	var passwdCheck = RegExp(/^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^*()\-_=+\\\|\[\]{};:\'",.<>\/?]).{8,16}$/);	
	
	if ($("[name=newPW]").val() == "") {
		$("#cir_text").text("새로운 비밀번호를 입력하세요.");
		$("[name=newPW]").focus();
		return false;
	};
	
	if (!passwdCheck.test($("[name=newPW]").val())) {
		$("#cir_text").text("*대소문자,특수문자 포함 8~16자로 입력해주세요.");
		$("[name=newPW]").val("");
		$("[name=newPW]").focus();
		return false;
	}

	if ($("[name=newPW_ck]").val() == "") {
		$("#cir_text").text("비밀번호를 한번 더 적어주세요.");
		$("[name=newPW_ck]").focus();
		return false;
	};

	if ($("[name=newPW]").val() != $("[name=newPW_ck]").val()) {
		$("#cir_text").text("비밀번호가 서로 다릅니다.");
		$("[name=newPW]").focus();
		return false;
	};
	
	$("#cir_text").text("");
	
	$.ajax({
		async: true,
		type : 'POST',
		data: {'user_id' : $("[name=id]").val(), 'user_pass': $("[name=newPW]").val() },
		url : "change_pw",
        success : function(result) {
            if (result == "1") { 
            	$(".find_result_text").text("아이디를 이메일로 보냈습니다.");	
            	setTimeout("location.href='login', 20000");
            } else {
				$(".find_result_text").text("비밀번호 변경에 실패했습니다. 다시 시도해주세요.");
            } 
        },
        error : function(error) {
            $(".find_result_text").text("비밀번호 변경에 실패했습니다. 다시 시도해주세요.");
        }
			
	});
}