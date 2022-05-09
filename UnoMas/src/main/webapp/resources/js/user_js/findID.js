
// 아이디 찾기 함수
function findIdFunc() {
	let name = $("[name=user_name]").val();
	let email = $("[name=user_email]").val();
	
	if (name == "") {
		$("#cir_text").text("이름을 입력하세요.");
		name.focus();
		return false;
	};

	if ( email == "") {
		$("#cir_text").text("이메일을 입력하세요.");
		email.focus();
		return false;
	};
	
	$.ajax({
		async: true,
		type : 'POST',
		data: {'user_name' : name, 'user_email': email },
		url : "find_id",
        success : function(result) {
            console.log("아이디 조회 결과: ", result); 
            if (result == "1") { 
            	$("#find_result").text("아이디를 이메일로 보냈습니다.");	
            	setTimeout("location.href='login', 10000");
            } else if(result == 0) {
				$("#find_result").text("이메일을 보내는데 실패했습니다.");
            } else {
				$("#find_result").text("회원 정보가 없습니다.");
			}
        },
        error : function(error) {
            $("#id").text("*잠시 후 다시 시도해주세요.");
        }
			
	});
	
	
	
}


