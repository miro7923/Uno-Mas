$(document).ready(function() {
    $('#category0').css('color', '#dea234');
    $('#category0').css('font-weight', 'bold');
    $('#page1').css('font-weight', 'bold');
});

function changeSort(num, maxNum) {
    var id = '#category' + num;
    
    $(id).css('color', '#dea234');
    $(id).css('font-weight', 'bold');
    
    for (var i = 0; i < maxNum; i++) {
        if (num == i) continue;
        
        id = '#category' + i;
        $(id).css('color', '#212529');
        $(id).css('font-weight', '');
    }
}

function changePageNum(num, maxNum) {
    var id = '#page' + num;
    
    $(id).css('font-weight', 'bold');
    
    for (var i = 1; i <= maxNum; i++) {
        if (num == i) continue;
        
        id = '#page' + i;
        $(id).css('font-weight', '');
    }
}