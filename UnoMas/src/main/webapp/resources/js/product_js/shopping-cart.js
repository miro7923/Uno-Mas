
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