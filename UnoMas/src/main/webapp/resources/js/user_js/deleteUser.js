function delFunc() {
	
	if($('[name=check_box]').is(':checked') == false) {
		$('[name=warn_text1]').text("*탈퇴 내용을 읽고 체크해주세요.");
		return false;
	} 
	
	if($('[name=pw]').val() == ""){
		$('[name=warn_text2]').text("*비밀번호를 입력하세요.");
		return false;
	} 
	
	$.ajax({
		async: true,
		type : 'POST',
		data: {'user_id' : $('[name=id]').val(), 'user_pass': $('[name=pw]').val() },
		url : "check_pw",
        success : function(result) {
            console.log("비번체크결과: ", result); 
            if (result == "1") { 
				$.ajax({
					async: true,
					type: 'POST',
					data: { 'user_id': $('[name=id]').val(), 'user_pass': $('[name=pw]').val() },
					url: "delete_user",
					success: function(result) {
						if (result == "1") {
							location
						} else {
							$('[name=warn_text2]').text("*탈퇴 실패. 잠시후 다시 시도해주세요.");
						} 
        },
        error : function(error) {
            $("#id").text("*잠시 후 다시 시도해주세요.");
        }
	})
            } else {
				$('[name=warn_text2]').text("*비밀번호가 틀렸습니다.");
            } 
        },
        error : function(error) {
            $("#id").text("*잠시 후 다시 시도해주세요.");
        }
	})
}