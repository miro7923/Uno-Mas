let url_pagingNum = 1;
let current_url = new URL(window.location.href);

let tempPaging = current_url.searchParams.get("pagingNum"); 
if(tempPaging != 1) { url_pagingNum = tempPaging; }
targetID = "";

function showModal(id){
	$('#myModal').show();	
	targetID = id;
	console.log("아이디 저장: ", id)
}

function pwCheckFunc(){
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


}

function close_pop() {
	$('#myModal').hide();
	$('[name=warnning-text]').text("");
}
