function insertCart(user_num, prod_num) {
	$.ajax({
		type: 'get',
		url: '/index/insert_cart?user_num='+user_num+'&prod_num='+prod_num+'&prod_amount=1',
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
