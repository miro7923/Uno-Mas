
function checkSelectAll(){ // 전체체크와 선택체크의 수가 같아야 selectall체크박스 체크on
	const checkboxes = document.querySelectorAll('input[name="wishCheck"]'); // 전체 체크박스
	const checked = document.querySelectorAll('input[name="wishCheck"]:checked'); // 선택된 체크박스
	const selectAll = document.querySelector('input[name="selectall"]'); // selectall 체크박스
			
	if(checkboxes.length === checked.length) {
		selectAll.checked = true;
	} else {
		selectAll.checked = false;
	}
}

function selectAll(selectAll)  { // selectall 체크박스로 on/off
	const checkboxes = document.getElementsByName('wishCheck');
		checkboxes.forEach((checkbox) => {
		checkbox.checked = selectAll.checked
	})
}
	
$(function(){ // 찜 전체삭제
	$("#btnDelete").click(function(){
		if(confirm("찜 목록을 비우시겠습니까?")){
			location.href="/product/wishlist/deleteAllWish";
		}
	});
});

$("#selectDelete_btn").click(function(){ // 찜 선택삭제
	var confirm_val = confirm("정말 삭제하시겠습니까?");
	  
	if(confirm_val) {
		var checkArr = new Array();
	   
		$("input[class='chBox']:checked").each(function(){
			checkArr.push($(this).attr("data-wishNum"));
		});
		    
		$.ajax({
			url : "/product/wishlist/deleteCheckWish",
			type : "post",
			data : { chbox : checkArr },
			success : function(result){
				if(result == 1){
					alert("성공적으로 삭제했습니다.")
					location.href = "/product/wishlist/list";
				} else {
					alert("찜 삭제에 실패했습니다.");
				} 
			}
		});
	} 
});
$("#selectInsertWish_btn").click(function(){ // 장바구니 선택담기
	var checkArr = new Array();
	   
	$("input[class='chBox']:checked").each(function(){
		checkArr.push($(this).attr("data-prodNum"));
	});
		    
	$.ajax({
		url : "/product/wishlist/insertCheckWish",
		type : "post",
		data : { chbox : checkArr },
		success : function(result){
			if(result == 1){
				if (confirm('장바구니에 상품을 넣었습니다! 장바구니로 이동 하시겠습니까?'))
	        	location.href = '/product/cart/list';
			} else {
				alert("장바구니 담기를 실패했습니다.");
			} 
		}
	});
});

function wishToCart() {
    $.ajax({
	    url: '/product/wishlist/insert_cart',
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
