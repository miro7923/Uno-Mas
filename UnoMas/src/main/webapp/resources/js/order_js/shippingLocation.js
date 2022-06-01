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
		url: '/UnoMas/order/addr_book?user_num=' + $('#user_num').val() + '&pageNum=' + num,
		success: function(data) {
			$('#pop_wrap').html(data);
			
			getPageNum();
		},
		error: function() {
			alert('통신 실패');
		}
	});
}

function chooseLocation(num) {
	// 신규배송지로 라디오버튼 선택 변경
	window.opener.$('input:radio[name=deliverSpot]:radio[value="2"]').prop('checked', true);
    window.opener.$('#normalAddr').hide();
    window.opener.$('#newAddr').show(); 
	
	// 각 인풋태그값 세팅
	window.opener.$('#newName').val($('#addr_recipient'+num).text());
	window.opener.$('#newPhone1').val($('#addr_phone'+num).val().substring(0, 3));
	window.opener.$('#newPhone2').val($('#addr_phone'+num).val().substring(3, 7));
	window.opener.$('#newPhone3').val($('#addr_phone'+num).val().substring(7, 11));
	window.opener.$('#newPhone').val($('#addr_phone'+num).val());
	window.opener.$('#newPostalcode').val($('#addr_postalcode'+num).text());
	window.opener.$('#newRoadAddress').val($('#addr_roadaddr'+num).text());
	window.opener.$('#newDetailAddress').val($('#addr_detailaddr'+num).text());
	
	window.close();
}