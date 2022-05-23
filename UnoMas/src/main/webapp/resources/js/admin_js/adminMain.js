

$("#getAllUserBtn").click(function(){
	
	$.ajax({
		type="GET",
		url: "${contextPath}/admin/all_user",
		contextType="application/json",
		data: JSON.stringify(),
		success: function(userList) {
			alert("조회 성공")
		}, error: function() {
			alert("몰라");
		}
	})
	
	
})