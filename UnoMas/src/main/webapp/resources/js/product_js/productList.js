$(document).ready(function() {
    var id = '#category' + $('#dcateNum').val();
    $(id).css('color', '#B9CE45');
    $(id).css('font-weight', 'bold');
    
    getPageNum();
});

function getPageNum() {
	// 현재 페이지 번호만 강조 처리
	const url = new URL(window.location.href);
	const urlParams = url.searchParams;
	
	var pageNum = '';
	if (urlParams.get('pageNum') != null)
		pageNum = urlParams.get('pageNum');
	else
		pageNum = $('#curPage').val();
	
	const id = '#page' + pageNum;
    $(id).css('font-weight', 'bold');
    $(id).css('color', '#B9CE45');
}

function changeSort(num, start, maxNum) {
    var id = '#category' + num;
    
    $(id).css('color', '#B9CE45');
    $(id).css('font-weight', 'bold');
    
    for (var i = start; i < start + maxNum; i++) {
        if (num == i) continue;
        
        id = '#category' + i;
        $(id).css('color', '#212529');
        $(id).css('font-weight', '');
    }
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
}

function insertCart(user_num, prod_num) {
	$.ajax({
		type: 'get',
		url: '/product/insert_cart?user_num='+user_num+'&prod_num='+prod_num+'&prod_amount=1',
		success: function() {
			if (confirm('상품을 장바구니에 담았습니다! 장바구니로 이동 하시겠어요?'))
				location.href = '/product/cart/list';
		},
		error: function() {
			alert('장바구니에 담기 실패!');
		}
	});
}

function askLogin() {
	if (confirm('로그인이 필요한 서비스입니다. 로그인 하시겠습니까?'))
		location.href = '/user/login';
}