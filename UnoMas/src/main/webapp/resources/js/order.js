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
});

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