
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
		return;
	}
	
	// 2. 담긴 상품이 있다면 체크박스 갯수 만큼 반복문 돌면서 체크한 상품과 체크 안된 상품을 구분하여, 체크 안된 상품의 주문 수량은 서버쪽에 전달되지 않도록 disabled 처리한다.
	var cnt = 0;
	$.each(chk,function(i,ch){
		if($(ch).is(":checked")){
			cnt++;
			$('#amount'+(i+1)).prop('disabled',false);
		}else{
			// 체크 안된 상품의 주문 수량 비활성화 
			$('#amount'+(i+1)).prop('disabled',true);
		}
	});

	if(cnt==0){
		alert('주문할 상품을 체크하세요.');
		$('input[name="amount"]').prop('disabled',false);
		return;	
	}
	cartForm.submit();
}