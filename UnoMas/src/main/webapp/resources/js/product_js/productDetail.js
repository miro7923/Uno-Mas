$(document).ready(function() {
    $('#totalPrice').text($('#originPrice').val().toString());
    
    convertCurrency();
    calcTotalPrice();
    getPageNum();
});

function initReview() {
	for (var i = 0; i < 7; i++) {
		var id = '#reviewContentBox' + i;
		$(id).hide();
	}
}

function toggleReview(num) {
	var id = '#reviewContentBox' + num;
	$(id).toggle();
    for (var i = 0; i <= 7; i++) {
        id = '#reviewContentBox' + i;
        if (i == num) continue;
		
        $(id).hide();
    }
}

function updateReviewReadcnt(num) {
	var id = '#reviewContentBox' + num;
	if ($(id).css('display') == 'none') {		
	    var reNum = $('#reviewNum' + num).text();
	    
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
	if ($('#isInWishlist').val() == 'true') {
		// 위시리스트에 추가되어 있으면 삭제
		$.ajax({
			type: 'get',
			url: '/product/delete_wishlist?user_num=' + user_num + '&prod_num=' + prod_num,
			success: function() {
				// 버튼만 변경
				$('#isInWishlist').attr('value', false);
				$('#wishlistBtn').attr('class', 'icon_heart_alt');
			},
			error: function() {
				alert('위시리스트 제거 실패');
			}
		});		
	}
	else {
		if (user_num == null) {
			if (confirm('로그인이 필요한 서비스입니다. 로그인 하시겠습니까?'))
				location.href = '/user/login';
		}
		else {			
			// 그렇지 않으면 추가
			$.ajax({
				type: 'get',
				url: '/product/add_wishlist?user_num=' + user_num + '&prod_num=' + prod_num,
				success: function() {
					// 버튼만 변경
					$('#isInWishlist').attr('value', true);
					$('#wishlistBtn').attr('class', 'icon_heart');
				},
				error: function() {
					alert('위시리스트 추가 실패');
				}
			});		
		}
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
		type: 'get',
        url: '/product/insert_cart',
        data: {
            'user_num': $('#user_num').val(),
            'prod_num': $('#prod_num').val(),
            'prod_amount': $('#prod_amount').val()
              },
        success: function() {
            if (confirm('장바구니에 상품을 넣었습니다! 장바구니로 이동 하시겠습니까?'))
            	location.href = '/product/cart/list';
        }
        });
    }
}

function askLogin() {
	if (confirm('로그인이 필요한 서비스입니다. 로그인 하시겠습니까?'))
		location.href = '/user/login';
}

function getPageNum() {
	var id = '#reviewPage' + $('#curReviewPage').val();
    $(id).css('font-weight', 'bold');
    $(id).css('color', '#B9CE45');
    
    id = '#inquiryPage' + $('#curInquiryPage').val();
    $(id).css('font-weight', 'bold');
    $(id).css('color', '#B9CE45');
}

function changePageNum(num, maxNum, boardType) {    
    if (boardType == 'review') {
	    initReview();
	    
	    var id = '#reviewPage' + num;
	    
	    $(id).css('font-weight', 'bold');
	    $(id).css('color', '#B9CE45');
	    
	    for (var i = 1; i <= maxNum; i++) {
	        if (num == i) continue;
	        
	        id = '#reviewPage' + i;
	        $(id).css('font-weight', '');
	    	$(id).css('color', 'black');
	    }
	    
	    $.ajax({
			type: 'get',
			url: '/product/review_list?prod_num=' + $('#prod_num').val() + '&page=' + num,
			success: function(data) {
				$('#reviewListAjax').html(data);
				
				getPageNum();
			},
			error: function() {
				alert('통신 실패');
			}
		});
		
		$('#curReviewPage').val(num);
	}
	else {
		initQna();
		
	    var id = '#inquiryPage' + num;
	    
	    $(id).css('font-weight', 'bold');
	    $(id).css('color', '#B9CE45');
	    
	    for (var i = 1; i <= maxNum; i++) {
	        if (num == i) continue;
	        
	        id = '#inquiryPage' + i;
	        $(id).css('font-weight', '');
	    	$(id).css('color', 'black');
	    }
	    
		$.ajax({
			type: 'get',
			url: '/product/inquiry_list?prod_num=' + $('#prod_num').val() + '&page=' + num,
			success: function(data) {
				$('#inqDiv').html(data);

				getPageNum();
			},
			error: function() {
				alert('통신 실패');
			}
		});
	}
}

function confirmToRemove(type, postNum, prodNum) {
	if (confirm('정말 삭제 하시겠습니까?')) {
		if (type == 'review')
			location.href = '/product/remove_review?review_num=' + postNum + '&prod_num=' + prodNum;
		else 
			location.href = '/product/remove_inquiry?inquiry_num=' + postNum + '&prod_num=' + prodNum;
	}
}