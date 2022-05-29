var IMP = window.IMP; // 생략 가능

$(document).ready(function() {
    $('#normalAddr').show();
    $('#newAddr').hide();
    
    $('#method_creditCard').show();
    $('#method_bankAccount').hide();
    
    toggleAddrBox();
    toggleUseAllPoints();
    disableDivMonth();
    togglePurchaseMethod();
    toggleCashReciptApply();
    changeIndividualCashReciptType();
    changeCashReciptType();
    convertCurrency(5);
	
	IMP.init("imp02942199"); // 예: imp00000000
});

// 아임포트 결제 API 사용
function requestPay() {
	var addr = '';
	var postalcode = '';
	if ($('input:radio[name=deliverSpot]:checked').val() == 1) {
		// 기본배송지 사용
		addr = $('#roadAddr').val() + ' ' + $('#detailAddr').val();
		postalcode = $('#postalcode').val();
	}
	else {
		// 신규배송지 사용
		addr = $('#newRoadAddress').val() + ' ' + $('#newDetailAddress').val();
		postalcode = $('#newPostalcode').val();
	}
	
    var uid = '';
  // IMP.request_pay(param, callback) 결제창 호출
    IMP.request_pay({ // param
        pg: "html5_inicis",
        pay_method: "card",
        merchant_uid: $('#orderCode').val(),
        name: $('#prodName0').val(),
        amount: $('#total').val(),
        buyer_email: $('#userEmail').text(),
        buyer_name: $('#userName').text(),
        buyer_tel: $('#userPhone').val(),
        buyer_addr: addr,
        buyer_postcode: postalcode
    }, function (rsp) { // callback
        if (rsp.success) { // 결제 성공 시: 결제 승인 또는 가상계좌 발급에 성공한 경우
	    	uid = rsp.imp_uid;
      	  // 결제검증
      		$.ajax({
				url: '/order/verify_iamport/' + rsp.imp_uid,
				type: 'post'
			}).done(function(data) {
				if ($('#total').val() == data.response.amount) {
		        	// jQuery로 HTTP 요청
		        	// @@ 상품 개수만큼 반복문 돌리기... order code는 모두 같아야 한다.
		        	var roadAddr = '';
		        	var detailAddr = '';
		        	var recipient = '';
		        	if ($('input:radio[name=deliverSpot]:checked').val() == 1) {
						roadAddr = $('#roadAddr').val();
						detailAddr = $('#detailAddr').val();
						recipient = $('#name').val();
					}
					else {
						roadAddr = $('#newRoadAddress').val();
						detailAddr = $('#newDetailAddress').val();
						recipient = $('#newName').val();
					}
		        	
		        	
		        	for (var i = 0; i < $('#prodCnt').val(); i++) {
						var orderVO = JSON.stringify({
		                	order_code: $('#orderCode').val(),
		                	cart_num: $('#cartNum'+i).val(),
		                	order_postalcode: postalcode,
		                	order_roadaddr: roadAddr,
		                	order_detailaddr: detailAddr,
		                	user_num: $('#userNum').val(),
		                	prod_num: $('#prodNum'+i).val(),
		                	order_quantity: $('#prodQuantity'+i).val(),
		                	order_total: $('#orderTotal'+i).val(),
		                	user_point: $('#userPoint').val(),
		                	order_recipient: recipient,
		                	order_memo: $('#ask').val()
						});
					
			        	jQuery.ajax({
			            	url: "/order/complete", // 예: https://www.myservice.com/payments/complete
			            	type: "POST",
			            	dataType: 'json',
			            	contentType: 'application/json',
			            	data: orderVO,
			            	success: function(data) {
								if (data != 1) {
									alert('주문정보 생성 실패');
								}
							},
							error: function() {
								alert('주문정보 생성 실패');
							}
			        	});
	        		}
	        	
	        		createPayInfo(uid);
				}
				else {
					alert('결제 실패');
				}
			})
			} else {
        		alert("결제에 실패하였습니다. 에러 내용: " +  rsp.error_msg);
			}
		});
}

