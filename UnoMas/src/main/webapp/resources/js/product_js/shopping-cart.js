
function checkSelectAll(){ // 전체체크와 선택체크의 수가 같아야 selectall체크박스 체크on
	const checkboxes = document.querySelectorAll('input[name="cartCheck"]'); // 전체 체크박스
	const checked = document.querySelectorAll('input[name="cartCheck"]:checked'); // 선택된 체크박스
	const selectAll = document.querySelector('input[name="selectall"]'); // selectall 체크박스
	
	if(checkboxes.length === checked.length) {
		selectAll.checked = true;
	} else {
		selectAll.checked = false;
	}
}

function selectAll(selectAll)  { // selectall 체크박스로 on/off
	const checkboxes = document.getElementsByName('cartCheck');
		checkboxes.forEach((checkbox) => {
		checkbox.checked = selectAll.checked
	})
}

$(function(){ // 장바구니 비우기
	$("#btnDelete").click(function(){
		if(confirm("장바구니를 비우시겠습니까?")){
			location.href="/product/cart/deleteAll";
		}
	});
});

function goOrder(){ // 체크박스에 체크한 상품을 가지고 주문 폼페이지로 이동
	// 1. 장바구니에 담긴 상품이 없는 경우
	var chk = $('input[name="cartCheck"]');
	if(chk.length==0){
		alert('장바구니에 담긴 상품이 없습니다!');
		return;
	}
	
	// 2. 담긴 상품이 있다면 체크박스 갯수 만큼 반복문 돌면서 체크한 상품과 체크 안된 상품을 구분하여, 체크 안된 상품의 주문 수량은 서버쪽에 전달되지 않도록 disabled 처리한다.
	var cnt = 0;
	var checked = '';
	$.each(chk,function(i,ch){
		if($(ch).is(":checked")){
			cnt++;
			$('#amount'+(i+1)).prop('disabled',false);
			checked += $('#cartNum'+i).val() + ' ';
		}else{
			// 체크 안된 상품의 주문 수량 비활성화 
			$('#amount'+(i+1)).prop('disabled',true);
		}
	});
	
	$('#selectedItems').val(checked);

	if(cnt==0){
		alert('주문할 상품을 체크하세요.');
		$('input[name="amount"]').prop('disabled',false);
		return;	
	}
	cartForm.submit();
}

$(document).ready(function() {
	var price = '';
	var listLen = $('#listLen').val();
	for (var i = 0; i < listLen; i++) {
		var price = $('#prodPrice'+i).text();
		$('#prodPrice'+i).text(price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
		
		price = $('#prodTotalPrice'+i).text();
		$('#prodTotalPrice'+i).text(price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
	}
	
	price = $('#subTotal').text();
	$('#subTotal').text(price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
	
	price = $('#total').text();
	$('#total').text(price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
});

function calcTotalPrice(idx, type) {
	if (type == 'inc') {
        var q = $('#amount'+(idx+1)).val();
        q++;
        var price = $('#prodOriginPrice'+idx).val();
        var total = q * price;
        $('#prodTotalPrice'+idx).text(total.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
        
        $('#amount'+(idx+1)).attr('value', q);
        
        // DB의 상품 개수 갱신
        $.ajax({
			type: 'get',
			url: '/product/cart/quantity',
			data: {
				'prod_amount': q,
				'prod_num': $('#prod_num'+(idx+1)).val(),
				'cart_num': $('#cartNum'+idx).val()
			},
			success: function(data) {
				if (data == 'complete') {
					alert('장바구니 수량 변경 완료');
				}
			},
			error: function() {
				alert('서버 통신 실패');
			}
		});
		
		// 상품 금액 합계 계산
		// 파라미터로 넘길 input hidden 태그에 넣을 값
        var subTotalVal = $('#inputSubTotal').val();
        var subTotal = Number(subTotalVal) + Number(price);
        $('#inputSubTotal').attr('value', subTotal);
        // 통화에 , 찍어서 화면에 보여줄 값
        $('#subTotal').text(subTotal.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + ' 원');
        
        // 배송비까지 합친 합계 계산
        // 파라미터로 넘길 input hidden 태그에 넣을 값
        var total = subTotal + Number($('#shippingFee').val());
        $('#inputTotal').val(total);
        // 통화에 , 찍어서 화면에 보여줄 값
        $('#total').text(total.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + ' 원');
    }
    else {
        var q = $('#amount'+(idx+1)).val();
        q--;
        if (q >= 1) {
	        var price = $('#prodOriginPrice'+idx).val();
	        var total = q * price;
	        $('#prodTotalPrice'+idx).text(total.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
            
            $('#amount'+(idx+1)).attr('value', q);
		
			// 상품 금액 합계 계산
			// 파라미터로 넘길 input hidden 태그에 넣을 값
	        var subTotalVal = $('#inputSubTotal').val();
	        var subTotal = Number(subTotalVal) - Number(price);
	        $('#inputSubTotal').attr('value', subTotal);
	        // 통화에 , 찍어서 화면에 보여줄 값
	        $('#subTotal').text(subTotal.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + ' 원');
	        
	        // 배송비까지 합친 합계 계산
	        // 파라미터로 넘길 input hidden 태그에 넣을 값
	        var total = subTotal + Number($('#shippingFee').val());
	        $('#inputTotal').val(total);
	        // 통화에 , 찍어서 화면에 보여줄 값
	        $('#total').text(total.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + ' 원');
		}
	}
}