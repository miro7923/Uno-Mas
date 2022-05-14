$(document).ready(function() {
    $('#totalPrice').text($('#originPrice').val().toString());
    
    convertCurrency();
    calcTotalPrice();
});

function initReview() {
	for (var i = 0; i < 7; i++) {
		var id = '#reviewContent' + i;
		$(id).hide();
	}
}

function toggleReview(num) {
	var id = '#reviewContent' + num;
	$(id).toggle();
    for (var i = 0; i <= 7; i++) {
        id = '#reviewContent' + i;
        if (i == num) continue;
		
        $(id).hide();
    }
}

function updateReviewReadcnt(num) {
	var id = '#reviewContent' + num;
	if ($(id).css('display') == 'none') {		
	    var reId = '#review_num' + num;
	    var reNum = $(reId).val();
	    
		// 조회수 증가
	    $.ajax({
			type: 'get',
			url: '/product/update_readcnt?prod_num='+$('#prod_num').val()+'&review_num='+reNum,
			success: function(data) {
				$('#reviewReadcnt'+num).text(data);
			},
			error: function() {
				alert('조회수 증가 실패');
			}
		});
	}
}

function addLikeCnt(review_num, idNum) {
	$.ajax({
		type: 'get',
		url: '/product/update_likecnt?review_num='+review_num,
		success: function(data) {
			$('#reviewLikecnt' + idNum).text(data);
		},
		error: function() {
			alert('좋아요 증가 실패');
		}
	});
}

function cancelLikeCnt(review_num, idNum) {
	$.ajax({
		type: 'get',
		url: '/product/cancel_like?review_num'+review_num,
		success: function(data) {
			$('#reviewLikecnt' + idNum).text(data);
		},
		error: function(data) {
			alert('좋아요 취소 실패');
		}
	});
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

function toggleWishlistBtn(user_num, prod_num) {
	if ($('#isInWishlist').val() == true) {
		// 위시리스트에 추가되어 있으면 삭제
		$.ajax({
			type: 'get',
			url: '/product/add_wishlist?user_num=' + user_num + '&prod_num=' + prod_num,
			success: function() {
				// 버튼만 새로고침
			}
		});		
	}
	else {
		// 그렇지 않으면 추가
	}
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
}

function askLogin() {
	if (confirm('로그인 한 회원만 장바구니에 담을 수 있습니다. 로그인 하시겠습니까?')) {
		location.href = '/user/login';
	}
}