function createPayInfo(uid) {
	$.ajax({
		type: 'get',
		url: '/order/pay_info',
		data: {
			'imp_uid': uid,
			'amount': $('#total').val(),
			'ship': $('#shippingFee').val(),
			'point': $('#userPoint').val()
		},
		success: function(data) {
			alert('결제가 완료 되었습니다.');
      		// 결제완료 페이지로 이동
      		location.replace('/order/complete?pay_num='+data);
		},
		error: function() {
			alert('결제정보 저장 통신 실패');
		}
	});
}

function toggleAddrBox() {
    $('input:radio[name=deliverSpot]').change(function() {
        if ($(this).val() == 1) {
            $('#normalAddr').show();
            $('#newAddr').hide();
        }
        else {
            $('#normalAddr').hide();
            $('#newAddr').show(); 
        }
    });
}

function useAllPoints() {
    var curPoint = $('#curPoint').val();
    $('#usingPoint').attr('value', curPoint);
}

function toggleUseAllPoints() {
    $('input:checkbox[name=useAllCheckBox]').change(function() {
        if ($(this).is(':checked') == true) {
            useAllPoints();
        }
    });
}

function disableDivMonth() {
    $('input:radio[name=creditCard]').change(function() {
        if ($(this).val() == 1) {
            $('#divMonth').attr('disabled', false);
        }
        else {
            $('#divMonth').attr('disabled', true);
        }
    });
}

function togglePurchaseMethod() {
    $('input:radio[name=purchaseMethod]').change(function() {
        if ($(this).val() == 1) {
            $('#method_creditCard').show();
            $('#method_bankAccount').hide();
        }
        else {
            $('#method_creditCard').hide();
            $('#method_bankAccount').show();
        }
    });
}

function toggleCashReciptApply() {
    $('input:radio[name=cashRecipt]').change(function() {
        if ($(this).val() == 1) {
            // 현금영수증 신청하기
            $('#cashReciptApply').show();
        }
        else {
            // 신청 안함
            $('#cashReciptApply').hide(); 
        }
    });
}

function changeIndividualCashReciptType() {
    $('select[name=individualCashReciptType]').change(function() {
        if ($(this).val() == 1) {
            // 휴대폰 번호로 현금영수증
            $('#select_phone').show();
            $('#select_citizenNum').hide();
            $('#select_cashReciptCard').hide();
        }
        else if ($(this).val() == 2) {
            // 주민 번호로 현금영수증
            $('#select_phone').hide();
            $('#select_citizenNum').show();
            $('#select_cashReciptCard').hide();
        }
        else {
            // 현금영수증 카드번호로 현금영수증
            $('#select_phone').hide();
            $('#select_citizenNum').hide();
            $('#select_cashReciptCard').show();
        }
    });
}

function changeCashReciptType() {
    $('input:radio[name=cashReciptType]').change(function() {
        if ($(this).val() == 1) {
            // 개인 현금영수증
            $('#cash_individual').show();
            $('#cash_company').hide();
        }
        else {
            // 사업자 현금영수증
            $('#cash_individual').hide();
            $('#cash_company').show();
        }
    });
}

function changeCashReciptInfo() {
    $('#cashReciptChange').show();
    $('#cashReciptNormal').hide();
}

function daumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 참고 항목 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('postalcode').value = data.zonecode;
            document.getElementById("roadAddress").value = roadAddr;

            var guideTextBox = document.getElementById("guide");
            // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
            if(data.autoRoadAddress) {
                var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                guideTextBox.style.display = 'block';
            } else {
                guideTextBox.innerHTML = '';
                guideTextBox.style.display = 'none';
            }
        }
    }).open();
}

function convertCurrency(cnt) {
    for (var i = 0; i < cnt; i++) {
        var id = '#prodPrice' + i;
        var price = $(id).text();
    
        $(id).text(price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
    }
    
    var deliveryFee = $('#deliveryFee').text();
    $('#deliveryFee').text(deliveryFee.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
    
    var totalPrice = $('#totalPrice').text();
    $('#totalPrice').text(totalPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
    
    var point = $('#point').text();
    $('#point').text(point.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
}

function checkCard() {
	if ($('[name=cardSelect] > option:selected').val() == $('#first').val()) {
		alert('카드 종류를 선택하세요!');
	}
	else {
		requestPay();
	}
}