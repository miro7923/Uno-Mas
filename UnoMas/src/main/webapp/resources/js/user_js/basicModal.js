let url_pagingNum = 1;
let current_url = new URL(window.location.href);
url_pagingNum = current_url.searchParams.get("pagingNum"); 


function showModal(targetID){
	$('#myModal').show();
	
	$('.modal-submit').click(function(){
		if($('[name=pw]').val() == ""){
			$('[name=warn-text]').text("비밀번호를 입력하세요.")
			return false;
		}
		
		$.ajax({
			async: true,
			type: 'POST',
			data: {
				'user_id': targetID, 
				'user_pass': $('[name=pw]').val()
			},
			url: "/user/delete_user",
			success: function(result) {
				console.log("비번 조회 결과: ", result);
				if (result == "1") {
					$('.modal-submit').removeAttr("onclick");
					$("[name=modal-text]").text("탈퇴완료");
					$('[name=warn-text]').remove();
					$('[name=pw]').remove();
					$('.modal-submit').attr("onclick", `location.href='all_user?pagingNum=${url_pagingNum}'`);
				} else {
					$("[name=warn-text]").text("비밀번호가 틀립니다.");
				}
			},
			error: function(error) {
				alert("error : " + error);
			}

		});

	})

}

function close_pop() {
	$('#myModal').hide();
	$('[name=warnning-text]').text("");
}

