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