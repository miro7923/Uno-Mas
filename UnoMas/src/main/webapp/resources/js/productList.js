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
	
	var pageNum = '';
	if (urlParams.get('pageNum') != null)
		pageNum = urlParams.get('pageNum');
	else
		pageNum = $('#curPage').val();
	
	const id = '#page' + pageNum;
    $(id).css('font-weight', 'bold');
    $(id).css('color', '#B9CE45');
}

function changeSort(num, maxNum) {
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