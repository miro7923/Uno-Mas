$(document).ready(function() {
    var id = '#category' + $('#dcateNum').val();
    $(id).css('color', '#B9CE45');
    $(id).css('font-weight', 'bold');
    
    getPageNum();
    convertCurrency($('#prodListLen').val());
});

function getPageNum() {
	// 현재 페이지 번호만 강조 처리
	const url = new URL(window.location.href);
	const urlParams = url.searchParams;
	const pageNum = urlParams.get('pageNum');
	
	const id = '#page' + pageNum;
    $(id).css('font-weight', 'bold');
    $(id).css('color', '#B9CE45');
}

function changeSort(num, start, maxNum) {
    var id = '#category' + num;
    
    $(id).css('color', '#B9CE45');
    $(id).css('font-weight', 'bold');
    
    for (var i = start; i < start + maxNum; i++) {
        if (num == i) continue;
        
        id = '#category' + i;
        $(id).css('color', '#212529');
        $(id).css('font-weight', '');
    }
}

function changePageNum(num, maxNum) {
    var id = '#page' + num;
    
    $(id).css('font-weight', 'bold');
    $(id).css('color', '#B9CE45');
    
    for (var i = 1; i <= maxNum; i++) {
        if (num == i) continue;
        
        id = '#page' + i;
        $(id).css('font-weight', '');
    	$(id).css('color', 'black');
    }
}

// 통화에 , 삽입하는 처리
function convertCurrency(cnt) {
    for (var i = 0; i < cnt; i++) {
        var id = '#prod' + i;
        var price = $(id).text();
    
        $(id).text(price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
    }
}