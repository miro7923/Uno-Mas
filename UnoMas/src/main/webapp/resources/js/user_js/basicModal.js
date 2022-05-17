$(function(){
	$('#submit').click(function(){
		if($('[name=pw]').val() == ""){
			$('name=warnning-text').text("비밀번호를 입력하세요.")
			return false;
		}
		$.ajax({
			async: true,
			type: 'POST',
			data: {
				'num': $('#user_num').val(),
				'pw': $('[name=pw]').val()
			},
			url: "pw_check",
			success: function(result) {
				console.log("아이디 조회 결과: ", findResult);
				if (findResult == 1) {
					$("#warn-text").text("*이메일을 입력하세요");
				} else if (findResult == 0) {
					$("#result-text").text("*메일을 보낼 수 없습니다. 잠시후에 다시 시도.");
				} else {
					$("#result-text").text("비회원이거나 잘못입력되었습니다. ");
				}
			},
			error: function(error) {
				alert("error : " + error);
			}

		});
	}) 

});

function close_pop() {
	$('#myModal').hide();
	$('[name=warnning-text]').text("");
}

