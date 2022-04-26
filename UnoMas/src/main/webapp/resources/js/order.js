$(document).ready(function() {
    $('#normalAddr').show();
    $('#newAddr').hide();
    
    $('#method_creditCard').show();
    $('#method_bankAccount').hide();
    
    toggleAddrBox();
    toggleUseAllPoints();
    disableDivMonth();
    togglePurchaseMethod();
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