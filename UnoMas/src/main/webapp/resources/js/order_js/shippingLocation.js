$(document).ready(function() {
	getPageNum();
});

function getPageNum() {
	var id = '#page' + $('#curPage').val();
    $(id).css('font-weight', 'bold');
    $(id).css('color', '#B9CE45');
}

function changePageNum(num, maxNum) {    
    var id = '#page' + num;
    
    $(id).css('font-weight', 'bold');
    $(id).css('color', '#B9CE45');
    
    for (var i = 1; i <= maxNum; i++) {
        if (num == i) continue;
        
        id = '#page' + i;
        $(id).css('font-weight', '');
    	$(id).css('color', 'black');
    }
    
    $.ajax({
		type: 'get',
		url: '/order/addr_book?user_num=' + $('#user_num').val() + '&pageNum=' + num,
		success: function(data) {
			$('#pop_wrap').html(data);
			
			getPageNum();
		},
		error: function() {
			alert('통신 실패');
		}
	});
}