$(document).ready(function() {
    $('#totalPrice').text($('#originPrice').val().toString());
    
    convertCurrency();
    calcTotalPrice();
    insertCart();
});

function initReview() {
	for (var i = 0; i < 7; i++) {
		var id = '#reviewContent' + i;
		$(id).hide();
	}
}

function toggleReview(num) {
    // 선택된 게시글의 본문만 show로 바꾸고 
    var id = '#reviewContent' + num;
    $(id).toggle();
    
    // 나머지는 hide로 변경
    for (var i = 1; i <= 7; i++) {
        if (i == num) continue;
        id = '#reviewContent' + i;
        $(id).hide();
    }
}

function initQna() {
	for (var i = 0; i < 7; i++) {
		var id = '#qnaContent' + i;
		$(id).hide();
	}
}

function toggleQna(num) {
    // 선택된 게시글의 본문만 show로 바꾸고 
    var id = '#qnaContent' + num;
    $(id).toggle();
    
    // 나머지는 hide로 변경
    for (var i = 1; i <= 7; i++) {
        if (i == num) continue;
        id = '#qnaContent' + i;
        $(id).hide();
    }
}

function toggleWishlistBtn() {
    alert('위시리스트 메서드 호출');
}

function calcTotalPrice() {
    $('.inc').click(function() {
        var q = $('#quantity').val();
        q++;
        var price = $('#originPrice').val();
        var total = q * price;
        $('#totalPrice').text(total.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
        
        $('#prod_amount').attr('value', q);
    });
    
    $('.dec').click(function() {
        var q = $('#quantity').val();
        q--;
        if (q >= 0) {
	        var price = $('#originPrice').val();
	        var total = q * price;
	        $('#totalPrice').text(total.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
            
            $('#prod_amount').attr('value', q);
		}
    });
}
 
// 통화에 , 삽입하는 처리
function convertCurrency() {       
    var id = '#price';
    var price = $(id).text();
    
    $(id).text(price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
    
    id = '#totalPrice';
    price = $(id).text();
    
    $(id).text(price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
}

function insertCart() {
    $('#cartBtn').click(function() {
        if ($('#prod_amount').val() <= 0) {
            alert('수량을 1개 이상 선택해 주세요!'); 
        }
        else {
            $.ajax({
            url: '/product/insert_cart',
            data: {
                'user_num': $('#user_num').val(),
                'prod_num': $('#prod_num').val(),
                'prod_amount': $('#prod_amount').val()
                  },
            success: function() {
                alert('장바구니에 상품을 넣었습니다!');
            }
            });
        }
    });
}