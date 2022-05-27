$(document).ready(function() {
    convertCurrency();
});

function convertCurrency() {
    var total = $('#total').text();
    $('#total').text(total.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
    
    var deliveryFee = $('#deliveryFee').text();
    $('#deliveryFee').text(deliveryFee.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
    
    var point = $('#point').text();
    $('#point').text(point.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
    
    var orderTotal = $('#orderTotal').text();
    $('#orderTotal').text(orderTotal.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
}