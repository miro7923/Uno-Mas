function checkLogin(type, login) {
	switch (type) {
		case 'cart':
			if (login) {
				location.href = '/product/cart/list';
			}
			else {
				if (confirm('로그인이 필요한 서비스입니다. 로그인 하시겠습니까?')) {
					location.href = '/user/login';
				}
			}
			break;
		case 'wish':
			if (login) {
				location.href = '/product/wishlist/list';
			}
			else {
				if (confirm('로그인이 필요한 서비스입니다. 로그인 하시겠습니까?')) {
					location.href = '/user/login';
				}
			}
			break;
	}
}